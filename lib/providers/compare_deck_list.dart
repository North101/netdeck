import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/extensions.dart';
import '/util/header_list.dart';
import 'db.dart';

class DeckCompareDeckResult {
  const DeckCompareDeckResult({
    required this.id,
    required this.name,
    required this.cards,
  });

  final String id;
  final String name;
  final Map<CardResult, int> cards;

  @override
  String toString() {
    return (StringBuffer('DeckCompareDeckResult(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        const MapEquality().hash(cards),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckCompareDeckResult &&
          other.id == id &&
          other.name == name &&
          const MapEquality().equals(other.cards, cards));
}

final compareDeckListProvider = Provider<Set<DeckMicroResult>>((ref) => throw UnimplementedError());

final compareAllCardListProvider = StreamProvider((ref) async* {
  final db = ref.watch(dbProvider);
  final deckList = ref.watch(compareDeckListProvider);
  yield* db
      .listCards(where: db.card.code.isIn(deckList.map((e) => e.cards.keys).flattened.toSet())) //
      .watch();
}, dependencies: [
  dbProvider,
  compareDeckListProvider,
]);

final compareDeckCardListProvider = StreamProvider((ref) async* {
  final deckList = ref.watch(compareDeckListProvider);
  final allCardList = await ref.watch(compareAllCardListProvider.future);
  yield [
    for (final deck in deckList)
      DeckCompareDeckResult(
        id: deck.id,
        name: deck.name,
        cards: {
          for (final card in allCardList)
            if (deck.cards.containsKey(card.code)) card: deck.cards[card.code]!,
        },
      )
  ];
}, dependencies: [
  compareDeckListProvider,
  compareAllCardListProvider.future,
]);

final compareMaxCardListProvider = StreamProvider((ref) async* {
  final deckList = await ref.watch(compareDeckCardListProvider.future);
  final allCardList = await ref.watch(compareAllCardListProvider.future);
  yield allCardList
      .map((card) => MapEntry(card, deckList.map((deck) => deck.cards[card] ?? 0).reduce(max))) //
      .toMap();
}, dependencies: [
  compareDeckCardListProvider.future,
  compareAllCardListProvider.future,
]);

final compareMinCardListProvider = StreamProvider((ref) async* {
  final deckList = await ref.watch(compareDeckCardListProvider.future);
  final allCardList = await ref.watch(compareAllCardListProvider.future);
  yield allCardList
      .map((card) => MapEntry(card, deckList.map((deck) => deck.cards[card] ?? 0).reduce(min)))
      .where((e) => e.value > 0)
      .toMap();
}, dependencies: [
  compareDeckCardListProvider.future,
  compareAllCardListProvider.future,
]);

final compareGroupedCardListProvider = StreamProvider<HeaderList<MapEntry<CardResult, int>>>((ref) async* {
  final sort = await ref.watch(settingProvider.future.select((value) {
    return value.then((value) => value.settings.compareCardSort);
  }));
  final deckList = await ref.watch(compareDeckCardListProvider.future);
  final maxCardList = await ref.watch(compareMaxCardListProvider.future);
  final minCardList = await ref.watch(compareMinCardListProvider.future);
  yield HeaderList<MapEntry<CardResult, int>>([
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
        e.name,
        sort(e.cards.keys)
            .map((card) => MapEntry(card, e.cards[card]! - (minCardList[card] ?? 0)))
            .where((e) => e.value > 0)
            .toList(),
      ),
    ),
  ]);
}, dependencies: [
  settingProvider.future,
  compareDeckCardListProvider.future,
  compareMaxCardListProvider.future,
  compareMinCardListProvider.future,
]);
