import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers.dart';
import '../card_filter_page.dart';

class CardListGroupMenu extends ConsumerWidget {
  const CardListGroupMenu(this.settings, {Key? key}) : super(key: key);

  final SettingResult settings;

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGroup value) async {
    Navigator.of(context).pop();

    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGroup = settings.settings.cardGroup ?? CardGroup.type;
    return PopupMenuButton<CardGroup>(
      child: const ListTile(
        title: Text('Group By'),
        trailing: Icon(Icons.play_arrow, size: 12),
      ),
      onSelected: (value) => onSelected(context, ref, value),
      itemBuilder: (context) => [
        const PopupMenuItem(
          enabled: false,
          child: Text('Group By'),
        ),
        ...CardGroup.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == cardGroup,
            value: v,
            child: Text(v.name(context)),
          ),
        ),
      ],
    );
  }
}

class CardListSortMenu extends ConsumerWidget {
  const CardListSortMenu(this.settings, {Key? key}) : super(key: key);

  final SettingResult settings;

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    Navigator.of(context).pop();

    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSort = settings.settings.cardSort ?? CardSort.set;
    return PopupMenuButton<CardSort>(
      child: const ListTile(
        title: Text('Sort By'),
        trailing: Icon(Icons.play_arrow, size: 12),
      ),
      onSelected: (value) => onSelected(context, ref, value),
      itemBuilder: (context) => [
        const PopupMenuItem(
          enabled: false,
          child: Text('Sort By'),
        ),
        ...CardSort.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == cardSort,
            value: v,
            child: Text(v.name),
          ),
        ),
      ],
    );
  }
}

class CardListMoreActions extends ConsumerWidget {
  const CardListMoreActions({Key? key}) : super(key: key);

  void _openFilterDialog(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).pop();

    final query = ref.read(filterQueryProvider.state);
    final format = ref.read(filterFormatProvider.state);
    final collection = ref.read(filterCollectionProvider.state);
    final rotation = ref.read(filterRotationProvider.state);
    final mwl = ref.read(filterMwlProvider.state);
    final packs = ref.read(filterPacksProvider.state);
    final sides = ref.read(filterSidesProvider.state);
    final factions = ref.read(filterFactionsProvider.state);
    final types = ref.read(filterTypesProvider.state);

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CardFilterPage.withOverrides(
          query: query,
          format: format,
          rotation: rotation,
          mwl: mwl,
          collection: collection,
          packs: packs,
          sides: sides,
          factions: factions,
          types: types,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: ListTile(
              title: const Text('Filter By'),
              onTap: () => _openFilterDialog(context, ref),
            ),
          ),
          PopupMenuItem(child: CardListGroupMenu(settings)),
          PopupMenuItem(child: CardListSortMenu(settings)),
        ],
      ),
    );
  }
}

class CardListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  CardListAppBar({
    required this.title,
    this.color,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color? color;

  final _searchQueryController = TextEditingController();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _startSearch(BuildContext context, WidgetRef ref) {
    ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () => _stopSearch(context, ref)));

    final isSearching = ref.read(filterSearchingProvider.state);
    isSearching.state = true;
  }

  void _stopSearch(BuildContext context, WidgetRef ref) {
    final isSearching = ref.read(filterSearchingProvider.state);
    isSearching.state = false;

    final cardQuery = ref.read(filterQueryProvider.state);
    cardQuery.state = null;
  }

  @override
  Widget build(context, ref) {
    final isSearching = ref.watch(filterSearchingProvider);
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        primaryColor: color,
        colorScheme: theme.colorScheme.copyWith(secondary: color),
      ),
      child: isSearching
          ? SearchField(
              actions: const [CardListMoreActions()],
              controller: _searchQueryController,
            )
          : AppBar(
              title: Text(title),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _startSearch(context, ref),
                ),
                const CardListMoreActions(),
              ],
            ),
    );
  }
}

class SearchField extends ConsumerWidget {
  const SearchField({
    required this.actions,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final List<Widget> actions;

  final TextEditingController controller;

  void _clearSearchQuery(BuildContext context, WidgetRef ref) {
    controller.clear();
    _updateSearchQuery(context, ref, '');
  }

  void _updateSearchQuery(BuildContext context, WidgetRef ref, String newQuery) {
    final cardQuery = ref.read(filterQueryProvider.state);
    cardQuery.state = tryParseQuery(newQuery);
  }

  ThemeData _buildSearchTheme(BuildContext context) {
    var theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: theme.appBarTheme.systemOverlayStyle?.copyWith(statusBarBrightness: colorScheme.brightness),
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        //toolbarTextStyle: theme.textTheme.,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.inputDecorationTheme.hintStyle,
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget build(context, ref) {
    final theme = _buildSearchTheme(context);
    return Theme(
      data: theme,
      child: AppBar(
        leading: null,
        title: TextField(
          autofocus: true,
          controller: controller,
          style: theme.textTheme.headline6,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(hintText: 'Search'),
          onChanged: (newQuery) => _updateSearchQuery(context, ref, newQuery),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (controller.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
              _clearSearchQuery(context, ref);
            },
          ),
          ...actions,
        ],
      ),
    );
  }
}
