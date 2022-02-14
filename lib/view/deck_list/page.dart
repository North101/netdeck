import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'appbar.dart';
import 'body.dart';

class DeckListPage extends ConsumerWidget {
  const DeckListPage({Key? key}) : super(key: key);

  static withOverrides({
    bool filterSearching = false,
    Query? filterQuery,
    FormatData? filterFormat,
    RotationData? filterRotation,
    MwlData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String?>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
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
      ],
      child: const DeckListPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DeckListAppBar(title: 'Decks'),
      body: const DeckListBody(),
    );
  }
}
