import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/extensions.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'deck.dart';
import 'filters.dart';

final cardListDeckProvider = Provider<DeckFullResult?>((ref) => null);

final deckCardFilterProvider = StreamProvider<drift.Expression<bool?>>((ref) async* {
  final deck = ref.watch(cardListDeckProvider);
  if (deck == null) {
    yield trueExpression;
    return;
  }

  final db = ref.watch(dbProvider);
  final deckValidator = await ref.watch(deckValidatorProvider(deck).future);
  yield deckValidator.filter(db);
}, dependencies: [
  dbProvider,
  cardListDeckProvider,
  deckValidatorProvider,
]);

class DeckCardsNotifier extends RestorableValue<Map<String, int>> {
  DeckCardsNotifier(this._defaultValue);

  final Map<String, int> _defaultValue;

  @override
  Map<String, int> createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Map<String, int>? oldValue) {
    notifyListeners();
  }

  @override
  Map<String, int> fromPrimitives(Object? data) => (data as Map).cast();

  @override
  Object? toPrimitives() => value;

  bool changed = false;

  set unsaved(Map<String, int> value) {
    changed = true;
    this.value = value;
  }

  set saved(Map<String, int> value) {
    changed = false;
    this.value = value;
  }

  void incCard(CardResult key) {
    final value = min(getCard(key) + 1, key.card.deckLimit);
    setCard(key, value);
  }

  void decCard(CardResult key) {
    final value = max(getCard(key) - 1, 0);
    setCard(key, value);
  }

  void setCard(CardResult key, int value) {
    unsaved = {
      for (final entry in this.value.entries.where((e) => e.key != key.code)) entry.key: entry.value,
      if (value > 0) key.code: value,
    };
  }

  int getCard(CardResult key) => value[key.code] ?? 0;
}

final deckCardListNotifierProvider = RestorableProvider<DeckCardsNotifier?>((ref) => throw UnimplementedError());

final cardQueryBuilderProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return CardQueryBuilder(db);
});

final hasCardFilterProvider = Provider((ref) {
  final collection = ref.watch(filterCollectionProvider).value;
  final rotation = ref.watch(filterRotationProvider.select((value) => value.value != null));
  final mwl = ref.watch(filterMwlProvider.select((value) => value.value != null));
  final packs = ref.watch(filterPacksProvider.select((value) => value.value.isVisible));
  final factions = ref.watch(filterFactionsProvider.select((value) => value.value.isVisible));
  final types = ref.watch(filterTypesProvider.select((value) => value.value.isVisible));
  return collection || rotation || mwl || packs || factions || types;
}, dependencies: [
  filterCollectionProvider,
  filterRotationProvider,
  filterMwlProvider,
  filterPacksProvider,
  filterFactionsProvider,
  filterTypesProvider,
]);

final cardFilterProvider = Provider.family<drift.Expression<bool?>, CardFilterState>((ref, state) {
  final cardQueryBuilder = ref.watch(cardQueryBuilderProvider);
  final parsedQuery = ref.watch(filterQueryProvider).value;
  final collectionFilter = ref.watch(filterCollectionFilterProvider);
  final rotationFilter = ref.watch(filterRotationFilterProvider);
  final mwlFilter = ref.watch(filterMwlFilterProvider);
  final packFilter = ref.watch(filterPackFilterProvider(state));
  final factionFilter = ref.watch(filterFactionFilterProvider(state));
  final typeFilter = ref.watch(filterTypeFilterProvider(state));
  return buildAnd([
    if (parsedQuery != null) cardQueryBuilder.build(parsedQuery),
    if (state.collection && collectionFilter != null) collectionFilter,
    if (state.rotation && rotationFilter != null) rotationFilter,
    if (state.mwl && mwlFilter != null) mwlFilter,
    packFilter,
    factionFilter,
    typeFilter,
  ]);
}, dependencies: [
  dbProvider,
  cardQueryBuilderProvider,
  filterQueryProvider,
  filterCollectionFilterProvider,
  filterRotationFilterProvider,
  filterMwlFilterProvider,
  filterPackFilterProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
]);

final cardListProvider = StreamProvider<List<CardResult>>((ref) async* {
  final db = ref.watch(dbProvider);
  final mwlCode = ref.watch(filterMwlProvider).value?.code;
  final cardFilter = ref.watch(cardFilterProvider(const CardFilterState()));
  final deckFilter = await ref.watch(deckCardFilterProvider.future);
  yield* db
      .listCards(
        mwlCode: mwlCode,
        where: cardFilter & deckFilter,
      )
      .watch();
}, dependencies: [
  dbProvider,
  cardFilterProvider,
  filterMwlProvider,
  deckCardFilterProvider.future,
]);

final settingsProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.getSettings().watchSingle();
}, dependencies: [
  dbProvider,
]);

final groupedCardListProvider = StreamProvider<HeaderList<CardResult>>((ref) async* {
  final settings = await ref.watch(settingsProvider.future);
  final cardList = await ref.watch(cardListProvider.future);
  final deckCardList = await ref.watch(deckCardListProvider.future);

  final groupBy = settings.settings.cardGroup;
  final sortBy = settings.settings.cardSort;
  yield HeaderList([
    if (deckCardList.isNotEmpty) HeaderItems('Deck', sortBy(deckCardList)),
    ...groupBy(sortBy(cardList)),
  ]);
}, dependencies: [
  settingsProvider.future,
  cardListProvider.future,
  deckCardListProvider.future,
]);

final cardItemBuilderProvider =
    Provider<Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card)>(
        (ref) => throw UnimplementedError());

final mwlCardMapProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final mwl = ref.watch(filterMwlProvider).value;
  final mwlCardList = db.listMwlCard(where: db.mwlCard.mwlCode.equals(mwl?.code)).watch();
  return mwlCardList.map((event) {
    return event.map((e) => MapEntry(e.cardCode, e)).toMap();
  });
}, dependencies: [dbProvider, filterMwlProvider]);
