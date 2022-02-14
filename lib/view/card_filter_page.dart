import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';

import '../util/filter_type.dart';
import '/db/database.dart';
import '/providers.dart';
import 'factions_page.dart';
import 'format_dropdown.dart';
import 'mwl_dropdown.dart';
import 'pack_page.dart';
import 'rotation_dropdown.dart';
import 'stream_builder_wrapper.dart';
import 'types_page.dart';

class CardFilterPage extends ConsumerWidget {
  const CardFilterPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<Query?> query,
    required StateController<bool> collection,
    required StateController<FormatData?> format,
    required StateController<RotationData?> rotation,
    required StateController<MwlData?> mwl,
    required StateController<FilterType<String>> packs,
    required StateController<FilterType<String?>> sides,
    required StateController<FilterType<String>> factions,
    required StateController<FilterType<String>> types,
  }) {
    return ProviderScope(
      overrides: [
        filterQueryProvider.overrideWithValue(query),
        filterCollectionProvider.overrideWithValue(collection),
        filterFormatProvider.overrideWithValue(format),
        filterRotationProvider.overrideWithValue(rotation),
        filterMwlProvider.overrideWithValue(mwl),
        filterPacksProvider.overrideWithValue(packs),
        filterSidesProvider.overrideWithValue(sides),
        filterFactionsProvider.overrideWithValue(factions),
        filterTypesProvider.overrideWithValue(types),
      ],
      child: const CardFilterPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Cards')),
      body: ListView(
        children: const [
          CardFilterCollection(),
          CardFilterFormat(),
          CardFilterRotation(),
          CardFilterMwl(),
          CardFilterPacks(),
          CardFilterFactions(),
          CardFilterTypes(),
        ],
      ),
    );
  }
}

class CardFilterCollection extends ConsumerWidget {
  const CardFilterCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCollection = ref.watch(filterCollectionProvider.state);
    final collection = ref.watch(collectionProvider(false));
    return collection.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stracktrace) => Text(error.toString()),
      data: (data) => CheckboxListTile(
        value: filterCollection.state,
        title: const Text('My Collection'),
        subtitle: Text('${data.where((item) => item.inCollection).length} / ${data.length}'),
        onChanged: (value) {
          filterCollection.state = value!;
        },
      ),
    );
  }
}

class CardFilterFormat extends ConsumerWidget {
  const CardFilterFormat({Key? key}) : super(key: key);

  void setFormat(WidgetRef ref, FormatResult? value) {
    final format = ref.read(filterFormatProvider.state);
    final rotation = ref.read(filterRotationProvider.state);
    final mwl = ref.read(filterMwlProvider.state);

    format.state = value?.format;
    rotation.state = value?.let((e) => e.currentRotation) ?? rotation.state;
    mwl.state = value?.let((e) => e.activeMwl) ?? mwl.state;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FormatDropdown.withOverrides(
        format: format,
        onChanged: (value) => setFormat(ref, value),
      ),
    );
  }
}

class CardFilterRotation extends ConsumerWidget {
  const CardFilterRotation({Key? key}) : super(key: key);

  void setRotation(WidgetRef ref, RotationData? value) {
    final rotation = ref.read(filterRotationProvider.state);
    rotation.state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider);
    final rotation = ref.watch(filterRotationProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RotationDropdown.withOverrides(
        format: format,
        rotation: rotation,
        onChanged: (value) => setRotation(ref, value),
      ),
    );
  }
}

class CardFilterMwl extends ConsumerWidget {
  const CardFilterMwl({Key? key}) : super(key: key);

  void setMwl(WidgetRef ref, MwlData? value) {
    final mwl = ref.read(filterMwlProvider.state);
    mwl.state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider);
    final mwl = ref.watch(filterMwlProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MwlDropdown.withOverrides(
        format: format,
        mwl: mwl,
        onChanged: (MwlData? value) => setMwl(ref, value),
      ),
    );
  }
}

class CardFilterPacks extends ConsumerWidget {
  const CardFilterPacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final packs = ref.watch(filterPacksProvider.state);
    if (!packs.state.visible) return const SizedBox.shrink();

    final packList = db.listPacks().watch();
    return packList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (items) => ListTile(
        title: const Text('Packs'),
        subtitle: packs.state.isNotEmpty
            ? Text(items.where((element) => packs.state.contains(element.pack.code)).map((e) => e.pack.name).join(', '))
            : null,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FilterPacksPage.withOverrides(
              packs: packs,
            );
          }));
        },
      ),
    );
  }
}

class CardFilterFactions extends ConsumerWidget {
  const CardFilterFactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final sides = ref.watch(filterSidesProvider.state);
    final factions = ref.watch(filterFactionsProvider.state);
    if (!factions.state.visible) return const SizedBox.shrink();

    final factionList = db.listFactions().watch();
    return factionList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (items) => ListTile(
        title: const Text('Factions'),
        subtitle: factions.state.isNotEmpty
            ? Text(items
                .where((element) => factions.state.contains(element.faction.code))
                .map((e) => e.faction.name)
                .join(', '))
            : null,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FilterFactionsPage.withOverrides(
              sides: sides,
              factions: factions,
            );
          }));
        },
      ),
    );
  }
}

class CardFilterTypes extends ConsumerWidget {
  const CardFilterTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final sides = ref.watch(filterSidesProvider.state);
    final types = ref.watch(filterTypesProvider.state);
    if (!types.state.visible) return const SizedBox.shrink();

    final typeList = db.listTypes().watch();
    return typeList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (items) => ListTile(
        title: const Text('Types'),
        subtitle: types.state.isNotEmpty
            ? Text(items.where((element) => types.state.contains(element.type.code)).map((e) => e.type.name).join(', '))
            : null,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FilterTypesPage.withOverrides(
              sides: sides,
              types: types,
            );
          }));
        },
      ),
    );
  }
}
