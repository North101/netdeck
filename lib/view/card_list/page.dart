import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/providers.dart';
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
    StateController<bool>? filterSearching,
    StateController<Query?>? filterQuery,
    StateController<bool>? filterCollection,
    StateController<FormatData?>? filterFormat,
    StateController<RotationData?>? filterRotation,
    StateController<MwlData?>? filterMwl,
    StateController<FilterType<String>>? filterPacks,
    StateController<FilterType<String>>? filterSides,
    StateController<FilterType<String>>? filterFactions,
    StateController<FilterType<String>>? filterTypes,
    DeckNotifier<DeckResult2?>? deckNotifier,
    required Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card) itemBuilder,
    Key? key,
  }) {
    return ProviderScope(
      overrides: [
        filterSearchingProvider.overrideWithValue(filterSearching ?? StateController(false)),
        filterQueryProvider.overrideWithValue(filterQuery ?? StateController(null)),
        filterCollectionProvider.overrideWithValue(filterCollection ?? StateController(false)),
        filterFormatProvider.overrideWithValue(filterFormat ?? StateController(null)),
        filterRotationProvider.overrideWithValue(filterRotation ?? StateController(null)),
        filterMwlProvider.overrideWithValue(filterMwl ?? StateController(null)),
        filterPacksProvider.overrideWithValue(filterPacks ?? StateController(FilterType())),
        filterSidesProvider.overrideWithValue(filterSides ?? StateController(FilterType())),
        filterFactionsProvider.overrideWithValue(filterFactions ?? StateController(FilterType())),
        filterTypesProvider.overrideWithValue(filterTypes ?? StateController(FilterType())),
        cardListDeckProvider.overrideWithValue(deckNotifier ?? DeckNotifier(null)),
        cardItemBuilderProvider.overrideWithValue(itemBuilder),
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
