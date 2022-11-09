import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers/db.dart';
import '/util/filter_type.dart';

abstract class RestorableData<T extends drift.DataClass?> extends RestorableValue<T> {
  RestorableData(this._defaultValue);

  final T _defaultValue;

  @override
  createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  Object? toPrimitives() => value?.toJson();
}

class RestorableFormatData extends RestorableData<FormatData?> {
  RestorableFormatData(super.defaultValue);

  @override
  fromPrimitives(Object? data) => data != null ? FormatData.fromJson((data as Map).cast()) : null;
}

class RestorableRotationData extends RestorableData<RotationData?> {
  RestorableRotationData(super.defaultValue);

  @override
  fromPrimitives(Object? data) => data != null ? RotationData.fromJson((data as Map).cast()) : null;
}

class RestorableMwlData extends RestorableData<MwlData?> {
  RestorableMwlData(super.defaultValue);

  @override
  fromPrimitives(Object? data) => data != null ? MwlData.fromJson((data as Map).cast()) : null;
}

class RestorableFilterType extends RestorableValue<FilterType<String>> {
  RestorableFilterType(this._defaultValue);

  final FilterType<String> _defaultValue;

  @override
  createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  FilterType<String> fromPrimitives(Object? data) => FilterType<String>.fromJson((data as Map).cast());

  @override
  Object? toPrimitives() => value.toJson();
}

class RestorableSet<T> extends RestorableValue<Set<T>> {
  RestorableSet(this._defaultValue);

  final Set<T> _defaultValue;

  @override
  createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  Set<T> fromPrimitives(Object? data) => Set<T>.from(data as List);

  @override
  Object? toPrimitives() {
    return value.toList();
  }
}

final filterSearchProvider = RestorableProvider<RestorableStringN>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterSearchProvider',
);
final filterFormatProvider = RestorableProvider<RestorableFormatData>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterFormatProvider',
);
final filterRotationProvider = RestorableProvider<RestorableRotationData>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterRotationProvider',
);
final filterMwlProvider = RestorableProvider<RestorableMwlData>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterMwlProvider',
);
final filterCollectionProvider = RestorableProvider<RestorableBool>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterCollectionProvider',
);
final filterPacksProvider = RestorableProvider<RestorableFilterType>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterPacksProvider',
);
final filterSidesProvider = RestorableProvider<RestorableFilterType>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterSidesProvider',
);
final filterFactionsProvider = RestorableProvider<RestorableFilterType>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterFactionsProvider',
);
final filterTypesProvider = RestorableProvider<RestorableFilterType>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterTypesProvider',
);
final filterTagsProvider = RestorableProvider<RestorableSet<String>>(
  (_) => throw UnimplementedError(),
  restorationId: 'filterTagsProvider',
);

final filterSearchingProvider = Provider<bool>((ref) {
  final query = ref.watch(filterSearchProvider).value;
  return query != null;
}, dependencies: [filterSearchProvider]);

final filterQueryProvider = Provider<Query?>((ref) {
  final query = ref.watch(filterSearchProvider).value;
  if (query == null) return null;
  return tryParseQuery(query);
}, dependencies: [filterSearchProvider]);

final filterRotationFilterProvider = Provider.family<drift.Expression<bool>?, CycleFilter>((ref, state) {
  final db = ref.watch(dbProvider);
  final rotationFilter = ref.watch(filterRotationProvider).value;
  if (rotationFilter == null) return null;

  return state.cycle.code.isInQuery(db.selectOnly(db.rotationCycle).also((e) {
    e.addColumns([db.rotationCycle.cycleCode]);
    e.where(db.rotationCycle.rotationCode.equals(rotationFilter.code));
  }));
}, dependencies: [dbProvider, filterRotationProvider]);

final filterDeckRotationFilterProvider = Provider.family<drift.Expression<bool>?, RotationFilter>((ref, state) {
  final rotationFilter = ref.watch(filterRotationProvider).value;
  if (rotationFilter == null) return null;

  return state.rotation.code.equals(rotationFilter.code);
}, dependencies: [dbProvider, filterRotationProvider]);

final filterDeckMwlFilterProvider = Provider.family<drift.Expression<bool>?, MwlFilter>((ref, state) {
  final mwlFilter = ref.watch(filterMwlProvider).value;
  if (mwlFilter == null) return null;

  return state.mwl.code.equals(mwlFilter.code);
}, dependencies: [dbProvider, filterMwlProvider]);

final filterMwlCardFilterProvider = Provider.family<drift.Expression<bool>?, CardFilterState>((ref, state) {
  final mwl = ref.watch(filterMwlProvider).value;
  if (mwl == null) return null;

  return buildOr([
    state.mwlCard.deckLimit.isNull(),
    state.mwlCard.deckLimit.isBiggerThanValue(0),
  ]);
}, dependencies: [dbProvider, filterMwlProvider]);

final filterCollectionFilterProvider = Provider.family<drift.Expression<bool>?, CardFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final collection = ref.watch(filterCollectionProvider).value;
  if (!collection) return null;

  return state.pack.code.isInQuery(db.select(db.collection));
}, dependencies: [dbProvider, filterCollectionProvider]);

final filterPackFilterProvider = Provider.family<drift.Expression<bool>, PackFilter>((ref, state) {
  final packs = ref.watch(filterPacksProvider).value;
  return buildAnd([
    if (state.always && packs.always.isNotEmpty) state.pack.code.isIn(packs.always),
    if (state.values && packs.isNotEmpty) state.pack.code.isIn(packs),
    if (state.never && packs.never.isNotEmpty) state.pack.code.isNotIn(packs.never),
  ]);
}, dependencies: [
  filterPacksProvider,
]);

final filterSideFilterProvider = Provider.family<drift.Expression<bool>, SideFilter>((ref, state) {
  final sides = ref.watch(filterSidesProvider).value;
  return buildAnd([
    if (state.always && sides.always.isNotEmpty) state.side.code.isIn(sides.always),
    if (state.values && sides.values.isNotEmpty) state.side.code.isIn(sides.values),
    if (state.never && sides.never.isNotEmpty) state.side.code.isNotIn(sides.never),
  ]);
}, dependencies: [
  filterSidesProvider,
]);

final filterFactionFilterProvider = Provider.family<drift.Expression<bool>, FactionFilter>((ref, state) {
  final factions = ref.watch(filterFactionsProvider).value;
  final sideFilter = ref.watch(filterSideFilterProvider(state));
  return buildAnd([
    sideFilter,
    if (state.always && factions.always.isNotEmpty) state.faction.code.isIn(factions.always),
    if (state.values && factions.values.isNotEmpty) state.faction.code.isIn(factions.values),
    if (state.never && factions.never.isNotEmpty) state.faction.code.isNotIn(factions.never),
  ]);
}, dependencies: [
  filterFactionsProvider,
  filterSideFilterProvider,
]);

final filterTypeFilterProvider = Provider.family<drift.Expression<bool>, TypeFilter>((ref, state) {
  final types = ref.watch(filterTypesProvider).value;
  final sideFilter = ref.watch(filterSideFilterProvider(state));
  final whereType = buildAnd([
    if (state.always && types.always.isNotEmpty) state.type.code.isIn(types.always),
    if (state.values && types.values.isNotEmpty) state.type.code.isIn(types.values),
    if (state.never && types.never.isNotEmpty) state.type.code.isNotIn(types.never),
  ]);
  return buildAnd([
    sideFilter,
    buildOr([
      whereType,
      if (state.filterSubtypes)
        buildAnd([
          if (state.always && types.always.isNotEmpty) state.subtype.code.isIn(types.always),
          if (state.values && types.values.isNotEmpty) state.subtype.code.isIn(types.values),
          if (state.never && types.never.isNotEmpty) state.subtype.code.isNotIn(types.never),
        ]),
    ])
  ]);
}, dependencies: [
  filterTypesProvider,
  filterSideFilterProvider,
]);

final tagFilterProvider = Provider.family<drift.Expression<bool>?, DeckFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final tagFilter = ref.watch(filterTagsProvider).value;
  if (tagFilter.isEmpty) return null;

  return state.deck.id.isInQuery(
    db.selectOnly(db.deckTag).also((e) {
      e.addColumns([db.deckTag.deckId]);
      e.where(db.deckTag.tag.isIn(tagFilter));
    }),
  );
}, dependencies: [
  dbProvider,
  filterTagsProvider,
]);

final countStuffProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db
      .countStuff(
        factions: (faction, side) => ref.watch(filterFactionFilterProvider(FactionFilter(
          values: false,
          always: false,
          side: side,
          faction: faction,
        ))),
        types: (type, side) => ref.watch(filterTypeFilterProvider(TypeFilter(
          values: false,
          always: false,
          filterSubtypes: false,
          side: side,
          type: type,
          subtype: type,
        ))),
      )
      .watchSingle();
}, dependencies: [
  dbProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
]);
