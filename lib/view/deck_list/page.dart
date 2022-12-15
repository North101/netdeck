import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

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
    String? filterSearch,
    FormatData? filterFormat,
    RotationViewData? filterRotation,
    MwlViewData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    Set<String>? filterTags,
    required Widget Function(BuildContext context, WidgetRef ref, int index, DeckFullResult deck) itemBuilder,
    Widget? fab,
  }) {
    return RestorableProviderScope(
      restorationId: restorationId,
      overrides: [
        filterSearchProvider.overrideWith((ref) => RestorableStringN(filterSearch)),
        filterFormatProvider.overrideWith((ref) => RestorableFormatData(filterFormat)),
        filterRotationProvider.overrideWith((ref) => RestorableRotationData(filterRotation)),
        filterMwlProvider.overrideWith((ref) => RestorableMwlData(filterMwl)),
        filterPacksProvider.overrideWith((ref) => RestorableFilterType(filterPacks ?? FilterType())),
        filterSidesProvider.overrideWith((ref) => RestorableFilterType(filterSides ?? FilterType())),
        filterFactionsProvider.overrideWith((ref) => RestorableFilterType(filterFactions ?? FilterType())),
        filterTypesProvider.overrideWith((ref) => RestorableFilterType(filterTypes ?? FilterType())),
        filterTagsProvider.overrideWith((ref) => RestorableSet(filterTags ?? const {})),
        selectedDeckIdsProvider.overrideWith((ref) => RestorableSet<String>({})),
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
