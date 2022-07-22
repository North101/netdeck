import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:query/query.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/providers/db.dart';
import '/util/filter_type.dart';

class RestorableQuery extends RestorableValue<Query?> {
  RestorableQuery(this._defaultValue);

  final Query? _defaultValue;

  @override
  createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  fromPrimitives(Object? data) => data != null ? tryParseQuery(data as String) : null;

  @override
  Object? toPrimitives() => value?.toString();
}

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

final filterSearchingProvider = RestorableProvider<RestorableBool>((_) => throw UnimplementedError());
final filterQueryProvider = RestorableProvider<RestorableQuery>((_) => throw UnimplementedError());
final filterFormatProvider = RestorableProvider<RestorableFormatData>((_) => throw UnimplementedError());
final filterRotationProvider = RestorableProvider<RestorableRotationData>((_) => throw UnimplementedError());
final filterMwlProvider = RestorableProvider<RestorableMwlData>((_) => throw UnimplementedError());
final filterCollectionProvider = RestorableProvider<RestorableBool>((_) => throw UnimplementedError());
final filterPacksProvider = RestorableProvider<RestorableFilterType>((_) => throw UnimplementedError());
final filterSidesProvider = RestorableProvider<RestorableFilterType>((_) => throw UnimplementedError());
final filterFactionsProvider = RestorableProvider<RestorableFilterType>((_) => throw UnimplementedError());
final filterTypesProvider = RestorableProvider<RestorableFilterType>((_) => throw UnimplementedError());
final filterTagsProvider = RestorableProvider<RestorableSet<String>>((_) => throw UnimplementedError());

final filterRotationFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final rotation = ref.watch(filterRotationProvider).value;
  if (rotation == null) return null;

  return db.cycle.code.isInQuery(db.selectOnly(db.rotationCycle).also((e) {
    e.addColumns([db.rotationCycle.cycleCode]);
    e.where(db.rotationCycle.rotationCode.equals(rotation.code));
  }));
}, dependencies: [dbProvider, filterRotationProvider]);

final filterMwlFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final mwl = ref.watch(filterMwlProvider).value;
  if (mwl == null) return null;

  return buildOr([
    db.mwlCard.deckLimit.isNull(),
    db.mwlCard.deckLimit.isBiggerThanValue(0),
  ]);
}, dependencies: [dbProvider, filterMwlProvider]);

final filterCollectionFilterProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  final collection = ref.watch(filterCollectionProvider).value;
  if (!collection) return null;

  return db.pack.code.isInQuery(db.select(db.collection));
}, dependencies: [dbProvider, filterCollectionProvider]);

final filterPackFilterProvider = Provider.family<drift.Expression<bool>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final packs = ref.watch(filterPacksProvider).value;
  return buildAnd([
    if (state.always && packs.always.isNotEmpty) db.pack.code.isIn(packs.always),
    if (state.values && packs.isNotEmpty) db.pack.code.isIn(packs),
    if (state.never && packs.never.isNotEmpty) db.pack.code.isNotIn(packs.never),
  ]);
}, dependencies: [dbProvider, filterPacksProvider]);

final filterSideFilterProvider = Provider.family<drift.Expression<bool>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final sides = ref.watch(filterSidesProvider).value;
  return buildAnd([
    if (state.always && sides.always.isNotEmpty) db.side.code.isIn(sides.always),
    if (state.values && sides.values.isNotEmpty) db.side.code.isIn(sides.values),
    if (state.never && sides.never.isNotEmpty) db.side.code.isNotIn(sides.never),
  ]);
}, dependencies: [dbProvider, filterSidesProvider]);

final filterFactionFilterProvider = Provider.family<drift.Expression<bool>, FilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final factions = ref.watch(filterFactionsProvider).value;
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

final filterTypeFilterProvider = Provider.family<drift.Expression<bool>, TypeFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  final types = ref.watch(filterTypesProvider).value;
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
  final tags = ref.watch(filterTagsProvider).value;
  if (tags.isEmpty) return trueExpression;

  return db.deck.id.isInQuery(
    db.selectOnly(db.deckTag).also((e) {
      e.addColumns([db.deckTag.deckId]);
      e.where(db.deckTag.tag.isIn(tags));
    }),
  );
}, dependencies: [dbProvider, filterTagsProvider]);

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
