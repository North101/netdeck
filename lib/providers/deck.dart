import 'dart:math';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/util/deck_validator.dart';
import '/util/extensions.dart';
import 'db.dart';

final deckProvider = RestorableProvider<DeckNotifier>(
  (_) => throw UnimplementedError(),
  restorationId: 'deckProvider',
);

final deckResultStreamProvider = StreamProvider((ref) async* {
  final db = ref.watch(dbProvider);
  final deck = ref.watch(deckProvider).value;
  yield* db.getDeckFromData(deck).watchSingle();
}, dependencies: [
  dbProvider,
  deckProvider,
]);

final deckCardCodeSetProvider = Provider<Iterable<String>>((ref) {
  final deck = ref.watch(deckProvider).value;
  return deck.cards.keys;
}, dependencies: [
  deckProvider,
]);

final deckCardListProvider = StreamProvider((ref) async* {
  final db = ref.watch(dbProvider);
  final cards = ref.watch(deckCardCodeSetProvider);
  yield* db.listCards(where: (card, pack, cycle, faction, side, type, subtype, mwlCard) {
    return card.code.isIn(cards);
  }).watch();
}, dependencies: [
  dbProvider,
  deckCardCodeSetProvider,
]);

final deckFullResultStreamProvider = StreamProvider((ref) async* {
  final deck = ref.watch(deckProvider).value;
  final deckResult = await ref.watch(deckResultStreamProvider.future);
  final deckCards = await ref.watch(deckCardListProvider.future);
  yield deckResult.toFullResult(
    cards: deckCards.map((e) {
      return MapEntry(e, deck.cards[e.card.code] ?? 0);
    }).toMap(),
    tags: deck.tags,
  );
}, dependencies: [
  deckProvider,
  deckResultStreamProvider,
  deckCardListProvider,
]);

class DeckNotifier extends RestorableValue<DeckNotifierData> {
  DeckNotifier(this.defaultValue);

  final DeckNotifierData defaultValue;

  set unsaved(DeckNotifierData value) {
    this.value = value.copyWith(
      state: value.state == DeckSaveState.isSaved ? DeckSaveState.isChanged : this.value.state,
    );
  }

  set saved(DeckNotifierData value) {
    this.value = value.copyWith(
      state: DeckSaveState.isSaved,
    );
  }

  void incCard(CardResult key) {
    final value = min(getCard(key) + 1, key.card.deckLimit);
    setCard(key, value);
  }

  void decCard(CardResult key, {bool keep = false}) {
    final value = max(getCard(key) - 1, 0);
    setCard(key, value, keep: keep);
  }

  void setCard(CardResult key, int value, {bool keep = false}) {
    unsaved = this.value.copyWith(cards: {
      for (final entry in this.value.cards.entries.where((e) => e.key != key.card.code)) entry.key: entry.value,
      if (value > 0 || keep) key.card.code: value,
    });
  }

  int getCard(CardResult key) => value.cards[key.card.code] ?? 0;

  @override
  DeckNotifierData createDefaultValue() => defaultValue;

  @override
  void didUpdateValue(DeckNotifierData? oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  fromPrimitives(Object? data) => DeckNotifierData.fromJson((data as Map).cast());

  @override
  Object? toPrimitives() => value.toJson();
}

final deckRotationCardListProvider = StreamProvider.family<List<RotationCardResult>, DeckFullResult>((ref, deck) {
  final db = ref.watch(dbProvider);
  return db.listRotationCards(
    where: (rotation, format, rotationCycle, cycle, pack, card) {
      return buildAnd([
        card.code.isIn(deck.cards.keys.map((e) => e.card.code).toList()),
        rotation.code.equalsNullable(deck.rotation?.code),
      ]);
    },
  ).watch();
}, dependencies: [
  dbProvider,
]);

final deckMwlCardListProvider = StreamProvider.family<List<MwlCardData>, DeckFullResult>((ref, deck) {
  final db = ref.watch(dbProvider);
  return db //
      .listMwlCard(where: (mwlCard) => mwlCard.mwlCode.equalsExp(drift.Variable(deck.mwl?.mwlCode))) //
      .watch();
}, dependencies: [
  dbProvider,
]);

final deckValidatorProvider = StreamProvider.family<DeckValidator, DeckFullResult>((ref, deck) async* {
  final settings = await ref.watch(settingProvider.future);
  final cardCodesInRotation = await ref.watch(deckRotationCardListProvider(deck).future.select((value) {
    return value.then((event) => event.map((e) => e.card.code).toSet());
  }));
  final mwlCardMap = await ref.watch(deckMwlCardListProvider(deck).future.select((value) {
    return value.then((event) => event.map((e) => MapEntry(e.cardTitle, e)).toMap());
  }));
  yield DeckValidator(
    settings,
    deck,
    deck.rotation != null ? cardCodesInRotation : null,
    mwlCardMap,
  );
});

final deckValidatorStreamProvider = StreamProvider<DeckValidator>((ref) async* {
  final deck = await ref.watch(deckFullResultStreamProvider.future);
  yield await ref.watch(deckValidatorProvider(deck).future);
}, dependencies: [
  deckFullResultStreamProvider,
  deckValidatorProvider,
]);

final deckValidatorResultProvider = Provider<DeckValidator>((ref) => throw UnimplementedError());

class RestorableDeckMicroResultSet extends RestorableValue<Set<DeckCompareResult>> {
  RestorableDeckMicroResultSet(this.defaultValue);

  final Set<DeckCompareResult> defaultValue;

  @override
  Set<DeckCompareResult> createDefaultValue() => defaultValue;

  @override
  void didUpdateValue(Set<DeckCompareResult>? oldValue) {
    notifyListeners();
  }

  @override
  Set<DeckCompareResult> fromPrimitives(Object? data) {
    return (data as List).map((e) => DeckCompareResult.fromJson((e as Map).cast())).toSet();
  }

  @override
  Object? toPrimitives() => value.map((e) => e.toJson()).toList();
}

final selectedCompareDeckListProvider = RestorableProvider<RestorableDeckMicroResultSet>(
  (_) => throw UnimplementedError(),
  restorationId: 'selectedCompareDeckListProvider',
);
