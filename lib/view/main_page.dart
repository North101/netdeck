import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/filter_type.dart';
import '/util/nrdb/private.dart';
import '/view/card_list/appbar.dart';
import '/view/card_list/body.dart';
import 'card_gallery_page.dart';
import 'card_tile.dart';
import 'deck/page.dart';
import 'deck_list/appbar.dart';
import 'deck_list/body.dart';
import 'deck_list/fab.dart';
import 'deck_tile.dart';
import 'settings/appbar.dart';
import 'settings/body.dart';

class BottomNavigationItem {
  const BottomNavigationItem({
    required this.appBar,
    required this.body,
    required this.item,
    this.floatingActionButton,
  });

  final Widget appBar;
  final Widget body;
  final BottomNavigationBarItem item;
  final Widget? floatingActionButton;
}

class CardListBottomNavigationItem extends BottomNavigationItem {
  CardListBottomNavigationItem({
    required Widget appBar,
    required Widget body,
    required BottomNavigationBarItem item,
    Widget? floatingActionButton,
  }) : super(
          appBar: appBar,
          body: body,
          item: item,
          floatingActionButton: floatingActionButton,
        );

  factory CardListBottomNavigationItem.fromSettings(SettingResult settings) {
    final cardListOverrides = [
      filterSearchingProvider.overrideWithValue(StateController(false)),
      filterQueryProvider.overrideWithValue(StateController(null)),
      filterCollectionProvider.overrideWithValue(StateController(settings.settings.filterCollection)),
      filterFormatProvider.overrideWithValue(StateController(settings.filterFormat)),
      filterRotationProvider.overrideWithValue(StateController(settings.filterRotation)),
      filterMwlProvider.overrideWithValue(StateController(settings.filterMwl)),
      filterPacksProvider.overrideWithValue(StateController(FilterType())),
      filterSidesProvider.overrideWithValue(StateController(FilterType())),
      filterFactionsProvider.overrideWithValue(StateController(FilterType())),
      filterTypesProvider.overrideWithValue(StateController(FilterType())),
      cardTileProvider.overrideWithValue((context, ref, index, card) {
        return CardTile(
          card,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardGalleryPage.withOverrides(
              groupedCardList: ref.read(groupedCardListProvider),
              currentIndex: index,
            );
          })),
        );
      }),
    ];

    return CardListBottomNavigationItem(
      appBar: ProviderScope(
        overrides: cardListOverrides,
        child: const CardListAppBar(
          title: 'Cards',
          automaticallyImplyLeading: false,
        ),
      ),
      body: ProviderScope(
        overrides: cardListOverrides,
        child: const CardListBody(),
      ),
      item: BottomNavigationBarItem(
        icon: Assets.icons.cards.image(height: 24, color: Colors.grey[600]),
        activeIcon: Assets.icons.cards.image(height: 24, color: Colors.blueAccent),
        label: 'Cards',
      ),
    );
  }
}

class DeckListBottomNavigationItem extends BottomNavigationItem {
  DeckListBottomNavigationItem({
    required Widget appBar,
    required Widget body,
    required BottomNavigationBarItem item,
    Widget? floatingActionButton,
  }) : super(
          appBar: appBar,
          body: body,
          item: item,
          floatingActionButton: floatingActionButton,
        );

  factory DeckListBottomNavigationItem.fromSettings(SettingResult settings) {
    final deckListOverrides = [
      filterSearchingProvider.overrideWithValue(StateController(false)),
      filterQueryProvider.overrideWithValue(StateController(null)),
      filterFormatProvider.overrideWithValue(StateController(settings.filterFormat)),
      filterRotationProvider.overrideWithValue(StateController(settings.filterRotation)),
      filterMwlProvider.overrideWithValue(StateController(settings.filterMwl)),
      filterPacksProvider.overrideWithValue(StateController(FilterType())),
      filterSidesProvider.overrideWithValue(StateController(FilterType())),
      filterFactionsProvider.overrideWithValue(StateController(FilterType())),
      filterTypesProvider.overrideWithValue(StateController(FilterType())),
      filterTagsProvider.overrideWithValue(StateController(const {})),
      deckTileProvider.overrideWithValue((context, ref, index, deck) {
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
      }),
      deckFabProvider.overrideWithValue(null),
    ];

    return DeckListBottomNavigationItem(
      appBar: ProviderScope(
        overrides: deckListOverrides,
        child: const DeckListAppBar(
          title: 'Decks',
          automaticallyImplyLeading: false,
        ),
      ),
      body: ProviderScope(overrides: deckListOverrides, child: const DeckListBody()),
      floatingActionButton: const DeckListFloatingActionBar(),
      item: BottomNavigationBarItem(
        icon: Assets.icons.decks.image(height: 24, color: Colors.grey[600]),
        activeIcon: Assets.icons.decks.image(height: 24, color: Colors.blueAccent),
        label: 'Decks',
      ),
    );
  }
}

class SettingsBottomNavigationItem extends BottomNavigationItem {
  const SettingsBottomNavigationItem()
      : super(
          appBar: const SettingsAppBar(automaticallyImplyLeading: false),
          body: const SettingsBody(),
          item: const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings, color: Colors.blueAccent),
            label: 'Settings',
          ),
        );
}

final itemsProvider = Provider<List<BottomNavigationItem>>((ref) {
  final settings = ref.watch(settingResultProvider);
  return [
    CardListBottomNavigationItem.fromSettings(settings),
    DeckListBottomNavigationItem.fromSettings(settings),
    const SettingsBottomNavigationItem(),
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
        if (hasInternet && nrdbAuthState is OfflineAuthState) {
          nrdbAuthState.refreshToken();
        } else if (!hasInternet && nrdbAuthState is OnlineAuthState) {
          nrdbAuthState.offline();
        }
      });
    });

    ref.listen<Object?>(shouldSyncProvider, (previous, next) async {
      if (next is OnlineAuthState) {
        final decks = await next.listDecks();
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

    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: IndexedStack(
            index: index.state,
            children: items.map((e) => e.appBar).toList(),
          ),
        ),
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
      ),
    );
  }
}
