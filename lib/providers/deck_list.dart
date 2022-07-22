import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'filters.dart';

final selectedDeckIdsProvider = RestorableProvider<RestorableSet<String>>((ref) => throw UnimplementedError());

final deckItemBuilderProvider =
    Provider<Widget Function(BuildContext context, WidgetRef ref, int index, DeckFullResult deck)>(
        (ref) => throw UnimplementedError());

final deckFabProvider = Provider<Widget?>((ref) => throw UnimplementedError());

final deckQueryBuilderProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return DeckQueryBuilder(db);
});

final hasDeckFilterProvider = Provider((ref) {
  final rotation = ref.watch(filterRotationProvider.select((value) => value.value != null));
  final mwl = ref.watch(filterMwlProvider.select((value) => value.value != null));
  final packs = ref.watch(filterPacksProvider.select((value) => value.value.isVisible));
  final factions = ref.watch(filterFactionsProvider.select((value) => value.value.isVisible));
  final types = ref.watch(filterTypesProvider.select((value) => value.value.isVisible));
  final tags = ref.watch(filterTagsProvider.select((value) => value.value.isNotEmpty));
  return rotation || mwl || packs || factions || types || tags;
}, dependencies: [
  filterRotationProvider,
  filterMwlProvider,
  filterPacksProvider,
  filterFactionsProvider,
  filterTypesProvider,
  filterTagsProvider,
]);

final deckFilterProvider = Provider.family<drift.Expression<bool>, CardFilterState>((ref, state) {
  final deckQueryBuilder = ref.watch(deckQueryBuilderProvider);
  final parsedQuery = ref.watch(filterQueryProvider).value;
  final rotationFilter = ref.watch(filterRotationFilterProvider);
  final mwlFilter = ref.watch(filterMwlFilterProvider);
  final packFilter = ref.watch(filterPackFilterProvider(state));
  final factionFilter = ref.watch(filterFactionFilterProvider(state));
  final typeFilter = ref.watch(filterTypeFilterProvider(state));
  final tagFilter = ref.watch(tagFilterProvider);
  return buildAnd([
    if (parsedQuery != null) deckQueryBuilder.build(parsedQuery),
    if (state.rotation && rotationFilter != null) rotationFilter,
    if (state.mwl && mwlFilter != null) mwlFilter,
    packFilter,
    factionFilter,
    typeFilter,
    tagFilter,
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
  tagFilterProvider,
]);

final deckListProvider = StreamProvider<List<DeckFullResult>>((ref) {
  final db = ref.watch(dbProvider);
  final deckFilter = ref.watch(deckFilterProvider(const CardFilterState()));
  return db.listDecks2(where: deckFilter);
}, dependencies: [
  dbProvider,
  deckFilterProvider,
]);

final groupedDeckListProvider = StreamProvider<HeaderList<DeckFullResult>>((ref) async* {
  final settings = await ref.watch(settingProvider.future);
  final deckList = await ref.watch(deckListProvider.future);

  final groupBy = settings.settings.deckGroup;
  final sortBy = settings.settings.deckSort;
  yield HeaderList([
    ...groupBy(sortBy(deckList)),
  ]);
}, dependencies: [
  settingProvider.future,
  deckListProvider.future,
]);
