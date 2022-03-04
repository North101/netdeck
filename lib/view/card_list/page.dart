import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/deck_validator.dart';
import '/util/filter_type.dart';
import 'appbar.dart';
import 'body.dart';

class CardListPage extends ConsumerWidget {
  const CardListPage({
    required this.automaticallyImplyLeading,
    this.color,
    required this.title,
    Key? key,
  }) : super(key: key);

  static withOverrides({
    bool automaticallyImplyLeading = true,
    Color? color,
    required String title,
    bool filterSearching = false,
    Query? filterQuery,
    bool filterCollection = false,
    FormatData? filterFormat,
    RotationData? filterRotation,
    MwlData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    DeckValidator? deckValidator,
    required Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card) cardTile,
    Key? key,
  }) {
    return ProviderScope(
      overrides: [
        filterSearchingProvider.overrideWithValue(StateController(filterSearching)),
        filterQueryProvider.overrideWithValue(StateController(filterQuery)),
        filterCollectionProvider.overrideWithValue(StateController(filterCollection)),
        filterFormatProvider.overrideWithValue(StateController(filterFormat)),
        filterRotationProvider.overrideWithValue(StateController(filterRotation)),
        filterMwlProvider.overrideWithValue(StateController(filterMwl)),
        filterPacksProvider.overrideWithValue(StateController(filterPacks ?? FilterType())),
        filterSidesProvider.overrideWithValue(StateController(filterSides ?? FilterType())),
        filterFactionsProvider.overrideWithValue(StateController(filterFactions ?? FilterType())),
        filterTypesProvider.overrideWithValue(StateController(filterTypes ?? FilterType())),
        cardListDeckValidatorProvider.overrideWithValue(deckValidator),
        cardTileProvider.overrideWithValue(cardTile),
      ],
      child: CardListPage(
        automaticallyImplyLeading: automaticallyImplyLeading,
        color: color,
        title: title,
      ),
    );
  }

  final bool automaticallyImplyLeading;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CardListAppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        color: color,
        title: title,
      ),
      body: const CardListBody(),
    );
  }
}
