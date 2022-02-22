import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/nrdb/private.dart';
import 'card_gallery_page.dart';
import 'card_list/page.dart';
import 'card_tile.dart';
import 'deck/page.dart';
import 'deck_list/fab.dart';
import 'deck_list/page.dart';
import 'deck_tile.dart';
import 'settings/page.dart';

class BottomNavigationItem {
  const BottomNavigationItem({
    required this.body,
    required this.item,
    this.floatingActionButton,
  });

  final Widget body;
  final BottomNavigationBarItem item;
  final Widget? floatingActionButton;
}

final itemsProvider = Provider<List<BottomNavigationItem>>((ref) {
  final settings = ref.watch(settingResultProvider);
  return [
    BottomNavigationItem(
      body: CardListPage.withOverrides(
        automaticallyImplyLeading: false,
        title: 'Cards',
        filterCollection: settings.settings.filterCollection,
        filterFormat: settings.filterFormat,
        filterRotation: settings.filterRotation,
        filterMwl: settings.filterMwl,
        cardTile: (context, ref, index, card) => CardTile(
          card,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardGalleryPage.withOverrides(
              groupedCardList: ref.read(groupedCardListProvider),
              currentIndex: index,
            );
          })),
        ),
      ),
      item: BottomNavigationBarItem(
        icon: Assets.icons.cards.image(height: 24, color: Colors.grey[600]),
        activeIcon: Assets.icons.cards.image(height: 24, color: Colors.blueAccent),
        label: 'Cards',
      ),
    ),
    BottomNavigationItem(
      body: DeckListPage.withOverrides(
        title: 'Decks',
        filterFormat: settings.filterFormat,
        filterRotation: settings.filterRotation,
        filterMwl: settings.filterMwl,
        deckTile: (context, ref, index, deck) {
          final tags = ref.watch(filterTagsProvider.state);
          final selectedDecks = ref.watch(selectedDecksProvider.state);
          final selected = selectedDecks.state.contains(deck);
          return DeckTile(
            deck: deck,
            selected: selected,
            selectedTags: tags.state,
            onTap: () {
              if (selectedDecks.state.isEmpty) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return DeckPage.withOverrides(deck: deck);
                }));
              } else {
                selectedDecks.state = {
                  ...selectedDecks.state.where((e) => e != deck),
                  if (!selected) deck,
                };
              }
            },
            onLongPress: () {
              selectedDecks.state = {
                ...selectedDecks.state,
                deck,
              };
            },
            onTagTap: (tag, value) {
              tags.state = {
                ...tags.state.where((e) => e != tag),
                if (value) tag,
              };
            },
          );
        },
      ),
      floatingActionButton: const DeckListFloatingActionBar(),
      item: BottomNavigationBarItem(
        icon: Assets.icons.decks.image(height: 24, color: Colors.grey[600]),
        activeIcon: Assets.icons.decks.image(height: 24, color: Colors.blueAccent),
        label: 'Decks',
      ),
    ),
    const BottomNavigationItem(
      body: SettingsPage(),
      item: BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        activeIcon: Icon(Icons.settings, color: Colors.blueAccent),
        label: 'Settings',
      ),
    ),
  ];
}, dependencies: [settingResultProvider]);

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final authState = ref.read(nrdbAuthStateProvider);
      if (authState is InitAuthState) {
        AuthState.refreshToken(authState.ref);
      }
    });

    ref.listen<AsyncValue<bool>>(hasInternetProvider, (prev, next) {
      next.whenData((hasInternet) {
        final nrdbAuthState = ref.read(nrdbAuthStateProvider);
        if (nrdbAuthState is OfflineAuthState) {
          nrdbAuthState.refreshToken();
        } else if (nrdbAuthState is OnlineAuthState) {
          nrdbAuthState.refreshToken();
        }
      });
    });

    ref.listen<Object?>(shouldSyncProvider, (previous, next) async {
      print(next);
      if (next is OnlineAuthState) {
        final decks = await next.listDecks();
        print(decks);
        if (decks is SuccessHttpResult<List<NrdbDeck>>) {
          final db = ref.read(dbProvider);
          await next.syncDecks(db, decks.value);
        }
      }
    });

    final settings = ref.watch(initSettingsProvider);
    return settings.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Netdeck')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stacktrace) => Scaffold(
        appBar: AppBar(title: const Text('Netdeck')),
        body: Text(error.toString()),
      ),
      data: (data) => _MainPage.withOverrides(settings: data),
    );
  }
}

class _MainPage extends ConsumerWidget {
  const _MainPage({Key? key}) : super(key: key);

  static withOverrides({
    required SettingResult settings,
  }) {
    return ProviderScope(
      overrides: [
        settingResultProvider.overrideWithValue(settings),
      ],
      child: const _MainPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedIndexProvider.state);
    final items = ref.watch(itemsProvider);
    final selected = items[index.state];

    return Scaffold(
      body: IndexedStack(
        index: index.state,
        children: items.map((e) => e.body).toList(),
      ),
      floatingActionButton: selected.floatingActionButton,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index.state,
        items: items.map((e) => e.item).toList(),
        onTap: (value) {
          index.state = value;
        },
      ),
    );
  }
}
