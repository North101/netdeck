import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'appbar.dart';
import 'body.dart';

class CardListArguments {
  const CardListArguments({
    required this.deck,
    required this.deckCards,
    required this.filterSearching,
    required this.filterQuery,
    required this.filterCollection,
    required this.filterPacks,
    required this.filterSides,
    required this.filterFactions,
    required this.filterTypes,
  });

  final DeckResult deck;
  final Map<String, int> deckCards;
  final bool filterSearching;
  final Query? filterQuery;
  final bool filterCollection;
  final FilterType<String> filterPacks;
  final FilterType<String> filterSides;
  final FilterType<String> filterFactions;
  final FilterType<String> filterTypes;

  factory CardListArguments.fromJson(Map<String, dynamic> json) {
    return CardListArguments(
      deck: DeckResultEx.fromJson((json['deck'] as Map).cast()),
      deckCards: (json['deckCards'] as Map).cast(),
      filterSearching: json['searching'] as bool,
      filterQuery: json['query']?.let((e) => tryParseQuery(e)),
      filterCollection: json['collection'] as bool,
      filterPacks: FilterType<String>.fromJson((json['packs'] as Map).cast()),
      filterSides: FilterType<String>.fromJson((json['sides'] as Map).cast()),
      filterFactions: FilterType<String>.fromJson((json['factions'] as Map).cast()),
      filterTypes: FilterType<String>.fromJson((json['types'] as Map).cast()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deck': deck.toJson(),
      'deckCards': deckCards,
      'searching': filterSearching,
      'query': filterQuery?.toString(),
      'collection': filterCollection,
      'packs': filterPacks.toJson(),
      'sides': filterSides.toJson(),
      'factions': filterFactions.toJson(),
      'types': filterTypes.toJson(),
    };
  }
}

class CardListResults {
  const CardListResults({
    required this.deckCards,
    required this.filterSearching,
    required this.filterQuery,
    required this.filterCollection,
    required this.filterPacks,
    required this.filterSides,
    required this.filterFactions,
    required this.filterTypes,
  });

  final Map<String, int> deckCards;
  final bool filterSearching;
  final Query? filterQuery;
  final bool filterCollection;
  final FilterType<String> filterPacks;
  final FilterType<String> filterSides;
  final FilterType<String> filterFactions;
  final FilterType<String> filterTypes;
}

class CardListPage extends ConsumerWidget {
  const CardListPage({
    required this.automaticallyImplyLeading,
    required this.restorationId,
    this.color,
    required this.title,
    super.key,
  });

  static Widget withOverrides({
    bool automaticallyImplyLeading = true,
    required String restorationId,
    Color? color,
    required String title,
    bool? filterSearching,
    Query? filterQuery,
    bool? filterCollection,
    FormatData? filterFormat,
    RotationData? filterRotation,
    MwlData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    DeckResult? deck,
    Map<String, int>? deckCards,
    required Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card) itemBuilder,
  }) {
    return ProviderScope(
      restorationId: restorationId,
      overrides: [
        filterSearchingProvider.overrideWithValue(RestorableBool(filterSearching ?? false), 'filterSearchingProvider'),
        filterQueryProvider.overrideWithValue(RestorableQuery(filterQuery), 'filterQueryProvider'),
        filterCollectionProvider.overrideWithValue(
            RestorableBool(filterCollection ?? false), 'filterCollectionProvider'),
        filterFormatProvider.overrideWithValue(RestorableFormatData(filterFormat), 'filterFormatProvider'),
        filterRotationProvider.overrideWithValue(RestorableRotationData(filterRotation), 'filterRotationProvider'),
        filterMwlProvider.overrideWithValue(RestorableMwlData(filterMwl), 'filterMwlProvider'),
        filterPacksProvider.overrideWithValue(RestorableFilterType(filterPacks ?? FilterType()), 'filterPacksProvider'),
        filterSidesProvider.overrideWithValue(RestorableFilterType(filterSides ?? FilterType()), 'filterSidesProvider'),
        filterFactionsProvider.overrideWithValue(
            RestorableFilterType(filterFactions ?? FilterType()), 'filterFactionsProvider'),
        filterTypesProvider.overrideWithValue(RestorableFilterType(filterTypes ?? FilterType()), 'filterTypesProvider'),
        deckCardListNotifierProvider.overrideWithValue(
            deckCards != null ? DeckCardsNotifier(deckCards) : null, 'deckCardListNotifierProvider'),
        cardListDeckProvider.overrideWithValue(deck?.toFullResult()),
        deckCardCodeSetProvider.overrideWithValue(deckCards?.keys.toSet() ?? {}),
        cardItemBuilderProvider.overrideWithValue(itemBuilder),
      ],
      child: CardListPage(
        automaticallyImplyLeading: automaticallyImplyLeading,
        restorationId: restorationId,
        color: color,
        title: title,
      ),
    );
  }

  final String restorationId;
  final bool automaticallyImplyLeading;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final deckCards = ref.read(deckCardListNotifierProvider)?.value;
        if (deckCards == null) return true;

        Navigator.of(context).pop(CardListResults(
          deckCards: deckCards,
          filterSearching: ref.read(filterSearchingProvider).value,
          filterQuery: ref.read(filterQueryProvider).value,
          filterCollection: ref.read(filterCollectionProvider).value,
          filterPacks: ref.read(filterPacksProvider).value,
          filterSides: ref.read(filterSidesProvider).value,
          filterFactions: ref.read(filterFactionsProvider).value,
          filterTypes: ref.read(filterTypesProvider).value,
        ));
        return false;
      },
      child: Scaffold(
        appBar: CardListAppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          color: color,
          title: title,
        ),
        body: const CardListBody(),
      ),
    );
  }
}
