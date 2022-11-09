import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart' hide Card;
import '/providers.dart';
import '/util/filter_type.dart';
import 'async_value_builder.dart';
import 'header_list_tile.dart';

final filteredPackListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db
      .listPacks(where: (pack, cycle) {
        return ref.watch(filterPackFilterProvider(PackFilter(
          values: false,
          pack: pack,
        )));
      })
      .watch()
      .map((items) {
        return groupBy(items, (item) {
          return item.cycle;
        }).entries;
      });
}, dependencies: [dbProvider, filterPackFilterProvider]);

class FilterCycleCheckbox extends ConsumerWidget {
  const FilterCycleCheckbox({
    required this.cycle,
    required this.packList,
    super.key,
  });

  final CycleData cycle;
  final List<PackResult> packList;

  void setPacks(WidgetRef ref, bool? selected, Iterable<String> values) {
    final packs = ref.read(filterPacksProvider);
    final value = packs.value.toSet();
    if (selected == true) {
      value.addAll(values);
    } else {
      value.removeAll(values);
    }
    packs.value = packs.value.copyWith(values: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(filterPacksProvider).value;
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
              (e) => CheckboxListTile(
                value: packs.contains(e.pack.code),
                title: Text(e.pack.name),
                onChanged: packs.always.contains(e.pack.code)
                    ? null //
                    : (selected) => setPacks(ref, selected, {e.pack.code}),
              ),
            ),
          ]),
        ),
      );
    }
  }
}

class FilterPacksPage extends ConsumerWidget {
  const FilterPacksPage({super.key});

  static Route<FilterType<String>> route(BuildContext context, Object? arguments) {
    final packs = FilterType<String>.fromJson((arguments as Map).cast());
    return MaterialPageRoute(
      builder: (context) => FilterPacksPage.withOverrides(
        packs: packs,
      ),
    );
  }

  static Widget withOverrides({
    required FilterType<String> packs,
  }) {
    return RestorableProviderScope(
      restorationId: 'filter_packs_page',
      overrides: [
        filterPacksProvider.overrideWith((ref) => RestorableFilterType(packs)),
      ],
      child: const FilterPacksPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(filterPacksProvider.select((value) => value.value.visible));
    if (!visible) return const SizedBox.shrink();

    final packList = ref.watch(filteredPackListProvider);
    return WillPopScope(
      onWillPop: () async {
        final packs = ref.read(filterPacksProvider);
        Navigator.of(context).pop(packs.value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Filter Packs')),
        body: AsyncValueBuilder<Iterable<MapEntry<CycleData, List<PackResult>>>>(
          value: packList,
          data: (items) {
            return CustomScrollView(
              slivers: <Widget>[
                ...items.map((e) => FilterCycleCheckbox(cycle: e.key, packList: e.value)),
              ],
            );
          },
        ),
      ),
    );
  }
}
