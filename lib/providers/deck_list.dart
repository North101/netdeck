import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'filters.dart';

final selectedDeckIdsProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'selectedDeckIdsProvider',
);

final deckItemBuilderProvider =
    Provider<Widget Function(BuildContext context, WidgetRef ref, int index, DeckFullResult deck)>(
        (ref) => throw UnimplementedError());

final deckFabProvider = Provider<Widget?>((ref) => throw UnimplementedError());

final deckQueryBuilderProvider = Provider.family<DeckQueryBuilder, DeckFilterState>((ref, state) {
  final db = ref.watch(dbProvider);
  return DeckQueryBuilder(
    db,
    state.deck,
    state.identity,
    state.pack,
    state.cycle,
    state.faction,
    state.side,
    state.type,
    state.subtype,
    state.format,
    state.rotation,
    state.mwl,
  );
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

final deckFilterProvider = Provider.family<drift.Expression<bool>, DeckFilterState>((ref, state) {
  final deckQueryBuilder = ref.watch(deckQueryBuilderProvider(state));
  final parsedQuery = ref.watch(filterQueryProvider);
  final rotationFilter = ref.watch(filterDeckRotationFilterProvider(state));
  final mwlFilter = ref.watch(filterDeckMwlFilterProvider(state));
  final packFilter = ref.watch(filterPackFilterProvider(state));
  final factionFilter = ref.watch(filterFactionFilterProvider(state));
  final typeFilter = ref.watch(filterTypeFilterProvider(state));
  final tagFilter = ref.watch(tagFilterProvider(state));
  return buildAnd([
    if (parsedQuery != null) deckQueryBuilder.build(parsedQuery),
    if (rotationFilter != null) rotationFilter,
    if (mwlFilter != null) mwlFilter,
    packFilter,
    factionFilter,
    typeFilter,
    if (tagFilter != null) tagFilter,
  ]);
}, dependencies: [
  deckQueryBuilderProvider,
  filterQueryProvider,
  filterDeckRotationFilterProvider,
  filterDeckMwlFilterProvider,
  filterPackFilterProvider,
  filterFactionFilterProvider,
  filterTypeFilterProvider,
  tagFilterProvider,
]);

final deckListProvider = StreamProvider<List<DeckFullResult>>((ref) {
  final db = ref.watch(dbProvider);
  return db.listDecks2(where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
    return ref.watch(deckFilterProvider(DeckFilterState(
      deck: deck,
      identity: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format,
      rotation: rotation,
      mwl: mwl,
    )));
  });
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
  settingProvider,
  deckListProvider,
]);
