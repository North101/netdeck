import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'appbar.dart';
import 'body.dart';

class DeckListPage extends ConsumerWidget {
  const DeckListPage({
    required this.restorationId,
    required this.automaticallyImplyLeading,
    required this.title,
    super.key,
  });

  static Widget withOverrides({
    required String restorationId,
    bool automaticallyImplyLeading = false,
    required String title,
    bool? filterSearching,
    Query? filterQuery,
    FormatData? filterFormat,
    RotationData? filterRotation,
    MwlData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    Set<String>? filterTags,
    required Widget Function(BuildContext context, WidgetRef ref, int index, DeckFullResult deck) itemBuilder,
    Widget? fab,
  }) {
    return ProviderScope(
      restorationId: restorationId,
      overrides: [
        filterSearchingProvider.overrideWithValue(RestorableBool(filterSearching ?? false), 'filterSearchingProvider'),
        filterQueryProvider.overrideWithValue(RestorableQuery(filterQuery), 'filterQueryProvider'),
        filterFormatProvider.overrideWithValue(RestorableFormatData(filterFormat), 'filterFormatProvider'),
        filterRotationProvider.overrideWithValue(RestorableRotationData(filterRotation), 'filterRotationProvider'),
        filterMwlProvider.overrideWithValue(RestorableMwlData(filterMwl), 'filterMwlProvider'),
        filterPacksProvider.overrideWithValue(RestorableFilterType(filterPacks ?? FilterType()), 'filterPacksProvider'),
        filterSidesProvider.overrideWithValue(RestorableFilterType(filterSides ?? FilterType()), 'filterSidesProvider'),
        filterFactionsProvider.overrideWithValue(
            RestorableFilterType(filterFactions ?? FilterType()), 'filterFactionsProvider'),
        filterTypesProvider.overrideWithValue(RestorableFilterType(filterTypes ?? FilterType()), 'filterTypesProvider'),
        filterTagsProvider.overrideWithValue(RestorableSet(filterTags ?? const {}), 'filterTagsProvider'),
        selectedDeckIdsProvider.overrideWithValue(RestorableSet<String>({}), 'selectedDeckIdsProvider'),
        deckItemBuilderProvider.overrideWithValue(itemBuilder),
        deckFabProvider.overrideWithValue(fab),
      ],
      child: DeckListPage(
        restorationId: restorationId,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
      ),
    );
  }

  final String restorationId;
  final bool automaticallyImplyLeading;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fab = ref.watch(deckFabProvider);
    return Scaffold(
      appBar: DeckListAppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
      ),
      body: const DeckListBody(),
      floatingActionButton: fab,
    );
  }
}
