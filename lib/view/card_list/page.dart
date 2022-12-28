import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'appbar.dart';
import 'body.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
class CardListArguments with _$CardListArguments {
  const factory CardListArguments({
    required DeckResult deck,
    required Map<String, int> deckCards,
    required String? filterSearch,
    required bool filterCollection,
    required FilterType<String> filterPacks,
    required FilterType<String> filterSides,
    required FilterType<String> filterFactions,
    required FilterType<String> filterTypes,
  }) = _CardListArguments;

  factory CardListArguments.fromJson(Map<String, dynamic> json) => _$CardListArgumentsFromJson(json);
}

@freezed
class CardListResults with _$CardListResults {
  const factory CardListResults({
    required Map<String, int> deckCards,
    required String? filterSearch,
    required bool filterCollection,
    required FilterType<String> filterPacks,
    required FilterType<String> filterSides,
    required FilterType<String> filterFactions,
    required FilterType<String> filterTypes,
  }) = _CardListResults;
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
    String? filterSearch,
    bool? filterCollection,
    FormatData? filterFormat,
    RotationViewData? filterRotation,
    MwlViewData? filterMwl,
    FilterType<String>? filterPacks,
    FilterType<String>? filterSides,
    FilterType<String>? filterFactions,
    FilterType<String>? filterTypes,
    DeckResult? deck,
    Map<String, int>? deckCards,
    required Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card) itemBuilder,
  }) {
    return RestorableProviderScope(
      restorationId: restorationId,
      overrides: [
        filterSearchProvider.overrideWith((ref) => RestorableStringN(filterSearch)),
        filterCollectionProvider.overrideWith((ref) => RestorableBool(filterCollection ?? false)),
        filterFormatProvider.overrideWith((ref) => RestorableFormatData(filterFormat)),
        filterRotationProvider.overrideWith((ref) => RestorableRotationData(filterRotation)),
        filterMwlProvider.overrideWith((ref) => RestorableMwlData(filterMwl)),
        filterPacksProvider.overrideWith((ref) => RestorableFilterType(filterPacks ?? FilterType())),
        filterSidesProvider.overrideWith((ref) => RestorableFilterType(filterSides ?? FilterType())),
        filterFactionsProvider.overrideWith((ref) => RestorableFilterType(filterFactions ?? FilterType())),
        filterTypesProvider.overrideWith((ref) => RestorableFilterType(filterTypes ?? FilterType())),
        deckCardListNotifierProvider.overrideWith((ref) => deckCards != null ? DeckCardsNotifier(deckCards) : null),
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
          filterSearch: ref.read(filterSearchProvider).value,
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
