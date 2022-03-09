import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'async_value_builder.dart';
import 'header_list_tile.dart';

final filteredTypeListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final where = buildAnd([
    ref.watch(filterSideFilterProvider(const FilterState(values: false))),
    ref.watch(filterTypeFilterProvider(const TypeFilterState(
      values: false,
      subtypes: false,
    ))),
  ]);
  return db.listTypes(where: where).watch().map((items) {
    return groupBy<TypeResult, SideData?>(items, (item) {
      return item.side;
    }).entries;
  });
}, dependencies: [dbProvider, filterSideFilterProvider, filterTypeFilterProvider]);

class FilterTypeCheckbox extends ConsumerWidget {
  const FilterTypeCheckbox({
    required this.side,
    required this.typeList,
    Key? key,
  }) : super(key: key);

  final SideData? side;
  final List<TypeResult> typeList;

  void setFactions(WidgetRef ref, bool? selected, Iterable<String> values) {
    final types = ref.read(filterTypesProvider.state);
    final value = types.state.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    types.state = types.state.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(filterTypesProvider);
    final bool? selected;
    if (typeList.every((e) => types.contains(e.type.code))) {
      selected = true;
    } else if (typeList.any((e) => types.contains(e.type.code))) {
      selected = null;
    } else {
      selected = false;
    }
    if (side != null) {
      return SliverStickyHeader(
        header: HeaderListTile(
          child: CheckboxListTile(
            tristate: true,
            value: selected,
            title: Text(side!.name),
            onChanged: (selected) => setFactions(ref, selected, typeList.map((e) => e.type.code)),
          ),
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            ...typeList.map(
              (e) => Material(
                color: Theme.of(context).splashColor,
                child: CheckboxListTile(
                  value: types.contains(e.type.code),
                  title: Text(e.type.name),
                  onChanged: types.always.contains(e.type.code)
                      ? null //
                      : (selected) => setFactions(ref, selected, {e.type.code}),
                ),
              ),
            )
          ]),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildListDelegate([
          ...typeList.map(
            (e) => HeaderListTile(
              child: CheckboxListTile(
                value: types.contains(e.type.code),
                title: Text(e.type.name),
                onChanged: types.always.contains(e.type.code)
                    ? null //
                    : (selected) => setFactions(ref, selected, {e.type.code}),
              ),
            ),
          ),
        ]),
      );
    }
  }
}

class FilterTypesPage extends ConsumerWidget {
  const FilterTypesPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<FilterType<String>> sides,
    required StateController<FilterType<String>> types,
  }) {
    return ProviderScope(
      overrides: [
        filterSidesProvider.overrideWithValue(sides),
        filterTypesProvider.overrideWithValue(types),
      ],
      child: const FilterTypesPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterTypesProvider.select((value) => value.visible));
    if (!visible) return const SizedBox.shrink();

    final typeList = ref.watch(filteredTypeListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Types')),
      body: AsyncValueBuilder<Iterable<MapEntry<SideData?, List<TypeResult>>>>(
        value: typeList,
        data: (items) => CustomScrollView(
          slivers: items.map((e) => FilterTypeCheckbox(side: e.key, typeList: e.value)).toList(),
        ),
      ),
    );
  }
}
