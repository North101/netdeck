import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/header_list.dart';
import 'db.dart';

final deckCompareListProvider = Provider<Set<DeckResult2>>((ref) => throw UnimplementedError());

final compareMaxCardListProvider = Provider((ref) {
  final deckList = ref.watch(deckCompareListProvider);
  final allCardList = deckList.map((e) => e.cards.keys).flattened.toSet();
  return {
    for (final card in allCardList)
      card: deckList.fold<int>(0, (current, deck) {
        return max(current, deck.cards[card] ?? 0);
      }),
  };
}, dependencies: [deckCompareListProvider]);

final compareMinCardListProvider = Provider((ref) {
  final deckList = ref.watch(deckCompareListProvider);
  final maxCardList = ref.watch(compareMaxCardListProvider);
  final minCardList = maxCardList.map(
    (card, maxValue) => MapEntry(
      card,
      deckList.fold<int>(maxValue, (current, deck) {
        return min(current, deck.cards[card] ?? 0);
      }),
    ),
  );
  return {
    for (final card in minCardList.entries)
      if (card.value > 0) card.key: card.value,
  };
}, dependencies: [deckCompareListProvider, compareMaxCardListProvider]);

final compareGroupedCardListProvider = StreamProvider<HeaderList<MapEntry<CardResult, int>>>((ref) {
  final db = ref.watch(dbProvider);
  final settings = db.getSettings().watchSingle();
  final deckList = ref.watch(deckCompareListProvider);
  final maxCardList = ref.watch(compareMaxCardListProvider);
  final minCardList = ref.watch(compareMinCardListProvider);

  return settings.map((settings) {
    final sort = settings.settings.compareCardSort;
    return HeaderList<MapEntry<CardResult, int>>([
      HeaderItems(
        'All Cards',
        sort(maxCardList.keys).map((card) => MapEntry(card, maxCardList[card]!)).toList(),
      ),
      HeaderItems(
        'Shared Cards',
        sort(minCardList.keys).map((card) => MapEntry(card, minCardList[card]!)).toList(),
      ),
      ...deckList.map(
        (e) => HeaderItems(
          e.deck.name,
          sort(e.cards.keys).map((card) => MapEntry(card, e.cards[card]!)).toList(),
        ),
      ),
    ]);
  });
}, dependencies: [dbProvider, deckCompareListProvider, compareMaxCardListProvider, compareMinCardListProvider]);
