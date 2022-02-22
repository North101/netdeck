import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'filters.dart';

final cardListProvider = StreamProvider<List<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final cardFilter = ref.watch(cardFilterProvider(const CardFilterState()));
  return db.listCards(where: cardFilter).watch();
}, dependencies: [dbProvider, cardFilterProvider]);

final deckCardListProvider = Provider<Set<CardResult>>((ref) => const {});

final groupedCardListProvider = StreamProvider<HeaderList<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final cardListStream = ref.watch(cardListProvider.stream);
  final deckCardList = ref.watch(deckCardListProvider);
  return Rx.combineLatest2<SettingResult, List<CardResult>, HeaderList<CardResult>>(
    settingsStream,
    cardListStream,
    (settings, cardList) {
      final groupBy = settings.settings.cardGroup;
      final sortBy = settings.settings.cardSort;
      return HeaderList([
        if (deckCardList.isNotEmpty) HeaderItems('Deck', sortBy(deckCardList)),
        ...groupBy(sortBy(cardList)),
      ]);
    },
  );
}, dependencies: [dbProvider, cardListProvider.stream, deckCardListProvider]);

final cardTileProvider = Provider<Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card)>(
    (ref) => throw UnimplementedError());

