import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/view/deck_compare/page.dart';
import '/view/search_theme.dart';

class DeckSelectedActions extends ConsumerWidget {
  const DeckSelectedActions({Key? key}) : super(key: key);

  Future<void> compare(BuildContext context, WidgetRef ref) async {
    final selectedDecks = ref.read(selectedDecksProvider);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DeckComparePage.withOverrides(
        deckList: selectedDecks,
      );
    }));
  }

  Future<void> copy(BuildContext context, WidgetRef ref) async {
    final db = ref.read(dbProvider);
    final selectedDecksState = ref.read(selectedDecksProvider.state);
    await db.transaction(() async {
      final now = DateTime.now().toUtc();
      for (final selectedDeck in selectedDecksState.state) {
        final newDeck = await db.copyDeck(selectedDeck.deck, now: now);
        await db.copyDeckCards(newDeckId: newDeck.id, oldDeckId: selectedDeck.deck.id);
        await db.copyDeckTags(newDeckId: newDeck.id, oldDeckId: selectedDeck.deck.id);
      }
    });
    selectedDecksState.state = {};
  }

  Future<void> delete(BuildContext context, WidgetRef ref) async {
    final db = ref.read(dbProvider);
    final selectedDecksState = ref.read(selectedDecksProvider.state);
    final selectedDecks = selectedDecksState.state.map((e) => e.deck.id).toList();
    await db.transaction(() async {
      await db.deleteDecks(deckIds: selectedDecks);
      await db.deleteDeckCards(deckIds: selectedDecks);
      await db.deleteDeckTags(deckIds: selectedDecks);
    });
    selectedDecksState.state = {};
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(nrdbAuthStateProvider.select(
      (value) => value.map(
        init: (state) => false,
        connecting: (state) => false,
        offline: (state) => true,
        online: (state) => true,
        unauthenticated: (state) => false,
      ),
    ));
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
            onTap: () {},
          ),
          PopupMenuItem(
            enabled: isConnected,
            child: ListTile(enabled: isConnected, title: const Text('Download')),
            onTap: () {},
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: const ListTile(title: Text('Copy')),
            onTap: () => copy(context, ref),
          ),
          PopupMenuItem(
            child: const ListTile(title: Text('Delete')),
            onTap: () => delete(context, ref),
          ),
        ],
      ),
    );
  }
}

class DeckSelectedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DeckSelectedAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDecks = ref.watch(selectedDecksProvider.state);
    final theme = SearchTheme.of(context);
    return WillPopScope(
      onWillPop: () async {
        selectedDecks.state = {};
        return false;
      },
      child: Theme(
        data: theme,
        child: AppBar(
          leading: const BackButton(),
          title: Text('${selectedDecks.state.length} selected'),
          actions: const [
            DeckSelectedActions(),
          ],
        ),
      ),
    );
  }
}
