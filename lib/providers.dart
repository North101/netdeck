import 'dart:math';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/filter_type.dart';
import '/util/nrdb/private.dart';
import '/util/nrdb/public.dart';

final dbProvider = Provider<Database>((ref) => Database());

final nrdbAuthStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(OfflineAuthState(ref, null));
});

final nrdbPublicApiProvider = StateNotifierProvider<NrdbPublicApiNotifier, AsyncValue<DateTime>>((ref) {
  final db = ref.watch(dbProvider);
  return NrdbPublicApiNotifier(NrdbPublicApi(db));
});

final initSettingsProvider = FutureProvider((ref) {
  final db = ref.read(dbProvider);
  return db.getSettings().getSingle();
});

final settingProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.getSettings().watchSingle();
});

final settingResultProvider = Provider<SettingResult>((ref) => throw UnimplementedError());

final formatProvider = Provider<FormatData?>((ref) => throw UnimplementedError());

final formatListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listFormats().watch();
});

final rotationProvider = Provider<RotationData?>((ref) => throw UnimplementedError());

final rotationListProvider = StreamProvider.family<List<RotationData>, FormatData?>((ref, format) {
  final db = ref.watch(dbProvider);
  return db.listRotations(where: format?.code.let(db.rotation.formatCode.equals) ?? trueExpression).watch();
});

final mwlProvider = Provider<MwlData?>((ref) => throw UnimplementedError());

final mwlListProvider = StreamProvider.family<List<MwlData>, FormatData?>((ref, format) {
  final db = ref.watch(dbProvider);
  return db.listMwl(where: format?.code.let(db.mwl.formatCode.equals) ?? trueExpression).watch();
});

final collectionProvider = StreamProvider.family<List<CollectionResult>, bool>((ref, inCollection) {
  final db = ref.watch(dbProvider);
  return db.listCollection(inCollection: inCollection).watch();
});

final collectionByCycleProvider =
    StreamProvider.family<Iterable<MapEntry<CycleData, List<CollectionResult>>>, bool>((ref, inCollection) {
  final collection = ref.watch(collectionProvider(inCollection).stream);
  return collection.map((items) {
    return groupBy<CollectionResult, CycleData>(items, (item) {
      return item.cycle;
    }).entries;
  });
});

final filterSearchingProvider = StateProvider<bool>((_) => throw UnimplementedError());
final filterQueryProvider = StateProvider<Query?>((_) => throw UnimplementedError());
final filterFormatProvider = StateProvider<FormatData?>((_) => throw UnimplementedError());
final filterRotationProvider = StateProvider<RotationData?>((_) => throw UnimplementedError());
final filterMwlProvider = StateProvider<MwlData?>((_) => throw UnimplementedError());
final filterCollectionProvider = StateProvider<bool>((_) => throw UnimplementedError());
final filterPacksProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterSidesProvider = StateProvider<FilterType<String?>>((_) => throw UnimplementedError());
final filterFactionsProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterTypesProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());

final filterRotationFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final rotation = ref.watch(filterRotationProvider);
  if (rotation == null) return null;

  return db.cycle.code.isInQuery(db.selectOnly(db.rotationCycle).also((e) {
    e.addColumns([db.rotationCycle.cycleCode]);
    e.where(db.rotationCycle.rotationCode.equals(rotation.code));
  }));
}, dependencies: [dbProvider, filterRotationProvider]);

final filterMwlFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final mwl = ref.watch(filterMwlProvider);
  if (mwl == null) return null;

  return buildOr([
    db.mwlCard.deckLimit.isNull(),
    db.mwlCard.deckLimit.isBiggerThanValue(0),
  ]);
}, dependencies: [dbProvider, filterMwlProvider]);

final filterCollectionFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final collection = ref.watch(filterCollectionProvider);
  if (!collection) return null;

  return db.pack.code.isInQuery(db.select(db.collection));
}, dependencies: [dbProvider, filterCollectionProvider]);

final filterPackFilterProvider = Provider.family<drift.Expression<bool?>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final packs = ref.watch(filterPacksProvider);
  return buildAnd([
    if (state.always && packs.always.isNotEmpty) db.pack.code.isIn(packs.always),
    if (state.values && packs.isNotEmpty) db.pack.code.isIn(packs),
    if (state.never && packs.never.isNotEmpty) db.pack.code.isNotIn(packs.never),
  ]);
}, dependencies: [dbProvider, filterPacksProvider]);

final filterSideFilterProvider = Provider.family<drift.Expression<bool?>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final sides = ref.watch(filterSidesProvider);
  return buildAnd([
    if (state.always && sides.always.isNotEmpty) db.side.code.isIn(sides.always),
    if (state.values && sides.values.isNotEmpty) db.side.code.isIn(sides.values),
    if (state.never && sides.never.isNotEmpty) db.side.code.isNotIn(sides.never),
  ]);
}, dependencies: [dbProvider, filterSidesProvider]);

final filterFactionFilterProvider = Provider.family<drift.Expression<bool?>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final factions = ref.watch(filterFactionsProvider);
  final sideFilter = ref.watch(filterSideFilterProvider(FilterState(never: state.never)));
  return buildAnd([
    sideFilter,
    if (factions.always.isNotEmpty) db.faction.code.isIn(factions.always),
    if (state.values && factions.values.isNotEmpty) db.faction.code.isIn(factions.values),
    if (state.never && factions.never.isNotEmpty) db.faction.code.isNotIn(factions.never),
  ]);
}, dependencies: [dbProvider, filterFactionsProvider]);

final filterTypeFilterProvider = Provider.family<drift.Expression<bool?>, TypeFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final types = ref.watch(filterTypesProvider);
  final sideFilter = ref.watch(filterSideFilterProvider(FilterState(never: state.never)));
  final whereType = buildAnd([
    if (state.always && types.always.isNotEmpty) db.type.code.isIn(types.always),
    if (state.values && types.values.isNotEmpty) db.type.code.isIn(types.values),
    if (state.never && types.never.isNotEmpty) db.type.code.isNotIn(types.never),
  ]);
  final subtype = db.type.createAlias('subtype');
  return buildAnd([
    sideFilter,
    buildOr([
      whereType,
      if (state.subtypes)
        buildAnd([
          if (state.always && types.always.isNotEmpty) subtype.code.isIn(types.always),
          if (state.values && types.values.isNotEmpty) subtype.code.isIn(types.values),
          if (state.never && types.never.isNotEmpty) subtype.code.isNotIn(types.never),
        ]),
    ])
  ]);
}, dependencies: [dbProvider, filterTypesProvider, filterSideFilterProvider]);

final cardQueryBuilderProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return CardQueryBuilder(db);
});

final hasCardFilterProvider = Provider((ref) {
  final collection = ref.watch(filterCollectionProvider);
  final rotation = ref.watch(filterRotationProvider);
  final mwl = ref.watch(filterMwlProvider);
  final packs = ref.watch(filterPacksProvider);
  final factions = ref.watch(filterFactionsProvider);
  final types = ref.watch(filterTypesProvider);
  return collection || rotation != null || mwl != null || packs.isVisible || factions.isVisible || types.isVisible;
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
  final parsedQuery = ref.watch(filterQueryProvider);
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

final cardListProvider = StreamProvider<List<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final cardFilter = ref.watch(cardFilterProvider(const CardFilterState()));
  return db.listCards(where: cardFilter).watch();
}, dependencies: [dbProvider, cardFilterProvider]);

final groupedCardListProvider = StreamProvider<HeaderList<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final cardListStream = ref.watch(cardListProvider.stream);
  final deckCardList = ref.watch(deckCardListProvider.notifier).original;
  return Rx.combineLatest2<SettingResult, List<CardResult>, HeaderList<CardResult>>(
    settingsStream,
    cardListStream,
    (settings, cardList) {
      final groupBy = settings.settings.cardGroup ?? CardGroup.type;
      final sortBy = settings.settings.cardSort ?? CardSort.set;
      return HeaderList([
        if (deckCardList.isNotEmpty) HeaderItems('Deck', sortBy(deckCardList)),
        ...groupBy(sortBy(cardList)),
      ]);
    },
  );
}, dependencies: [dbProvider, cardListProvider.stream, deckCardListProvider.notifier]);

final deckQueryBuilderProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return DeckQueryBuilder(db);
});

final hasDeckFilterProvider = Provider((ref) {
  final rotation = ref.watch(filterRotationProvider);
  final mwl = ref.watch(filterMwlProvider);
  final packs = ref.watch(filterPacksProvider);
  final factions = ref.watch(filterFactionsProvider);
  final types = ref.watch(filterTypesProvider);
  return rotation != null || mwl != null || packs.isVisible || factions.isVisible || types.isVisible;
}, dependencies: [
  filterRotationProvider,
  filterMwlProvider,
  filterPacksProvider,
  filterFactionsProvider,
  filterTypesProvider,
]);

final deckFilterProvider = Provider.family<drift.Expression<bool?>, CardFilterState>((ref, state) {
  final deckQueryBuilder = ref.watch(deckQueryBuilderProvider);
  final parsedQuery = ref.watch(filterQueryProvider);
  final rotationFilter = ref.watch(filterRotationFilterProvider);
  final mwlFilter = ref.watch(filterMwlFilterProvider);
  final packFilter = ref.watch(filterPackFilterProvider(state));
  final factionFilter = ref.watch(filterFactionFilterProvider(state));
  final typeFilter = ref.watch(filterTypeFilterProvider(state));
  return buildAnd([
    if (parsedQuery != null) deckQueryBuilder.build(parsedQuery),
    if (state.rotation && rotationFilter != null) rotationFilter,
    if (state.mwl && mwlFilter != null) mwlFilter,
    packFilter,
    factionFilter,
    typeFilter,
  ]);
}, dependencies: [
  dbProvider,
  deckQueryBuilderProvider,
  filterQueryProvider,
  filterRotationFilterProvider,
  filterMwlFilterProvider,
  filterPackFilterProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
]);

final deckListProvider = StreamProvider<List<DeckResult>>((ref) {
  final db = ref.watch(dbProvider);
  final deckFilter = ref.watch(deckFilterProvider(const CardFilterState()));
  return db.listDecks(where: deckFilter).watch();
}, dependencies: [dbProvider, deckFilterProvider]);

final groupedDeckListProvider = StreamProvider<HeaderList<DeckResult>>((ref) {
  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final deckListStream = ref.watch(deckListProvider.stream);
  return Rx.combineLatest2<SettingResult, List<DeckResult>, HeaderList<DeckResult>>(
    settingsStream,
    deckListStream,
    (settings, deckList) {
      final groupBy = settings.settings.deckGroup ?? DeckGroup.side;
      final sortBy = settings.settings.deckSort ?? DeckSort.set;
      return HeaderList([
        ...groupBy(sortBy(deckList)),
      ]);
    },
  );
}, dependencies: [dbProvider, deckListProvider.stream]);

final countStuffProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final factionsFilter = ref.watch(filterFactionFilterProvider(const FilterState(
    values: false,
    always: false,
  )));
  final typesFilter = ref.watch(filterTypeFilterProvider(const TypeFilterState(
    values: false,
    always: false,
    subtypes: false,
  )));
  return db
      .countStuff(
        factions: factionsFilter,
        types: typesFilter,
      )
      .watchSingle();
}, dependencies: [
  dbProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
]);

final currentIndexProvider = StateProvider<int?>((ref) => throw UnimplementedError());

final deckProvider = StateProvider<DeckResult>((ref) => throw UnimplementedError());

final deckCardListProvider =
    StateNotifierProvider<DeckCardListNotifier, Map<CardResult, int>>((ref) => throw UnimplementedError());

class DeckCardListNotifier extends StateNotifier<Map<CardResult, int>> {
  DeckCardListNotifier(Map<CardResult, int> state)
      : original = {...state.keys},
        super(state);

  Set<CardResult> original;

  void inc(CardResult key) {
    final value = min(get(key) + 1, key.card.deckLimit);
    set(key, value);
  }

  void dec(CardResult key) {
    final value = max(get(key) - 1, 0);
    set(key, value);
  }

  void set(CardResult key, int value) {
    state = {
      for (final entry in state.entries.where((e) => e.key != key)) entry.key: entry.value,
      if (value > 0) key: value,
    };
  }

  int get(CardResult key) => state[key] ?? 0;

  void update() {
    original = {...state.keys};
  }
}

final deckTagsProvider = StateProvider<List<String>>((ref) => throw UnimplementedError());

final groupedDeckCardListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final settings = db.getSettings().watchSingle();
  final deck = ref.watch(deckProvider);
  final deckCardList = ref.watch(deckCardListProvider);
  return settings.map((settings) {
    final groupBy = settings.settings.deckCardGroup ?? CardGroup.type;
    final sortBy = settings.settings.deckCardSort ?? CardSort.name;
    return HeaderList([
      HeaderItems(deck.type.name, [deck.toCard()]),
      ...groupBy(sortBy(deckCardList.keys)),
    ]);
  });
});

final cardTileProvider = Provider<Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card)>(
    (ref) => throw UnimplementedError());
