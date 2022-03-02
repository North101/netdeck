import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/nrdb/private.dart';

enum SaveLocation {
  local,
  remote,
}

Future<SaveLocation?> whereToSave(BuildContext context, WidgetRef ref) async {
  final deck = ref.read(deckProvider);
  final isConnected = ref.read(nrdbAuthStateProvider).map(
        init: (state) => false,
        connecting: (state) => true,
        offline: (state) => true,
        online: (state) => true,
        unauthenticated: (state) => false,
      );
  if (isConnected) {
    final db = ref.read(dbProvider);
    final isNewDeck = await db.listDecks(where: db.deck.id.equals(deck.deck.id)).getSingleOrNull() == null;
    if (isNewDeck) {
      return await askToUpload(context);
    } else if (deck.syncIssues() == SyncIssues.both) {
      return await warnOverwriteRemote(context);
    } else if (deck.deck.synced != null) {
      return SaveLocation.remote;
    }
    return SaveLocation.local;
  } else if (deck.deck.synced != null) {
    return await warnNotConnectedUpload(context);
  }
  return SaveLocation.local;
}

Future<SaveLocation?> askToUpload(BuildContext context) async {
  return await showDialog<SaveLocation>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Upload?'),
        content: const Text('Would you like to upload your deck to netrunnerdb.com?'),
        actions: [
          MaterialButton(
            child: const Text('Yes'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.remote),
          ),
          MaterialButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.local),
          ),
        ],
      );
    },
  );
}

Future<SaveLocation?> warnOverwriteRemote(BuildContext context) async {
  return await showDialog<SaveLocation>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Uploaded deck has changed'),
        content: const Text('This deck on netrunnerdb has unsynced changes. Are you sure you want to overwrite?'),
        actions: [
          MaterialButton(
            child: const Text('Overwrite'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.remote),
          ),
          MaterialButton(
            child: const Text('Save offline'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.local),
          ),
          MaterialButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      );
    },
  );
}

Future<SaveLocation?> warnNotConnectedUpload(BuildContext context) async {
  return await showDialog<SaveLocation>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Not online'),
        content: const Text('This deck has been uploaded to netrunnerdb but you are not currently online.'),
        actions: [
          MaterialButton(
            child: const Text('Save offline'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.local),
          ),
          MaterialButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      );
    },
  );
}

Future<SaveLocation?> warnNotDownloaded(BuildContext context) async {
  return await showDialog<SaveLocation>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Failed to download'),
        content: const Text('This deck failed to download.'),
        actions: [
          MaterialButton(
            child: const Text('Try again'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.remote),
          ),
          MaterialButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      );
    },
  );
}

Future<SaveLocation?> warnNotUploaded(BuildContext context) async {
  return await showDialog<SaveLocation>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Failed to upload'),
        content: const Text('This deck failed to upload.'),
        actions: [
          MaterialButton(
            child: const Text('Try again'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.remote),
          ),
          MaterialButton(
            child: const Text('Save offline'),
            onPressed: () => Navigator.of(context).pop(SaveLocation.local),
          ),
          MaterialButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      );
    },
  );
}

Future<void> save(BuildContext context, WidgetRef ref) async {
  final db = ref.read(dbProvider);
  final deckNotifier = ref.read(deckProvider.notifier);
  final deckResult = deckNotifier.value;

  final deck = deckResult.deck.copyWith(
    updated: DateTime.now(),
  );
  final cards = deckResult.cards;
  final tags = deckResult.tags;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(
      content: Text('Saving deck...'),
    ));
  deckNotifier.value = await db.transaction(() async {
    await db.batch((batch) {
      batch.insert<Deck, DeckData>(db.deck, deck, mode: drift.InsertMode.insertOrReplace);
      batch.deleteWhere<DeckCard, DeckCardData>(db.deckCard, (tbl) => tbl.deckId.equals(deck.id));
      batch.insertAll<DeckCard, DeckCardData>(db.deckCard, [
        ...cards.entries.map(
          (entry) => DeckCardData(
            deckId: deck.id,
            cardCode: entry.key.code,
            quantity: entry.value,
          ),
        ),
      ]);
      batch.deleteWhere<DeckTag, DeckTagData>(db.deckTag, (tbl) => tbl.deckId.equals(deck.id));
      batch.insertAll<DeckTag, DeckTagData>(db.deckTag, [
        ...tags.map(
          (e) => DeckTagData(
            deckId: deck.id,
            tag: e,
          ),
        ),
      ]);
    });
    return await db.listDecks2(where: db.deck.id.equals(deck.id)).map((e) => e.first).first;
  });
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(
      content: Text('Deck saved.'),
    ));
}

Future<void> upload(BuildContext context, WidgetRef ref) async {
  final db = ref.read(dbProvider);
  final deckNotifier = ref.read(deckProvider.notifier);
  final deckResult = deckNotifier.value;
  final nrdbAuthState = ref.read(nrdbAuthStateProvider);
  OnlineAuthState? onlineAuthState;
  while (onlineAuthState == null) {
    onlineAuthState = await nrdbAuthState
        .maybeMap(
          connecting: (state) => state.future.then((value) => value.mapOrNull(online: (state) => state)),
          offline: (state) => state.refreshToken().then((value) => value.mapOrNull(online: (state) => state)),
          online: (state) => Future.value(state),
          orElse: () => Future.value(null),
        )
        .catchError((e) => Future.value(null));
    if (onlineAuthState == null) {
      final saveLocation = await warnNotUploaded(context);
      if (saveLocation == null) {
        return;
      } else if (saveLocation == SaveLocation.local) {
        return save(context, ref);
      }
    }
  }

  NrdbDeck? uploadedDeck;
  while (uploadedDeck == null) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text('Uploading deck...'),
      ));
    final result = await onlineAuthState.saveDeck(deckResult).catchError((e) => const UnknownHttpResult<NrdbDeck>());
    if (result is SuccessHttpResult<NrdbDeck>) {
      uploadedDeck = result.value;
    } else {
      uploadedDeck = null;
    }
    if (uploadedDeck == null) {
      final saveLocation = await warnNotUploaded(context);
      if (saveLocation == null) {
        return;
      } else if (saveLocation == SaveLocation.local) {
        return save(context, ref);
      }
    }
  }

  deckNotifier.value = await db.transaction(() async {
    if (deckResult.deck.id != uploadedDeck!.id) {
      await db.deleteDecks(deckIds: [deckResult.deck.id]);
      await db.deleteDeckCards(deckIds: [deckResult.deck.id]);
      await db.deleteDeckTags(deckIds: [deckResult.deck.id]);
    }

    await db.batch((batch) async {
      await onlineAuthState!.syncWithLocalDeck(
        db,
        batch,
        uploadedDeck!,
        formatCode: drift.Value(deckResult.deck.formatCode),
        rotationCode: drift.Value(deckResult.deck.rotationCode),
        mwlCode: drift.Value(deckResult.deck.mwlCode),
      );
    });
    return await db.listDecks2(where: db.deck.id.equals(uploadedDeck.id)).map((e) => e.first).first;
  });
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(
      content: Text('Deck uploaded.'),
    ));
}

Future<void> download(BuildContext context, WidgetRef ref) async {
  final db = ref.read(dbProvider);
  final deckNotifier = ref.read(deckProvider.notifier);
  final deckResult = deckNotifier.value;
  final nrdbAuthState = ref.read(nrdbAuthStateProvider);
  OnlineAuthState? onlineAuthState;
  while (onlineAuthState == null) {
    onlineAuthState = await nrdbAuthState
        .maybeMap(
          connecting: (state) => state.future.then((value) => value.mapOrNull(online: (state) => state)),
          offline: (state) => state.refreshToken().then((value) => value.mapOrNull(online: (state) => state)),
          online: (state) => Future.value(state),
          orElse: () => Future.value(null),
        )
        .catchError((e) => Future.value(null));
    if (onlineAuthState == null) {
      final saveLocation = await warnNotDownloaded(context);
      if (saveLocation == null) {
        return;
      }
    }
  }

  NrdbDeck? downloadedDeck;
  while (downloadedDeck == null) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text('Downloading deck...'),
      ));
    final result = await onlineAuthState.getDeck(deckResult.deck.id);
    if (result is SuccessHttpResult<NrdbDeck>) {
      downloadedDeck = result.value;
    } else {
      downloadedDeck = null;
    }
    if (downloadedDeck == null) {
      final saveLocation = await warnNotDownloaded(context);
      if (saveLocation == null) {
        return;
      }
    }
  }

  deckNotifier.value = await db.transaction(() async {
    if (deckResult.deck.id != downloadedDeck!.id) {
      await db.deleteDecks(deckIds: [deckResult.deck.id]);
      await db.deleteDeckCards(deckIds: [deckResult.deck.id]);
      await db.deleteDeckTags(deckIds: [deckResult.deck.id]);
    }

    await db.batch((batch) async {
      await onlineAuthState!.syncWithLocalDeck(
        db,
        batch,
        downloadedDeck!,
        formatCode: drift.Value(deckResult.deck.formatCode),
        rotationCode: drift.Value(deckResult.deck.rotationCode),
        mwlCode: drift.Value(deckResult.deck.mwlCode),
      );
    });
    return await db.listDecks2(where: db.deck.id.equals(downloadedDeck.id)).map((e) => e.first).first;
  });
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(
      content: Text('Deck downloaded.'),
    ));
}
