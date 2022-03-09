import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/util/deck_validator.dart';
import '/util/extensions.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import 'db.dart';
import 'filters.dart';

final cardListProvider = StreamProvider<List<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final cardFilter = ref.watch(cardFilterProvider(const CardFilterState()));
  final mwl = ref.watch(filterMwlProvider);
  final deckValidator = ref.watch(cardListDeckValidatorProvider);
  return db
      .listCards(
        mwlCode: mwl?.code,
        where: cardFilter & (deckValidator?.filter(db) ?? trueExpression),
      )
      .watch();
}, dependencies: [dbProvider, cardFilterProvider, filterMwlProvider, cardListDeckValidatorProvider]);

final cardListDeckValidatorProvider = Provider<DeckValidator?>((ref) => null);

final groupedCardListProvider = StreamProvider<HeaderList<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final cardListStream = ref.watch(cardListProvider.stream);
  final deckValidator = ref.watch(cardListDeckValidatorProvider);
  final deckCardList = deckValidator?.cardList.keys.toSet() ?? const {};
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
}, dependencies: [dbProvider, cardListProvider.stream, cardListDeckValidatorProvider]);

final cardItemBuilderProvider =
    Provider<Widget Function(BuildContext context, WidgetRef ref, int index, CardResult card)>(
        (ref) => throw UnimplementedError());

final mwlCardMapProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final mwl = ref.watch(filterMwlProvider);
  final mwlCardList = db.listMwlCard(where: db.mwlCard.mwlCode.equals(mwl?.code)).watch();
  return mwlCardList.map((event) {
    return event.map((e) => MapEntry(e.cardCode, e)).toMap();
  });
}, dependencies: [dbProvider, filterMwlProvider]);
