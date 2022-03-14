import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/async_value_builder.dart';
import '/view/header_list_tile.dart';

class CardFilterCycleCheckbox extends ConsumerWidget {
  const CardFilterCycleCheckbox({
    required this.cycle,
    required this.packList,
    super.key,
  });

  final CycleData cycle;
  final List<CollectionResult> packList;

  void setCollection(WidgetRef ref, bool? selected, Iterable<String> values) {
    final db = ref.read(dbProvider);
    db.batch((b) {
      if (selected == true) {
        b.insertAll<Collection, CollectionData>(
          db.collection,
          values.map((e) => CollectionCompanion.insert(packCode: e)),
          mode: InsertMode.insertOrIgnore,
        );
      } else {
        b.deleteWhere<Collection, CollectionData>(
          db.collection,
          (tbl) => tbl.packCode.isIn(values),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = packList.where((e) => e.inCollection).map((e) => e.pack.code);
    final bool? selected;
    if (packList.every((e) => e.inCollection)) {
      selected = true;
    } else if (packList.any((e) => e.inCollection)) {
      selected = null;
    } else {
      selected = false;
    }
    if (packList.length == 1 && packList.first.hasCycleName) {
      return SliverList(
        delegate: SliverChildListDelegate([
          HeaderListTile(
            child: CheckboxListTile(
              tristate: true,
              value: selected,
              title: Text(cycle.name),
              onChanged: (selected) => setCollection(ref, selected, packList.map((e) => e.pack.code)),
            ),
          ),
        ]),
      );
    } else {
      return SliverStickyHeader(
        header: HeaderListTile(
          child: CheckboxListTile(
            tristate: true,
            value: selected,
            title: Text(cycle.name),
            onChanged: (selected) => setCollection(ref, selected, packList.map((e) => e.pack.code)),
          ),
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            ...packList.map(
              (e) => Material(
                color: Theme.of(context).splashColor,
                child: CheckboxListTile(
                  value: packs.contains(e.pack.code),
                  title: Text(e.pack.name),
                  onChanged: (selected) => setCollection(ref, selected, {e.pack.code}),
                ),
              ),
            ),
          ]),
        ),
      );
    }
  }
}

class CollectionSettingsPage extends ConsumerWidget {
  const CollectionSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionByCycle = ref.watch(collectionByCycleProvider(false));
    return Scaffold(
      appBar: AppBar(title: const Text('My Collection')),
      body: AsyncValueBuilder<Map<CycleData, List<CollectionResult>>>(
        value: collectionByCycle,
        data: (items) {
          return CustomScrollView(
            slivers: [
              ...items.entries.map((e) => CardFilterCycleCheckbox(cycle: e.key, packList: e.value)),
            ],
          );
        },
      ),
    );
  }
}
