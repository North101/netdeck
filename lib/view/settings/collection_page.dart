import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class CardFilterCycleCheckbox extends ConsumerWidget {
  const CardFilterCycleCheckbox({
    required this.cycle,
    required this.packList,
    Key? key,
  }) : super(key: key);

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
    return SliverList(
      delegate: SliverChildListDelegate([
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          tristate: true,
          value: selected,
          title: Text(cycle.name),
          onChanged: (selected) => setCollection(ref, selected, packList.map((e) => e.pack.code)),
        ),
        if (packList.length != 1 || !packList[0].hasCycleName)
          ...packList.map(
            (e) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: packs.contains(e.pack.code),
                title: Text(e.pack.name),
                onChanged: (selected) => setCollection(ref, selected, {e.pack.code}),
              ),
            ),
          ),
      ]),
    );
  }
}

class CollectionSettingsPage extends ConsumerWidget {
  const CollectionSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionByCycle = ref.watch(collectionByCycleProvider(false));
    return Scaffold(
      appBar: AppBar(title: const Text('My Collection')),
      body: collectionByCycle.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (items) {
          return CustomScrollView(
            slivers: [
              ...items.map((e) => CardFilterCycleCheckbox(cycle: e.key, packList: e.value)),
            ],
          );
        },
      ),
    );
  }
}
