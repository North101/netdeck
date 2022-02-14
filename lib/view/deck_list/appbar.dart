import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers.dart';
import '../deck_filter_page.dart';

class DeckListGroupMenu extends ConsumerWidget {
  const DeckListGroupMenu(this.settings, {Key? key}) : super(key: key);

  final SettingResult settings;

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckGroup value) async {
    Navigator.of(context).pop();

    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckGroup = settings.settings.deckGroup ?? DeckGroup.side;
    return PopupMenuButton<DeckGroup>(
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
        ...DeckGroup.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckGroup,
            value: v,
            child: Text(v.name),
          ),
        ),
      ],
    );
  }
}

class DeckListSortMenu extends ConsumerWidget {
  const DeckListSortMenu(this.settings, {Key? key}) : super(key: key);

  final SettingResult settings;

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckSort value) async {
    Navigator.of(context).pop();

    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckSort = settings.settings.deckSort ?? DeckSort.created;
    return PopupMenuButton<DeckSort>(
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
        ...DeckSort.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckSort,
            value: v,
            child: Text(v.name),
          ),
        ),
      ],
    );
  }
}

class DeckListMoreActions extends ConsumerWidget {
  const DeckListMoreActions({Key? key}) : super(key: key);

  void _openFilterDialog(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).pop();

    final query = ref.read(filterQueryProvider.state);
    final format = ref.read(filterFormatProvider.state);
    final rotation = ref.read(filterRotationProvider.state);
    final mwl = ref.read(filterMwlProvider.state);
    final packs = ref.read(filterPacksProvider.state);
    final sides = ref.read(filterSidesProvider.state);
    final factions = ref.read(filterFactionsProvider.state);
    final types = ref.read(filterTypesProvider.state);

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DeckFilterPage.withOverrides(
          query: query,
          format: format,
          rotation: rotation,
          mwl: mwl,
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
          PopupMenuItem(child: DeckListGroupMenu(settings)),
          PopupMenuItem(child: DeckListSortMenu(settings)),
        ],
      ),
    );
  }
}

class DeckListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  DeckListAppBar({
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
              actions: const [DeckListMoreActions()],
              controller: _searchQueryController,
            )
          : AppBar(
              title: Text(title),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _startSearch(context, ref),
                ),
                const DeckListMoreActions(),
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
