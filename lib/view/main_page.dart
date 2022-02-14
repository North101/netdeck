import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netrunner_deckbuilder/view/card_gallery/page.dart';

import '/db/database.dart';
import '/providers.dart';
import 'card_list/page.dart';
import 'card_tile.dart';
import 'deck_list/fab.dart';
import 'deck_list/page.dart';
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
      item: const BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard),
        label: 'Cards',
      ),
    ),
    BottomNavigationItem(
      body: DeckListPage.withOverrides(
        filterFormat: settings.filterFormat,
        filterRotation: settings.filterRotation,
        filterMwl: settings.filterMwl,
      ),
      floatingActionButton: const DeckListFloatingActionBar(),
      item: const BottomNavigationBarItem(
        icon: Icon(Icons.deck),
        label: 'Decks',
      ),
    ),
    const BottomNavigationItem(
      body: SettingsPage(),
      item: BottomNavigationBarItem(
        icon: Icon(Icons.settings),
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
    final settings = ref.watch(initSettingsProvider);
    return settings.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stacktrace) => Scaffold(
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
