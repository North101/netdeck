import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/deck_filter_page.dart';

class DeckListGroupMenu extends ConsumerWidget {
  const DeckListGroupMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckGroup);
    }));
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
  const DeckListSortMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckSort);
    }));
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
    final query = ref.read(filterQueryProvider.state);
    final format = ref.read(filterFormatProvider.state);
    final rotation = ref.read(filterRotationProvider.state);
    final mwl = ref.read(filterMwlProvider.state);
    final packs = ref.read(filterPacksProvider.state);
    final sides = ref.read(filterSidesProvider.state);
    final factions = ref.read(filterFactionsProvider.state);
    final types = ref.read(filterTypesProvider.state);
    final tags = ref.read(filterTagsProvider.state);

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
          tags: tags,
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
            child: const ListTile(title: Text('Filter By')),
            onTap: () => Future(() => _openFilterDialog(context, ref)),
          ),
          const PopupMenuItem(child: DeckListGroupMenu()),
          const PopupMenuItem(child: DeckListSortMenu()),
        ],
      ),
    );
  }
}
