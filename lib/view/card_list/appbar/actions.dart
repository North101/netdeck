import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/card_filter_page.dart';

class CardListGroupMenu extends ConsumerWidget {
  const CardListGroupMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardGroup);
    }));
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
  const CardListSortMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardSort);
    }));
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
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const ListTile(title: Text('Filter By')),
          onTap: () => Future(() => _openFilterDialog(context, ref)),
        ),
        const PopupMenuItem(child: CardListGroupMenu()),
        const PopupMenuItem(child: CardListSortMenu()),
      ],
    );
  }
}
