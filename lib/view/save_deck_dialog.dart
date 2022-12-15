import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;

import '/db/database.dart';
import '/providers.dart';
import '/util/nrdb/private.dart';

final deckResultProvider = Provider<DeckNotifierResult>((ref) => throw UnimplementedError());

enum SaveDialogState {
  askToUpload,
  warnOverwriteRemote,
  warnNotConnectedUpload,
  warnNotUploaded,
  saveLocal,
  saveRemote,
}

final dialogStateProvider = StateProvider.autoDispose<SaveDialogState>((ref) {
  final deck = ref.read(deckResultProvider);
  final isConnected = ref.read(nrdbAuthStateProvider).isConnected;
  if (isConnected) {
    final isNewDeck = deck.state == DeckSaveState.isNew;
    if (isNewDeck) {
      return SaveDialogState.askToUpload;
    } else if (deck.syncIssues() == SyncIssues.both) {
      return SaveDialogState.warnOverwriteRemote;
    } else if (deck.synced != null) {
      return SaveDialogState.saveRemote;
    }
    return SaveDialogState.saveLocal;
  } else if (deck.synced != null) {
    return SaveDialogState.warnNotConnectedUpload;
  }
  return SaveDialogState.saveLocal;
}, dependencies: [
  deckResultProvider,
  nrdbAuthStateProvider,
]);

class SaveDeckDialog extends ConsumerWidget {
  const SaveDeckDialog({Key? key}) : super(key: key);

  static Widget withOverrides({
    required DeckNotifierResult deck,
    SaveDialogState? state,
  }) {
    return ProviderScope(
      overrides: [
        deckResultProvider.overrideWithValue(deck),
        if (state != null) dialogStateProvider.overrideWith((ref) => state),
      ],
      child: const SaveDeckDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialogState = ref.watch(dialogStateProvider);
    switch (dialogState) {
      case SaveDialogState.askToUpload:
        return AlertDialog(
          title: const Text('Upload?'),
          content: const Text('Would you like to upload your deck to netrunnerdb.com?'),
          actions: [
            MaterialButton(
              child: const Text('No'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveLocal;
              },
            ),
            MaterialButton(
              child: const Text('Yes'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveRemote;
              },
            ),
          ],
        );
      case SaveDialogState.warnOverwriteRemote:
        return AlertDialog(
          title: const Text('Uploaded deck has changed'),
          content: const Text('This deck on netrunnerdb has unsynced changes. Are you sure you want to overwrite?'),
          actions: [
            MaterialButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
            MaterialButton(
              child: const Text('Overwrite'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveRemote;
              },
            ),
            MaterialButton(
              child: const Text('Save offline'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveLocal;
              },
            ),
          ],
        );
      case SaveDialogState.warnNotConnectedUpload:
        return AlertDialog(
          title: const Text('Uploaded deck has changed'),
          content: const Text('This deck on netrunnerdb has unsynced changes. Are you sure you want to overwrite?'),
          actions: [
            MaterialButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
            MaterialButton(
              child: const Text('Overwrite'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveRemote;
              },
            ),
            MaterialButton(
              child: const Text('Save offline'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveLocal;
              },
            ),
          ],
        );
      case SaveDialogState.warnNotUploaded:
        return AlertDialog(
          title: const Text('Failed to upload'),
          content: const Text('This deck failed to upload.'),
          actions: [
            MaterialButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
            MaterialButton(
              child: const Text('Try again'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveRemote;
              },
            ),
            MaterialButton(
              child: const Text('Save offline'),
              onPressed: () {
                final dialogStateNotifier = ref.read(dialogStateProvider.notifier);
                dialogStateNotifier.state = SaveDialogState.saveLocal;
              },
            ),
          ],
        );
      case SaveDialogState.saveLocal:
        return const SaveDeckLocalDialog();
      case SaveDialogState.saveRemote:
        return const SaveDeckRemoteDialog();
    }
  }
}

class SaveDeckLocalDialog extends ConsumerStatefulWidget {
  const SaveDeckLocalDialog({Key? key}) : super(key: key);

  @override
  SaveDeckLocalDialogState createState() => SaveDeckLocalDialogState();
}

class SaveDeckLocalDialogState extends ConsumerState<SaveDeckLocalDialog> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(), save);
  }

  Future<void> save() async {
    final saveDeck = ref.read(deckResultProvider).copyWith(
          updated: DateTime.now(),
        );
    final cards = saveDeck.cards;
    final tags = saveDeck.tags;

    final db = ref.read(dbProvider);
    final savedDeck = await db.transaction(() async {
      await db.batch((batch) {
        batch.insert<Deck, DeckData>(db.deck, saveDeck, mode: drift.InsertMode.insertOrReplace);
        batch.deleteWhere<DeckCard, DeckCardData>(db.deckCard, (tbl) => tbl.deckId.equals(saveDeck.id));
        batch.insertAll<DeckCard, DeckCardData>(db.deckCard, [
          for (final entry in cards.entries)
            if (entry.value > 0)
              DeckCardData(
                deckId: saveDeck.id,
                cardCode: entry.key,
                quantity: entry.value,
              ),
        ]);
        batch.deleteWhere<DeckTag, DeckTagData>(db.deckTag, (tbl) => tbl.deckId.equals(saveDeck.id));
        batch.insertAll<DeckTag, DeckTagData>(db.deckTag, [
          for (final tag in tags)
            DeckTagData(
              deckId: saveDeck.id,
              tag: tag,
            ),
        ]);
      });
      return await db
          .listMiniDecks(where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
            return deck.id.equals(saveDeck.id);
          })
          .map((e) => e.first)
          .first;
    });

    if (!mounted) return;
    Navigator.of(context).pop(savedDeck);
  }

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Saving Deck...'),
      content: SizedBox(
        width: 48,
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class SaveDeckRemoteDialog extends ConsumerStatefulWidget {
  const SaveDeckRemoteDialog({Key? key}) : super(key: key);

  @override
  SaveDeckRemoteDialogState createState() => SaveDeckRemoteDialogState();
}

class SaveDeckRemoteDialogState extends ConsumerState<SaveDeckRemoteDialog> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(), save);
  }

  Future<void> save() async {
    final dialogStateNotifier = ref.read(dialogStateProvider.notifier);

    final nrdbAuthState = ref.read(nrdbAuthStateProvider);
    final onlineAuthState = await nrdbAuthState.online();
    if (onlineAuthState == null) {
      dialogStateNotifier.state = SaveDialogState.warnNotUploaded;
      return;
    }

    final deck = ref.read(deckResultProvider);
    final result = await onlineAuthState
        .saveDeck(deck) //
        .catchError((e) => const UnknownHttpResult<NrdbDeck>());
    if (result is! SuccessHttpResult<NrdbDeck>) {
      dialogStateNotifier.state = SaveDialogState.warnNotUploaded;
      return;
    }

    final db = ref.read(dbProvider);
    final savedDeck = await db.transaction(() async {
      final uploadedDeck = result.value;
      if (deck.id != uploadedDeck.id) {
        await db.deleteDecks(deckIds: [deck.id]);
        await db.deleteDeckCards(deckIds: [deck.id]);
        await db.deleteDeckTags(deckIds: [deck.id]);
      }

      await db.batch((batch) async {
        await onlineAuthState.syncWithLocalDeck(
          db,
          batch,
          uploadedDeck,
          formatCode: drift.Value(deck.formatCode),
          rotationCode: drift.Value(deck.rotationCode),
          mwlCode: drift.Value(deck.mwlCode),
        );
      });
      return await db
          .listMiniDecks(where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
            return deck.id.equals(uploadedDeck.id);
          })
          .map((e) => e.first)
          .first;
    });

    if (!mounted) return;
    Navigator.of(context).pop(savedDeck);
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(dialogStateProvider));
    return const AlertDialog(
      title: Text('Uploading Deck...'),
      content: SizedBox(
        width: 48,
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

enum DownloadDialogState {
  download,
  warnNotDownloaded,
}

final downloadDialogStateProvider = StateProvider((ref) => DownloadDialogState.download);

class DownloadDeckDialog extends ConsumerWidget {
  const DownloadDeckDialog({Key? key}) : super(key: key);

  static withOverrides({
    required DeckNotifierResult deck,
  }) {
    return ProviderScope(
      overrides: [
        deckResultProvider.overrideWithValue(deck),
      ],
      child: const DownloadDeckDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadDialogState = ref.watch(downloadDialogStateProvider.notifier);
    switch (downloadDialogState.state) {
      case DownloadDialogState.download:
        return const DownloadDeckProgressDialog();
      case DownloadDialogState.warnNotDownloaded:
        return AlertDialog(
          title: const Text('Failed to download'),
          content: const Text('This deck failed to download.'),
          actions: [
            MaterialButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
            MaterialButton(
              child: const Text('Try again'),
              onPressed: () => downloadDialogState.state = DownloadDialogState.download,
            ),
          ],
        );
    }
  }
}

class DownloadDeckProgressDialog extends ConsumerStatefulWidget {
  const DownloadDeckProgressDialog({Key? key}) : super(key: key);

  @override
  DownloadDeckProgressDialogState createState() => DownloadDeckProgressDialogState();
}

class DownloadDeckProgressDialogState extends ConsumerState<DownloadDeckProgressDialog> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(), download);
  }

  Future<void> download() async {
    final nrdbAuthState = ref.read(nrdbAuthStateProvider);
    final onlineAuthState = await nrdbAuthState.online();
    if (onlineAuthState == null) {
      ref.read(downloadDialogStateProvider.notifier).state = DownloadDialogState.warnNotDownloaded;
      return;
    }

    final deck = ref.read(deckResultProvider);
    final result = await onlineAuthState
        .getDeck(deck.id) //
        .catchError((e) => const UnknownHttpResult<NrdbDeck>());
    if (result is! SuccessHttpResult<NrdbDeck>) {
      ref.read(downloadDialogStateProvider.notifier).state = DownloadDialogState.warnNotDownloaded;
      return;
    }

    final db = ref.read(dbProvider);
    final savedDeck = await db.transaction(() async {
      final downloadedDeck = result.value;
      if (deck.id != downloadedDeck.id) {
        await db.deleteDecks(deckIds: [deck.id]);
        await db.deleteDeckCards(deckIds: [deck.id]);
        await db.deleteDeckTags(deckIds: [deck.id]);
      }

      await db.batch((batch) async {
        await onlineAuthState.syncWithLocalDeck(
          db,
          batch,
          downloadedDeck,
          formatCode: drift.Value(deck.formatCode),
          rotationCode: drift.Value(deck.rotationCode),
          mwlCode: drift.Value(deck.mwlCode),
        );
      });
      return await db
          .listMiniDecks(
            where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
              return deck.id.equals(downloadedDeck.id);
            },
          )
          .map((e) => e.first)
          .first;
    });

    if (!mounted) return;
    Navigator.of(context).pop(savedDeck);
  }

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Downloading Deck...'),
      content: SizedBox(
        width: 48,
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
