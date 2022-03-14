import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'async_value_builder.dart';
import 'header_list_tile.dart';

class FilterFactionsResult {
  const FilterFactionsResult({
    required this.sides,
    required this.factions,
  });

  factory FilterFactionsResult.fromJson(Map<String, dynamic> data) {
    return FilterFactionsResult(
      sides: FilterType<String>.fromJson((data['sides'] as Map).cast()),
      factions: FilterType<String>.fromJson((data['factions'] as Map).cast()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sides': sides.toJson(),
      'factions': factions.toJson(),
    };
  }

  final FilterType<String> sides;
  final FilterType<String> factions;
}

final filteredFactionListProvider = StreamProvider((ref) {
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
    super.key,
  });

  final SideData side;
  final List<FactionResult> factionList;

  void setFactions(WidgetRef ref, bool? selected, Iterable<String> values) {
    final factions = ref.read(filterFactionsProvider);
    final value = factions.value.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    factions.value = factions.value.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factions = ref.watch(filterFactionsProvider).value;
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
  const FilterFactionsPage({super.key});

  static Widget withOverrides({
    required FilterType<String> sides,
    required FilterType<String> factions,
  }) {
    return ProviderScope(
      restorationId: 'filter_factions_page',
      overrides: [
        filterSidesProvider.overrideWithValue(RestorableFilterType(sides), 'filterSidesProvider'),
        filterFactionsProvider.overrideWithValue(RestorableFilterType(factions), 'filterFactionsProvider'),
      ],
      child: const FilterFactionsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterFactionsProvider.select((value) => value.value.visible));
    if (!visible) return const SizedBox.shrink();

    final factionList = ref.watch(filteredFactionListProvider);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(FilterFactionsResult(
          sides: ref.read(filterSidesProvider).value,
          factions: ref.read(filterFactionsProvider).value,
        ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Filter Factions')),
        body: AsyncValueBuilder<List<MapEntry<SideData, List<FactionResult>>>>(
          value: factionList,
          data: (items) {
            return CustomScrollView(
              slivers: [
                ...items.map((e) => FilterFactionCheckbox(side: e.key, factionList: e.value)),
              ],
            );
          },
        ),
      ),
    );
  }
}
