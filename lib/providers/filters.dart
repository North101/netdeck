import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers/db.dart';
import '/util/filter_type.dart';

final filterSearchingProvider = StateProvider<bool>((_) => throw UnimplementedError());
final filterQueryProvider = StateProvider<Query?>((_) => throw UnimplementedError());
final filterFormatProvider = StateProvider<FormatData?>((_) => throw UnimplementedError());
final filterRotationProvider = StateProvider<RotationData?>((_) => throw UnimplementedError());
final filterMwlProvider = StateProvider<MwlData?>((_) => throw UnimplementedError());
final filterCollectionProvider = StateProvider<bool>((_) => throw UnimplementedError());
final filterPacksProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterSidesProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterFactionsProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterTypesProvider = StateProvider<FilterType<String>>((_) => throw UnimplementedError());
final filterTagsProvider = StateProvider<Set<String>>((_) => throw UnimplementedError());

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
  final sideFilter = ref.watch(filterSideFilterProvider(FilterState(
    always: state.always,
    never: state.never,
  )));
  return buildAnd([
    sideFilter,
    if (state.always && factions.always.isNotEmpty) db.faction.code.isIn(factions.always),
    if (state.values && factions.values.isNotEmpty) db.faction.code.isIn(factions.values),
    if (state.never && factions.never.isNotEmpty) db.faction.code.isNotIn(factions.never),
  ]);
}, dependencies: [dbProvider, filterFactionsProvider]);

final filterTypeFilterProvider = Provider.family<drift.Expression<bool?>, TypeFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final types = ref.watch(filterTypesProvider);
  final sideFilter = ref.watch(filterSideFilterProvider(FilterState(
    always: state.always,
    never: state.never,
  )));
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

final tagFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final tags = ref.watch(filterTagsProvider);
  if (tags.isEmpty) return trueExpression;
  return db.deck.id.isInQuery(
    db.selectOnly(db.deckTag).also((e) {
      e.addColumns([db.deckTag.deckId]);
      e.where(db.deckTag.tag.isIn(tags));
    }),
  );
}, dependencies: [dbProvider, filterTagsProvider]);

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
