import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/nrdb/private.dart';
import '/view/deck_compare/page.dart';
import '/view/search_theme.dart';

class DeckSelectedActions extends ConsumerWidget {
  const DeckSelectedActions({super.key});

  Future<void> compare(BuildContext context, WidgetRef ref) async {
    final navigator = Navigator.of(context);
    final db = ref.read(dbProvider);
    final selectedDeckIds = ref.read(selectedDeckIdsProvider).value;
    final selectedDecks = await db.listMicroDecks(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(selectedDeckIds);
      },
    ).first;
    navigator.restorablePush(
      DeckComparePage.route,
      arguments: DeckCompareArguments(selectedDecks.toSet()).toJson(),
    );
  }

  Future<void> upload(BuildContext context, WidgetRef ref) async {
    final authState = await ref.read(nrdbAuthStateProvider).online();
    if (authState == null) {
      await showDialog(
        context: context,
        builder: (context) => const SimpleDialog(
          title: Text('Not online'),
        ),
      );
      return;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Upload selected decks?'),
        content: const Text(
            'This will replace the selected decks with the linked deck on netrunnerdb. Any decks that haven\'t yet been uploaded will be.'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Upload'),
          ),
        ],
      ),
    );
    if (result != true) return;

    final db = ref.read(dbProvider);
    final selectedDeckIds = ref.read(selectedDeckIdsProvider);
    final selectedDecks = await db.listMiniDecks(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(selectedDeckIds.value);
      },
    ).first;
    await authState.forceUpload(db, selectedDecks);
    selectedDeckIds.value = {};
  }

  Future<void> download(BuildContext context, WidgetRef ref) async {
    final authState = await ref.read(nrdbAuthStateProvider).online();
    if (authState == null) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Not online'),
          actions: [
            MaterialButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
        ),
      );
      return;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Download selected decks?'),
        content: const Text('This will replace the selected decks with the linked deck on netrunnerdb.'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Download'),
          ),
        ],
      ),
    );
    if (result != true) return;

    final db = ref.read(dbProvider);
    final selectedDeckIds = ref.read(selectedDeckIdsProvider);
    final selectedDecks = await db.listMiniDecks(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(selectedDeckIds.value);
      },
    ).first;
    await authState.forceDownload(db, selectedDecks);
    selectedDeckIds.value = {};
  }

  Future<void> copy(BuildContext context, WidgetRef ref) async {
    final db = ref.read(dbProvider);
    final selectedDeckIds = ref.read(selectedDeckIdsProvider);
    final selectedDecks = await db.listMiniDecks(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(selectedDeckIds.value);
      },
    ).first;
    await db.transaction(() async {
      final now = DateTime.now().toUtc();
      for (final selectedDeck in selectedDecks) {
        final newDeck = await db.copyDeck(selectedDeck, now: now);
        await db.copyDeckCards(newDeckId: newDeck.id, oldDeckId: selectedDeck.id);
        await db.copyDeckTags(newDeckId: newDeck.id, oldDeckId: selectedDeck.id);
      }
    });
    selectedDeckIds.value = {};
  }

  Future<void> delete(BuildContext context, WidgetRef ref) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete selected decks?'),
        content: const Text('Are you sure you want to delete the selected decks?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (result != true) return;

    final db = ref.read(dbProvider);
    final selectedDecksState = ref.read(selectedDeckIdsProvider);
    final selectedDeckIds = selectedDecksState.value.toList();
    await db.transaction(() async {
      await db.deleteDecks(deckIds: selectedDeckIds);
      await db.deleteDeckCards(deckIds: selectedDeckIds);
      await db.deleteDeckTags(deckIds: selectedDeckIds);
    });
    selectedDecksState.value = {};
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(nrdbAuthStateProvider.select((value) => value.isConnected));
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry>[
          PopupMenuItem(
            child: const ListTile(title: Text('Compare')),
            onTap: () => Future(() => compare(context, ref)),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            enabled: isConnected,
            child: ListTile(enabled: isConnected, title: const Text('Upload')),
            onTap: () => Future(() => upload(context, ref)),
          ),
          PopupMenuItem(
            enabled: isConnected,
            child: ListTile(enabled: isConnected, title: const Text('Download')),
            onTap: () => Future(() => download(context, ref)),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: const ListTile(title: Text('Copy')),
            onTap: () => Future(() => copy(context, ref)),
          ),
          PopupMenuItem(
            child: const ListTile(title: Text('Delete')),
            onTap: () => Future(() => delete(context, ref)),
          ),
        ],
      ),
    );
  }
}

class DeckSelectedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DeckSelectedAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDecks = ref.watch(selectedDeckIdsProvider);
    final theme = SearchTheme.of(context);
    return WillPopScope(
      onWillPop: () async {
        selectedDecks.value = {};
        return false;
      },
      child: Theme(
        data: theme,
        child: AppBar(
          leading: const BackButton(),
          title: Text('${selectedDecks.value.length} selected'),
          actions: const [
            DeckSelectedActions(),
          ],
        ),
      ),
    );
  }
}
