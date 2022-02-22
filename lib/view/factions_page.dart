import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'header_list_tile.dart';

final factionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final where = buildAnd([
    ref.watch(filterSideFilterProvider(const FilterState(values: false))),
    ref.watch(filterFactionFilterProvider(const FilterState(values: false))),
  ]);
  return db.listFactions(where: where).watch().map((items) {
    return groupBy<FactionResult, SideData>(items, (item) {
      return item.side;
    }).entries.sorted((a, b) {
      return a.key.code.compareTo(b.key.code);
    });
  });
}, dependencies: [dbProvider, filterSideFilterProvider, filterFactionFilterProvider]);

class FilterFactionCheckbox extends ConsumerWidget {
  const FilterFactionCheckbox({
    required this.side,
    required this.factionList,
    Key? key,
  }) : super(key: key);

  final SideData side;
  final List<FactionResult> factionList;

  void setFactions(WidgetRef ref, bool? selected, Iterable<String> values) {
    final factions = ref.read(filterFactionsProvider.state);
    final value = factions.state.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    factions.state = factions.state.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factions = ref.watch(filterFactionsProvider);
    final bool? selected;
    if (factionList.every((e) => factions.contains(e.faction.code))) {
      selected = true;
    } else if (factionList.any((e) => factions.contains(e.faction.code))) {
      selected = null;
    } else {
      selected = false;
    }
    return SliverStickyHeader(
      header: HeaderListTile(
        child: CheckboxListTile(
          tristate: true,
          value: selected,
          title: Text(side.name),
          onChanged: (selected) => setFactions(ref, selected, factionList.map((e) => e.faction.code)),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          ...factionList.map(
            (e) => Material(
              color: Theme.of(context).splashColor,
              child: CheckboxListTile(
                value: factions.contains(e.faction.code),
                title: Text(e.faction.name),
                onChanged: factions.always.contains(e.faction.code)
                    ? null //
                    : (selected) => setFactions(ref, selected, {e.faction.code}),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class FilterFactionsPage extends ConsumerWidget {
  const FilterFactionsPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<FilterType<String?>> sides,
    required StateController<FilterType<String>> factions,
  }) {
    return ProviderScope(
      overrides: [
        filterSidesProvider.overrideWithValue(sides),
        filterFactionsProvider.overrideWithValue(factions),
      ],
      child: const FilterFactionsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterFactionsProvider.select((value) => value.visible));
    if (!visible) return const SizedBox.shrink();

    final factionList = ref.watch(factionListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Factions')),
      body: factionList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (items) {
          return CustomScrollView(
            slivers: [
              ...items.map((e) => FilterFactionCheckbox(side: e.key, factionList: e.value)),
            ],
          );
        },
      ),
    );
  }
}
