import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netrunner_deckbuilder/util/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/util/deck_validator.dart';
import '/util/header_list.dart';
import 'db.dart';

final deckProvider = StateNotifierProvider<DeckNotifier, DeckResult2>((ref) => throw UnimplementedError());

class DeckNotifier extends StateNotifier<DeckResult2> {
  DeckNotifier(DeckResult2 state) : super(state);

  DeckResult2 get value => state;

  set value(DeckResult2 value) {
    state = value;
  }

  void incCard(CardResult key) {
    final value = min(getCard(key) + 1, key.card.deckLimit);
    setCard(key, value);
  }

  void decCard(CardResult key) {
    final value = max(getCard(key) - 1, 0);
    setCard(key, value);
  }

  void setCard(CardResult key, int value) {
    state = state.copyWith(cards: {
      for (final entry in state.cards.entries.where((e) => e.key != key)) entry.key: entry.value,
      if (value > 0) key: value,
    });
  }

  int getCard(CardResult key) => state.cards[key] ?? 0;
}

final groupedDeckCardListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final settings = db.getSettings().watchSingle();
  final deck = ref.watch(deckProvider);
  final deckCardList = ref.watch(deckProvider.select((value) => value.cards));
  return settings.map((settings) {
    final groupBy = settings.settings.deckCardGroup;
    final sortBy = settings.settings.deckCardSort;
    return HeaderList([
      HeaderItems(deck.type.name, [deck.toCard()]),
      ...groupBy(sortBy(deckCardList.keys)),
    ]);
  });
});

final deckValidatorProvider = StreamProvider((ref) {
  final deck = ref.watch(deckProvider);

  final db = ref.watch(dbProvider);
  final settingsStream = db.getSettings().watchSingle();
  final formatCardSetStream = db
      .listRotationCards(
        where: buildAnd([
          db.card.code.isIn(deck.cards.keys.map((e) => e.code).toList()),
          db.rotation.code.equals(deck.rotation?.code),
        ]),
      )
      .watch()
      .map((event) => event.map((e) => e.card.code).toSet());
  final mwlCardMapStream = db //
      .listMwlCard(where: db.mwlCard.mwlCode.equals(deck.mwl?.code)) //
      .watch() //
      .map((event) => event.map((e) => MapEntry(e.cardCode, e)).toMap());
  return CombineLatestStream.combine3<SettingResult, Set<String>, Map<String, MwlCardData>, DeckValidator>(
    settingsStream,
    formatCardSetStream,
    mwlCardMapStream,
    (
      settings,
      formatCardSet,
      mwlCardMap,
    ) {
      return DeckValidator(
        settings,
        deck,
        deck.rotation != null ? formatCardSet.toSet() : null,
        mwlCardMap,
      );
    },
  );
}, dependencies: [dbProvider, deckProvider, deckProvider]);

final compareDeckListProvider = StateProvider<Set<DeckResult2>>((ref) => {});
