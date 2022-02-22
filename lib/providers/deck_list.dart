import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'filters.dart';

final selectedDecksProvider = StateProvider<Set<DeckResult2>>((ref) => {});

final deckTileProvider = Provider<Widget Function(BuildContext context, WidgetRef ref, int index, DeckResult2 deck)>(
    (ref) => throw UnimplementedError());

final deckFabProvider = Provider<Widget?>((ref) => throw UnimplementedError());

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
  final tags = ref.watch(filterTagsProvider);
  return rotation != null || mwl != null || packs.isVisible || factions.isVisible || types.isVisible || tags.isNotEmpty;
}, dependencies: [
  filterRotationProvider,
  filterMwlProvider,
  filterPacksProvider,
  filterFactionsProvider,
  filterTypesProvider,
  filterTagsProvider,
]);

final deckFilterProvider = Provider.family<drift.Expression<bool?>, CardFilterState>((ref, state) {
  final deckQueryBuilder = ref.watch(deckQueryBuilderProvider);
  final parsedQuery = ref.watch(filterQueryProvider);
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

final deckListProvider = StreamProvider<List<DeckResult2>>((ref) {
  final db = ref.watch(dbProvider);
  final deckFilter = ref.watch(deckFilterProvider(const CardFilterState()));
  return db.listDecks2(where: deckFilter);
}, dependencies: [dbProvider, deckFilterProvider]);

final groupedDeckListProvider = StreamProvider<HeaderList<DeckResult2>>((ref) {
  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final deckListStream = ref.watch(deckListProvider.stream);
  return Rx.combineLatest2<SettingResult, List<DeckResult2>, HeaderList<DeckResult2>>(
    settingsStream,
    deckListStream,
    (settings, deckList) {
      final groupBy = settings.settings.deckGroup;
      final sortBy = settings.settings.deckSort;
      return HeaderList([
        ...groupBy(sortBy(deckList)),
      ]);
    },
  );
}, dependencies: [dbProvider, deckListProvider.stream]);