import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/tags_page.dart';
import 'async_value_builder.dart';
import 'factions_page.dart';
import 'format_dropdown.dart';
import 'mwl_dropdown.dart';
import 'pack_page.dart';
import 'rotation_dropdown.dart';
import 'types_page.dart';

class DeckFilterPage extends ConsumerWidget {
  const DeckFilterPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<Query?> query,
    required StateController<FormatData?> format,
    required StateController<RotationData?> rotation,
    required StateController<MwlData?> mwl,
    required StateController<FilterType<String>> packs,
    required StateController<FilterType<String>> sides,
    required StateController<FilterType<String>> factions,
    required StateController<FilterType<String>> types,
    required StateController<Set<String>> tags,
  }) {
    return ProviderScope(
      overrides: [
        filterQueryProvider.overrideWithValue(query),
        filterFormatProvider.overrideWithValue(format),
        filterRotationProvider.overrideWithValue(rotation),
        filterMwlProvider.overrideWithValue(mwl),
        filterPacksProvider.overrideWithValue(packs),
        filterSidesProvider.overrideWithValue(sides),
        filterFactionsProvider.overrideWithValue(factions),
        filterTypesProvider.overrideWithValue(types),
        filterTagsProvider.overrideWithValue(tags),
      ],
      child: const DeckFilterPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Decks')),
      body: ListView(
        children: const [
          DeckFilterFormat(),
          DeckFilterRotation(),
          DeckFilterMwl(),
          DeckFilterPacks(),
          DeckFilterFactions(),
          DeckFilterTypes(),
          DeckFilterTags(),
        ],
      ),
    );
  }
}

class DeckFilterFormat extends ConsumerWidget {
  const DeckFilterFormat({Key? key}) : super(key: key);

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

class DeckFilterRotation extends ConsumerWidget {
  const DeckFilterRotation({Key? key}) : super(key: key);

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

class DeckFilterMwl extends ConsumerWidget {
  const DeckFilterMwl({Key? key}) : super(key: key);

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

class DeckFilterPacks extends ConsumerWidget {
  const DeckFilterPacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(filterPacksProvider.state);
    if (!packs.state.visible) return const SizedBox.shrink();
  
    final packList = ref.watch(packListProvider);
    return AsyncValueBuilder<List<PackResult>>(
      value: packList,
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

class DeckFilterFactions extends ConsumerWidget {
  const DeckFilterFactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sides = ref.watch(filterSidesProvider.state);
    final factions = ref.watch(filterFactionsProvider.state);
    if (!factions.state.visible) return const SizedBox.shrink();

    final factionList = ref.watch(factionListProvider);
    return AsyncValueBuilder<List<FactionResult>>(
      value: factionList,
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

class DeckFilterTypes extends ConsumerWidget {
  const DeckFilterTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sides = ref.watch(filterSidesProvider.state);
    final types = ref.watch(filterTypesProvider.state);
    if (!types.state.visible) return const SizedBox.shrink();

    final typeList = ref.watch(typeListProvider);
    return AsyncValueBuilder<List<TypeResult>>(
      value: typeList,
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

class DeckFilterTags extends ConsumerWidget {
  const DeckFilterTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(filterTagsProvider.state);
    final tagList = ref.watch(distinctTagListProvider);
    return AsyncValueBuilder<List<String>>(
      value: tagList,
      data: (items) => ListTile(
        title: const Text('Tags'),
        subtitle: tags.state.isNotEmpty
            ? Text(items.where((e) => tags.state.contains(e)).map((e) => e).join(', '))
            : null,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FilterTagsPage.withOverrides(
              tags: tags,
            );
          }));
        },
      ),
    );
  }
}