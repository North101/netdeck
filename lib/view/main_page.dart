import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/filter_type.dart';
import '/util/grouped_card_code_list.dart';
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

class CardListBottomNavigationItem extends BottomNavigationItem {
  CardListBottomNavigationItem({
    required super.body,
    required super.item,
    super.floatingActionButton,
  });

  factory CardListBottomNavigationItem.fromSettings(SettingResult settings) {
    return CardListBottomNavigationItem(
      body: CardListPage.withOverrides(
        restorationId: 'card_list_page',
        automaticallyImplyLeading: false,
        title: 'Cards',
        filterSearch: null,
        filterCollection: settings.settings.filterCollection,
        filterFormat: settings.filterFormat,
        filterRotation: settings.filterRotation,
        filterMwl: settings.filterMwl,
        filterPacks: FilterType(),
        filterSides: FilterType(),
        filterFactions: FilterType(),
        filterTypes: FilterType(),
        itemBuilder: (context, ref, index, card) => CardTileWidget(
          index: index,
          card: card,
        ),
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
    required super.body,
    required super.item,
    super.floatingActionButton,
  });

  factory DeckListBottomNavigationItem.fromSettings(SettingResult settings) {
    return DeckListBottomNavigationItem(
      body: DeckListPage.withOverrides(
        restorationId: 'deck_list_page',
        automaticallyImplyLeading: false,
        title: 'Decks',
        filterSearch: null,
        filterFormat: null,
        filterRotation: null,
        filterMwl: null,
        filterPacks: FilterType(),
        filterSides: FilterType(),
        filterFactions: FilterType(),
        filterTypes: FilterType(),
        filterTags: const {},
        itemBuilder: (context, ref, index, deck) => DeckTileWidget(
          index: index,
          deck: deck,
        ),
      ),
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
          body: const SettingsPage(),
          item: const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings, color: Colors.blueAccent),
            label: 'Settings',
          ),
        );
}

final itemsProvider = FutureProvider<List<BottomNavigationItem>>((ref) async {
  final db = ref.read(dbProvider);
  final settings = await db.getSettings().getSingle();
  return [
    CardListBottomNavigationItem.fromSettings(settings),
    DeckListBottomNavigationItem.fromSettings(settings),
    const SettingsBottomNavigationItem(),
  ];
}, dependencies: [dbProvider]);

final selectedIndexProvider = RestorableProvider<RestorableInt>(
  (_) => throw UnimplementedError(),
  restorationId: 'selectedIndexProvider',
);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    return MaterialPageRoute(builder: (context) {
      return MainPage.withOverrides();
    });
  }

  static Widget withOverrides() {
    return RestorableProviderScope(
      restorationId: 'main_page_scope',
      overrides: [
        selectedIndexProvider.overrideWith((ref) => RestorableInt(0)),
      ],
      child: const MainPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      if (next is! OnlineAuthState) return;

      final decks = await next.listDecks();
      if (decks is! SuccessHttpResult<List<NrdbDeck>>) return;

      final db = ref.read(dbProvider);
      await db.transaction(() async {
        await next.syncDecks(db, decks.value);
      });
    });

    final index = ref.watch(selectedIndexProvider);
    final items = ref.watch(itemsProvider);
    return items.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Netdeck')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stacktrace) => Scaffold(
        appBar: AppBar(title: const Text('Netdeck')),
        body: Text(error.toString()),
      ),
      data: (items) {
        final selected = items[index.value];
        return Scaffold(
          body: IndexedStack(
            index: index.value,
            children: items.map((e) => e.body).toList(),
          ),
          floatingActionButton: selected.floatingActionButton,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index.value,
            items: items.map((e) => e.item).toList(),
            onTap: (value) {
              index.value = value;
            },
          ),
        );
      },
    );
  }
}

class CardTileWidget extends ConsumerWidget {
  const CardTileWidget({
    required this.index,
    required this.card,
    super.key,
  });

  final int index;
  final CardResult card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mwlCard = ref.watch(mwlCardMapProvider.select((value) {
      return value.whenOrNull(data: (data) => data[card.card.title]);
    }));
    return CardTile(
      card,
      key: ValueKey(card),
      mwlCard: mwlCard,
      onTap: () async {
        final navigator = Navigator.of(context);
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        navigator.restorablePush(
          CardGalleryPage.route,
          arguments: CardGalleryArguments(
            items: GroupedCardCodeList.fromCardResult(groupedCardList),
            index: index,
          ).toJson(),
        );
      },
    );
  }
}

class DeckTileWidget extends ConsumerWidget {
  const DeckTileWidget({
    required this.index,
    required this.deck,
    super.key,
  });

  final int index;
  final DeckFullResult deck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(filterTagsProvider);
    final selectedDecks = ref.watch(selectedDeckIdsProvider);
    final selected = selectedDecks.value.contains(deck.deck.id);
    return DeckTile(
      deck: deck,
      selected: selected,
      selectedTags: tags.value,
      onTap: () {
        if (selectedDecks.value.isEmpty) {
          Navigator.of(context).restorablePush(
            DeckPage.route,
            arguments: deck.toJson(),
          );
        } else {
          selectedDecks.value = {
            ...selectedDecks.value.where((e) => e != deck.deck.id),
            if (!selected) deck.deck.id,
          };
        }
      },
      onLongPress: () {
        selectedDecks.value = {
          ...selectedDecks.value,
          deck.deck.id,
        };
      },
      onTagTap: (tag, value) {
        tags.value = {
          ...tags.value.where((e) => e != tag),
          if (value) tag,
        };
      },
    );
  }
}
