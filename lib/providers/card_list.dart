import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/extensions.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'deck.dart';
import 'filters.dart';

final cardListDeckProvider = Provider<DeckFullResult?>((ref) => null);

final deckCardFilterProvider = StreamProvider<drift.Expression<bool>>((ref) async* {
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

final deckCardListNotifierProvider = RestorableProvider<DeckCardsNotifier?>(
  (ref) => throw UnimplementedError(),
  restorationId: 'deckCardListNotifierProvider',
);

final cardQueryBuilderProvider = Provider.family<CardQueryBuilder, CardFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  return CardQueryBuilder(
    db,
    state.card,
    state.pack,
    state.cycle,
    state.faction,
    state.side,
    state.type,
    state.subtype,
    state.mwlCard,
  );
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

final cardFilterProvider = Provider.family<drift.Expression<bool>, CardFilterState>((ref, state) {
  final cardQueryBuilder = ref.watch(cardQueryBuilderProvider(state));
  final parsedQuery = ref.watch(filterQueryProvider);
  final collectionFilter = ref.watch(filterCollectionFilterProvider(state));
  final rotationFilter = ref.watch(filterRotationFilterProvider(state));
  final mwlFilter = ref.watch(filterMwlCardFilterProvider(state));
  final packFilter = ref.watch(filterPackFilterProvider(state));
  final factionFilter = ref.watch(filterFactionFilterProvider(state));
  final typeFilter = ref.watch(filterTypeFilterProvider(state));
  return buildAnd([
    if (parsedQuery != null) cardQueryBuilder.build(parsedQuery),
    if (state.filterCollection && collectionFilter != null) collectionFilter,
    if (state.filterRotation && rotationFilter != null) rotationFilter,
    if (state.filterMwl && mwlFilter != null) mwlFilter,
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
  filterMwlCardFilterProvider,
  filterPackFilterProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
]);

final cardListProvider = StreamProvider<List<CardResult>>((ref) async* {
  final db = ref.watch(dbProvider);
  final mwlCode = ref.watch(filterMwlProvider).value?.code;
  final deckFilter = await ref.watch(deckCardFilterProvider.future);
  yield* db
      .listCards(
        mwlCode: mwlCode,
        where: (card, pack, cycle, faction, side, type, subtype, mwlCard) {
          final cardFilter = ref.watch(cardFilterProvider(CardFilterState(
            card: card,
            pack: pack,
            cycle: cycle,
            faction: faction,
            side: side,
            type: type,
            subtype: subtype,
            mwlCard: mwlCard,
          )));
          return buildAnd([
            cardFilter,
            deckFilter,
          ]);
        },
      )
      .watch();
}, dependencies: [
  dbProvider,
  cardFilterProvider,
  filterMwlProvider,
  deckCardFilterProvider,
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
  settingsProvider,
  cardListProvider,
  deckCardListProvider,
]);

final cardItemBuilderProvider =
    Provider<Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card)>(
        (ref) => throw UnimplementedError());

final mwlCardMapProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final mwl = ref.watch(filterMwlProvider).value;
  final mwlCardList =
      db.listMwlCardTitle(where: (mwlCard) => mwlCard.mwlCode.equalsExp(drift.Variable(mwl?.code))).watch();
  return mwlCardList.map((event) {
    return event.map((e) => MapEntry(e.cardTitle, e)).toMap();
  });
}, dependencies: [dbProvider, filterMwlProvider]);
