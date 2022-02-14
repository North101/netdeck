import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'header_list_tile.dart';

final typeListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final neverSides = ref.watch(filterSidesProvider).never;
  final neverTypes = ref.watch(filterTypesProvider).never;
  final where = db.side.code.isNotIn(neverSides) & db.type.code.isNotIn(neverTypes);
  return db.listTypes(where: where).watch().map((items) {
    return groupBy<TypeResult, SideData?>(items, (item) {
      return item.side;
    }).entries;
  });
}, dependencies: [dbProvider, filterSidesProvider, filterTypesProvider]);

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
            controlAffinity: ListTileControlAffinity.leading,
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
                color: Theme.of(context).cardColor,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
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
                controlAffinity: ListTileControlAffinity.leading,
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
    required StateController<FilterType<String?>> sides,
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
    final types = ref.watch(filterTypesProvider);
    if (!types.visible) return const SizedBox.shrink();

    final typeList = ref.watch(typeListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Types')),
      body: typeList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (items) => CustomScrollView(
          slivers: items.map((e) => FilterTypeCheckbox(side: e.key, typeList: e.value)).toList(),
        ),
      ),
    );
  }
}
