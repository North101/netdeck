import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'factions_page.dart';
import 'format_dropdown.dart';
import 'mwl_dropdown.dart';
import 'pack_page.dart';
import 'rotation_dropdown.dart';
import 'tags_page.dart';
import 'types_page.dart';

class DeckFilterResult {
  const DeckFilterResult({
    required this.format,
    required this.rotation,
    required this.mwl,
    required this.packs,
    required this.sides,
    required this.factions,
    required this.types,
    required this.tags,
  });

  factory DeckFilterResult.fromJson(Map<String, dynamic> data) {
    return DeckFilterResult(
      format: (data['format'] as Map?)?.let((e) => FormatData.fromJson(e.cast())),
      rotation: (data['rotation'] as Map?)?.let((e) => RotationData.fromJson(e.cast())),
      mwl: (data['mwl'] as Map?)?.let((e) => MwlData.fromJson(e.cast())),
      packs: FilterType<String>.fromJson((data['packs'] as Map).cast()),
      sides: FilterType<String>.fromJson((data['sides'] as Map).cast()),
      factions: FilterType<String>.fromJson((data['factions'] as Map).cast()),
      types: FilterType<String>.fromJson((data['types'] as Map).cast()),
      tags: Set<String>.from(data['tags'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'format': format?.toJson(),
      'rotation': rotation?.toJson(),
      'mwl': mwl?.toJson(),
      'packs': packs.toJson(),
      'sides': sides.toJson(),
      'factions': factions.toJson(),
      'types': types.toJson(),
      'tags': tags.toList(),
    };
  }

  final FormatData? format;
  final RotationData? rotation;
  final MwlData? mwl;
  final FilterType<String> packs;
  final FilterType<String> sides;
  final FilterType<String> factions;
  final FilterType<String> types;
  final Set<String> tags;
}

class DeckFilterPage extends ConsumerWidget {
  const DeckFilterPage({super.key});

  static Widget withOverrides({
    required FormatData? format,
    required RotationData? rotation,
    required MwlData? mwl,
    required FilterType<String> packs,
    required FilterType<String> sides,
    required FilterType<String> factions,
    required FilterType<String> types,
    required Set<String> tags,
  }) {
    return ProviderScope(
      restorationId: 'deck_filter_page',
      overrides: [
        filterFormatProvider.overrideWithValue(RestorableFormatData(format), 'filterFormatProvider'),
        filterRotationProvider.overrideWithValue(RestorableRotationData(rotation), 'filterRotationProvider'),
        filterMwlProvider.overrideWithValue(RestorableMwlData(mwl), 'filterMwlProvider'),
        filterPacksProvider.overrideWithValue(RestorableFilterType(packs), 'filterPacksProvider'),
        filterSidesProvider.overrideWithValue(RestorableFilterType(sides), 'filterSidesProvider'),
        filterFactionsProvider.overrideWithValue(RestorableFilterType(factions), 'filterFactionsProvider'),
        filterTypesProvider.overrideWithValue(RestorableFilterType(types), 'filterTypesProvider'),
        filterTagsProvider.overrideWithValue(RestorableSet<String>(tags), 'filterTagsProvider'),
      ],
      child: const DeckFilterPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final format = ref.read(filterFormatProvider);
        final rotation = ref.read(filterRotationProvider);
        final mwl = ref.read(filterMwlProvider);
        final packs = ref.read(filterPacksProvider);
        final sides = ref.read(filterSidesProvider);
        final factions = ref.read(filterFactionsProvider);
        final types = ref.read(filterTypesProvider);
        final tags = ref.read(filterTagsProvider);

        final result = DeckFilterResult(
          format: format.value,
          rotation: rotation.value,
          mwl: mwl.value,
          packs: packs.value,
          sides: sides.value,
          factions: factions.value,
          types: types.value,
          tags: tags.value,
        );
        Navigator.of(context).pop(result);
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}

class DeckFilterFormat extends ConsumerWidget {
  const DeckFilterFormat({super.key});

  void setFormat(WidgetRef ref, FormatResult? value) {
    final format = ref.read(filterFormatProvider);
    final rotation = ref.read(filterRotationProvider);
    final mwl = ref.read(filterMwlProvider);

    format.value = value?.format;
    rotation.value = value?.let((e) => e.currentRotation) ?? rotation.value;
    mwl.value = value?.let((e) => e.activeMwl) ?? mwl.value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider).value;
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
  const DeckFilterRotation({super.key});

  void setRotation(WidgetRef ref, RotationData? value) {
    final rotation = ref.read(filterRotationProvider);
    rotation.value = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider).value;
    final rotation = ref.watch(filterRotationProvider).value;
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
  const DeckFilterMwl({super.key});

  void setMwl(WidgetRef ref, MwlData? value) {
    final mwl = ref.read(filterMwlProvider);
    mwl.value = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(filterFormatProvider).value;
    final mwl = ref.watch(filterMwlProvider).value;
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

class DeckFilterPacks extends ConsumerStatefulWidget {
  const DeckFilterPacks({super.key});

  @override
  DeckFilterPacksState createState() => DeckFilterPacksState();
}

class DeckFilterPacksState extends ConsumerState<DeckFilterPacks> with RestorationMixin {
  late RestorableRouteFuture<FilterType<String>> filterPacksRoute;

  @override
  void initState() {
    super.initState();

    filterPacksRoute = RestorableRouteFuture<FilterType<String>>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openFilterPacksPage,
        arguments: arguments,
      ),
      onComplete: (result) {
        final filterPacks = ref.read(filterPacksProvider);
        filterPacks.value = result;
      },
    );
  }

  static Route<FilterType<String>> openFilterPacksPage(BuildContext context, Object? arguments) {
    final packs = FilterType<String>.fromJson((arguments as Map).cast());
    return MaterialPageRoute(
      builder: (context) => FilterPacksPage.withOverrides(
        packs: packs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final packs = ref.watch(filterPacksProvider);
    if (!packs.value.visible) return const SizedBox.shrink();

    final packList = ref.watch(packListProvider);
    return ListTile(
      title: const Text('Packs'),
      subtitle: packList.whenOrNull<Widget?>(
        error: (error, stackTrace) => Text(error.toString()),
        data: (items) => packs.value.isNotEmpty
            ? Text(items.where((element) => packs.value.contains(element.pack.code)).map((e) => e.pack.name).join(', '))
            : null,
      ),
      onTap: () => filterPacksRoute.present(packs.value.toJson()),
    );
  }

  @override
  String? restorationId = 'deck_filter_packs';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(filterPacksRoute, 'filterPacksRoute');
  }
}

class DeckFilterFactions extends ConsumerStatefulWidget {
  const DeckFilterFactions({super.key});

  @override
  DeckFilterFactionsState createState() => DeckFilterFactionsState();
}

class DeckFilterFactionsState extends ConsumerState<DeckFilterFactions> with RestorationMixin {
  late RestorableRouteFuture<FilterFactionsResult> filterFactionsRoute;

  @override
  void initState() {
    super.initState();

    filterFactionsRoute = RestorableRouteFuture<FilterFactionsResult>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openFilterFactionsPage,
        arguments: arguments,
      ),
      onComplete: (result) {
        final filterSides = ref.read(filterSidesProvider);
        filterSides.value = result.sides;

        final filterFactions = ref.read(filterFactionsProvider);
        filterFactions.value = result.factions;
      },
    );
  }

  static Route<FilterFactionsResult> openFilterFactionsPage(BuildContext context, Object? arguments) {
    final result = FilterFactionsResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute(
      builder: (context) => FilterFactionsPage.withOverrides(
        sides: result.sides,
        factions: result.factions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sides = ref.watch(filterSidesProvider);
    final factions = ref.watch(filterFactionsProvider);
    if (!factions.value.visible) return const SizedBox.shrink();

    final factionList = ref.watch(factionListProvider);
    return ListTile(
      title: const Text('Factions'),
      subtitle: factionList.whenOrNull<Widget?>(
        error: (error, stackTrace) => Text(error.toString()),
        data: (items) => factions.value.isNotEmpty
            ? Text(items
                .where((element) => factions.value.contains(element.faction.code))
                .map((e) => e.faction.name)
                .join(', '))
            : null,
      ),
      onTap: () => filterFactionsRoute.present(FilterFactionsResult(
        sides: sides.value,
        factions: factions.value,
      ).toJson()),
    );
  }

  @override
  String? restorationId = 'deck_filter_factions';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(filterFactionsRoute, 'filterFactionsRoute');
  }
}

class DeckFilterTypes extends ConsumerStatefulWidget {
  const DeckFilterTypes({super.key});

  @override
  DeckFilterTypesState createState() => DeckFilterTypesState();
}

class DeckFilterTypesState extends ConsumerState<DeckFilterTypes> with RestorationMixin {
  late RestorableRouteFuture<FilterTypesResult> filterTypesRoute;

  @override
  void initState() {
    super.initState();

    filterTypesRoute = RestorableRouteFuture<FilterTypesResult>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openFilterTypesPage,
        arguments: arguments,
      ),
      onComplete: (result) {
        final filterSides = ref.read(filterSidesProvider);
        filterSides.value = result.sides;

        final filterTypes = ref.read(filterTypesProvider);
        filterTypes.value = result.types;
      },
    );
  }

  static Route<FilterTypesResult> openFilterTypesPage(BuildContext context, Object? arguments) {
    final result = FilterTypesResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute(
      builder: (context) => FilterTypesPage.withOverrides(
        sides: result.sides,
        types: result.types,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sides = ref.watch(filterSidesProvider);
    final types = ref.watch(filterTypesProvider);
    if (!types.value.visible) return const SizedBox.shrink();

    final typeList = ref.watch(typeListProvider);
    return ListTile(
      title: const Text('Types'),
      subtitle: typeList.whenOrNull<Widget?>(
        error: (error, stackTrace) => Text(error.toString()),
        data: (items) => types.value.isNotEmpty
            ? Text(items.where((element) => types.value.contains(element.type.code)).map((e) => e.type.name).join(', '))
            : null,
      ),
      onTap: () => filterTypesRoute.present(FilterTypesResult(
        sides: sides.value,
        types: types.value,
      ).toJson()),
    );
  }

  @override
  String? restorationId = 'deck_filter_types';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(filterTypesRoute, 'filterTypesRoute');
  }
}

class DeckFilterTags extends ConsumerStatefulWidget {
  const DeckFilterTags({super.key});

  @override
  DeckFilterTagsState createState() => DeckFilterTagsState();
}

class DeckFilterTagsState extends ConsumerState<DeckFilterTags> with RestorationMixin {
  late RestorableRouteFuture<Set<String>> filterTagsRoute;

  @override
  void initState() {
    super.initState();

    filterTagsRoute = RestorableRouteFuture<Set<String>>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openFilterTagsPage,
        arguments: arguments,
      ),
      onComplete: (result) {
        final filterTags = ref.read(filterTagsProvider);
        filterTags.value = result;
      },
    );
  }

  static Route<Set<String>> openFilterTagsPage(BuildContext context, Object? arguments) {
    final tags = Set<String>.from(arguments as List);
    return MaterialPageRoute(
      builder: (context) => FilterTagsPage.withOverrides(
        tags: tags,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tags = ref.watch(filterTagsProvider);
    final tagList = ref.watch(distinctTagListProvider);
    return ListTile(
      title: const Text('Tags'),
      subtitle: tagList.whenOrNull<Widget?>(
        error: (error, stackTrace) => Text(error.toString()),
        data: (items) =>
            tags.value.isNotEmpty ? Text(items.where((e) => tags.value.contains(e)).map((e) => e).join(', ')) : null,
      ),
      onTap: () => filterTagsRoute.present(tags.value.toList()),
    );
  }

  @override
  String? restorationId = 'deck_filter_tags';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(filterTagsRoute, 'filterTagsRoute');
  }
}
