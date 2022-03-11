import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/util/deck_validator.dart';
import '/util/extensions.dart';
import '/util/header_list.dart';
import 'db.dart';

final deckProvider = StateNotifierProvider<DeckNotifier<DeckResult2>, DeckResult2>((ref) => throw UnimplementedError());

class DeckNotifier<T extends DeckResult2?> extends StateNotifier<T> {
  DeckNotifier(T state) : super(state);

  bool changed = false;

  T get value => state;

  set unsaved(T value) {
    changed = true;
    state = value;
  }

  set saved(T value) {
    changed = false;
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
    unsaved = state?.copyWith(cards: {
      for (final entry in state!.cards.entries.where((e) => e.key != key)) entry.key: entry.value,
      if (value > 0) key: value,
    }) as T;
  }

  int getCard(CardResult key) => state?.cards[key] ?? 0;
}

final groupedDeckCardListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final settings = db.getSettings().watchSingle();
  final deckCardList = ref.watch(deckProvider.select((value) => value.cards));
  return settings.map((settings) {
    final groupBy = settings.settings.deckCardGroup;
    final sortBy = settings.settings.deckCardSort;
    return HeaderList([
      ...groupBy(sortBy(deckCardList.keys)),
    ]);
  });
});

final deckValidatorProvider = StreamProvider.family<DeckValidator, DeckResult2>((ref, deck) {
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
}, dependencies: [dbProvider, deckProvider]);

final compareDeckListProvider = StateProvider<Set<DeckResult2>>((ref) => {});
