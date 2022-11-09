import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'async_value_builder.dart';
import 'header_list_tile.dart';

class FilterTypesArguments {
  const FilterTypesArguments({
    required this.sides,
    required this.types,
  });

  factory FilterTypesArguments.fromJson(Map<String, dynamic> data) {
    return FilterTypesArguments(
      sides: FilterType<String>.fromJson((data['sides'] as Map).cast()),
      types: FilterType<String>.fromJson((data['types'] as Map).cast()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sides': sides.toJson(),
      'types': types.toJson(),
    };
  }

  final FilterType<String> sides;
  final FilterType<String> types;
}

final filteredTypeListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db
      .listTypes(where: (type, side) {
        return buildAnd([
          ref.watch(filterSideFilterProvider(SideFilter(
            values: false,
            side: side,
          ))),
          ref.watch(filterTypeFilterProvider(TypeFilter(
            values: false,
            filterSubtypes: false,
            side: side,
            type: type,
            subtype: type,
          ))),
        ]);
      })
      .watch()
      .map((items) {
        return groupBy(items, (item) {
          return item.side;
        }).entries;
      });
}, dependencies: [dbProvider, filterSideFilterProvider, filterTypeFilterProvider]);

class FilterTypeCheckbox extends ConsumerWidget {
  const FilterTypeCheckbox({
    required this.side,
    required this.typeList,
    super.key,
  });

  final SideData? side;
  final List<TypeResult> typeList;

  void setFactions(WidgetRef ref, bool? selected, Iterable<String> values) {
    final types = ref.read(filterTypesProvider);
    final value = types.value.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    types.value = types.value.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(filterTypesProvider).value;
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
              (e) => CheckboxListTile(
                value: types.contains(e.type.code),
                title: Text(e.type.name),
                onChanged: types.always.contains(e.type.code)
                    ? null //
                    : (selected) => setFactions(ref, selected, {e.type.code}),
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
  const FilterTypesPage({super.key});

  static Route<FilterTypesArguments> route(BuildContext context, Object? arguments) {
    final args = FilterTypesArguments.fromJson((arguments as Map).cast());
    return MaterialPageRoute(
      builder: (context) => FilterTypesPage.withOverrides(args),
    );
  }

  static Widget withOverrides(FilterTypesArguments args) {
    return RestorableProviderScope(
      restorationId: 'filter_types_page',
      overrides: [
        filterSidesProvider.overrideWith((ref) => RestorableFilterType(args.sides)),
        filterTypesProvider.overrideWith((ref) => RestorableFilterType(args.types)),
      ],
      child: const FilterTypesPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterTypesProvider.select((value) => value.value.visible));
    if (!visible) return const SizedBox.shrink();

    final typeList = ref.watch(filteredTypeListProvider);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(FilterTypesArguments(
          sides: ref.read(filterSidesProvider).value,
          types: ref.read(filterTypesProvider).value,
        ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Filter Types')),
        body: AsyncValueBuilder<Iterable<MapEntry<SideData?, List<TypeResult>>>>(
          value: typeList,
          data: (items) => CustomScrollView(
            slivers: items.map((e) => FilterTypeCheckbox(side: e.key, typeList: e.value)).toList(),
          ),
        ),
      ),
    );
  }
}
