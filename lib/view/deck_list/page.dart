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
    required this.automaticallyImplyLeading,
    required this.title,
    Key? key,
  }) : super(key: key);

  static withOverrides({
    bool automaticallyImplyLeading = false,
    required String title,
    bool filterSearching = false,
    Query? filterQuery,
    FormatData? filterFormat,
    RotationData? filterRotation,
    MwlData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    required Widget Function(BuildContext context, WidgetRef ref, int index, DeckResult2 deck) itemBuilder,
    Widget? fab,
  }) {
    return ProviderScope(
      overrides: [
        filterSearchingProvider.overrideWithValue(StateController(filterSearching)),
        filterQueryProvider.overrideWithValue(StateController(filterQuery)),
        filterFormatProvider.overrideWithValue(StateController(filterFormat)),
        filterRotationProvider.overrideWithValue(StateController(filterRotation)),
        filterMwlProvider.overrideWithValue(StateController(filterMwl)),
        filterPacksProvider.overrideWithValue(StateController(filterPacks ?? FilterType())),
        filterSidesProvider.overrideWithValue(StateController(filterSides ?? FilterType())),
        filterFactionsProvider.overrideWithValue(StateController(filterFactions ?? FilterType())),
        filterTypesProvider.overrideWithValue(StateController(filterTypes ?? FilterType())),
        filterTagsProvider.overrideWithValue(StateController(const {})),
        deckItemBuilderProvider.overrideWithValue(itemBuilder),
        deckFabProvider.overrideWithValue(fab),
      ],
      child: DeckListPage(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title,
      ),
    );
  }

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
