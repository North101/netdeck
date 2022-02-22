import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart' hide Card;
import '/providers.dart';
import '/util/filter_type.dart';
import 'header_list_tile.dart';

final packListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final where = ref.watch(filterPackFilterProvider(const TypeFilterState(values: false)));
  return db.listPacks(where: where).watch().map((items) {
    return groupBy<PackResult, CycleData>(items, (item) {
      return item.cycle;
    }).entries;
  });
}, dependencies: [dbProvider, filterPackFilterProvider]);

class FilterCycleCheckbox extends ConsumerWidget {
  const FilterCycleCheckbox({
    required this.cycle,
    required this.packList,
    Key? key,
  }) : super(key: key);

  final CycleData cycle;
  final List<PackResult> packList;

  void setPacks(WidgetRef ref, bool? selected, Iterable<String> values) {
    final packs = ref.read(filterPacksProvider.state);
    final value = packs.state.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    packs.state = packs.state.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(filterPacksProvider);
    final bool? selected;
    if (packList.every((e) => packs.contains(e.pack.code))) {
      selected = true;
    } else if (packList.any((e) => packs.contains(e.pack.code))) {
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
              onChanged: (selected) => setPacks(ref, selected, packList.map((e) => e.pack.code)),
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
            onChanged: (selected) => setPacks(ref, selected, packList.map((e) => e.pack.code)),
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
                  onChanged: packs.always.contains(e.pack.code)
                      ? null //
                      : (selected) => setPacks(ref, selected, {e.pack.code}),
                ),
              ),
            ),
          ]),
        ),
      );
    }
  }
}

class FilterPacksPage extends ConsumerWidget {
  const FilterPacksPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<FilterType<String>> packs,
  }) {
    return ProviderScope(
      overrides: [
        filterPacksProvider.overrideWithValue(packs),
      ],
      child: const FilterPacksPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterPacksProvider.select((value) => value.visible));
    if (!visible) return const SizedBox.shrink();

    final packList = ref.watch(packListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Packs')),
      body: packList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (items) {
          return CustomScrollView(
            slivers: <Widget>[
              ...items.map((e) => FilterCycleCheckbox(cycle: e.key, packList: e.value)),
            ],
          );
        },
      ),
    );
  }
}
