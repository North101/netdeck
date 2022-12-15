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

final deckResultStreamProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final deck = ref.watch(deckProvider).value;
  return db
      .getDeckFromData(
        identityCode: deck.identityCode,
        formatCode: deck.formatCode,
        rotationCode: deck.rotationCode,
        mwlCode: deck.mwlCode,
      )
      .watchSingle()
      .map(
    (deckData) {
      return DeckResult(
        deck: deck,
        identity: deckData.identity,
        pack: deckData.pack,
        cycle: deckData.cycle,
        faction: deckData.faction,
        side: deckData.side,
        type: deckData.type,
        subtype: deckData.subtype,
        format: deckData.format,
        rotation: deckData.rotation,
        mwl: deckData.mwl,
      );
    },
  );
}, dependencies: [
  dbProvider,
  deckProvider,
]);

final deckDataProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final deck = ref.watch(deckProvider).value;
  return db
      .getDeckFromData(
        identityCode: deck.identityCode,
        formatCode: deck.formatCode,
        rotationCode: deck.rotationCode,
        mwlCode: deck.mwlCode,
      )
      .watchSingle();
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

final deckCardListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final cards = ref.watch(deckCardCodeSetProvider);
  return db.listCards(where: (card, pack, cycle, faction, side, type, subtype, mwlCard) {
    return card.code.isIn(cards);
  }).watch();
}, dependencies: [
  dbProvider,
  deckCardCodeSetProvider,
]);

final deckFullResultStreamProvider = StreamProvider((ref) async* {
  final deck = ref.watch(deckProvider).value;
  final deckData = await ref.watch(deckDataProvider.future);
  final deckCards = await ref.watch(deckCardListProvider.future);
  yield DeckFullResult(
    deck: deck,
    identity: deckData.identity,
    pack: deckData.pack,
    cycle: deckData.cycle,
    faction: deckData.faction,
    side: deckData.side,
    type: deckData.type,
    subtype: deckData.subtype,
    format: deckData.format,
    rotation: deckData.rotation,
    mwl: deckData.mwl,
    cards: deckCards.map((e) {
      return MapEntry(e, deck.cards[e.code] ?? 0);
    }).toMap(),
    tags: deck.tags,
  );
}, dependencies: [
  deckProvider,
  deckDataProvider,
  deckCardListProvider,
]);

enum DeckSaveState {
  isNew,
  isChanged,
  isSaved,
}

class DeckNotifierResult extends DeckMiniResult {
  DeckNotifierResult({
    required super.id,
    required super.identityCode,
    required super.formatCode,
    required super.rotationCode,
    required super.mwlCode,
    required super.name,
    required super.description,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.remoteUpdated,
    required super.synced,
    required super.cards,
    required super.tags,
    required this.state,
  });

  factory DeckNotifierResult.fromJson(Map<String, dynamic> json, {drift.ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return DeckNotifierResult(
      id: serializer.fromJson<String>(json['id']),
      identityCode: serializer.fromJson<String>(json['identity_code']),
      formatCode: serializer.fromJson<String?>(json['format_code']),
      rotationCode: serializer.fromJson<String?>(json['rotation_code']),
      mwlCode: serializer.fromJson<String?>(json['mwl_code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      remoteUpdated: serializer.fromJson<DateTime?>(json['remote_updated']),
      synced: serializer.fromJson<DateTime?>(json['synced']),
      cards: (json['cards'] as Map).cast<String, int>(),
      tags: (json['tags'] as List).cast<String>(),
      state: DeckSaveState.values.firstWhere((e) => e.name == serializer!.fromJson<String>(json['state'])),
    );
  }

  @override
  Map<String, dynamic> toJson({drift.ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return {
      ...super.toJson(),
      'state': state.name,
    };
  }

  final DeckSaveState state;

  @override
  DeckNotifierResult copyWith({
    String? id,
    String? identityCode,
    drift.Value<String?> formatCode = const drift.Value.absent(),
    drift.Value<String?> rotationCode = const drift.Value.absent(),
    drift.Value<String?> mwlCode = const drift.Value.absent(),
    String? name,
    String? description,
    DateTime? created,
    DateTime? updated,
    bool? deleted,
    drift.Value<DateTime?> remoteUpdated = const drift.Value.absent(),
    drift.Value<DateTime?> synced = const drift.Value.absent(),
    Map<String, int>? cards,
    List<String>? tags,
    DeckSaveState? state,
  }) =>
      DeckNotifierResult(
        id: id ?? this.id,
        identityCode: identityCode ?? this.identityCode,
        formatCode: formatCode.present ? formatCode.value : this.formatCode,
        rotationCode: rotationCode.present ? rotationCode.value : this.rotationCode,
        mwlCode: mwlCode.present ? mwlCode.value : this.mwlCode,
        name: name ?? this.name,
        description: description ?? this.description,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted ?? this.deleted,
        remoteUpdated: remoteUpdated.present ? remoteUpdated.value : this.remoteUpdated,
        synced: synced.present ? synced.value : this.synced,
        cards: cards ?? this.cards,
        tags: tags ?? this.tags,
        state: state ?? this.state,
      );
}

class DeckNotifier extends RestorableValue<DeckNotifierResult> {
  DeckNotifier(this.defaultValue);

  final DeckNotifierResult defaultValue;

  set unsaved(DeckNotifierResult value) {
    this.value = value.copyWith(
      state: value.state == DeckSaveState.isSaved ? DeckSaveState.isChanged : null,
    );
  }

  set saved(DeckNotifierResult value) {
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
      for (final entry in this.value.cards.entries.where((e) => e.key != key.code)) entry.key: entry.value,
      if (value > 0 || keep) key.code: value,
    });
  }

  int getCard(CardResult key) => value.cards[key.code] ?? 0;

  @override
  DeckNotifierResult createDefaultValue() => defaultValue;

  @override
  void didUpdateValue(DeckNotifierResult? oldValue) {
    assert(debugIsSerializableForRestoration(toPrimitives()));
    notifyListeners();
  }

  @override
  fromPrimitives(Object? data) => DeckNotifierResult.fromJson((data as Map).cast());

  @override
  Object? toPrimitives() => value.toJson();
}

final deckRotationCardListProvider = StreamProvider.family<List<RotationCardResult>, DeckFullResult>((ref, deck) {
  final db = ref.watch(dbProvider);
  return db.listRotationCards(
    where: (rotation, format, rotationCycle, cycle, pack, card) {
      return buildAnd([
        card.code.isIn(deck.cards.keys.map((e) => e.code).toList()),
        rotation.code.equalsExp(drift.Variable(deck.rotation?.rotationCode)),
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
  final rotationCardSet = await ref.watch(deckRotationCardListProvider(deck).future.select((value) {
    return value.then((event) => event.map((e) => e.card.code).toSet());
  }));
  final mwlCardMap = await ref.watch(deckMwlCardListProvider(deck).future.select((value) {
    return value.then((event) => event.map((e) => MapEntry(e.cardTitle, e)).toMap());
  }));
  yield DeckValidator(
    settings,
    deck,
    deck.rotation != null ? rotationCardSet.toSet() : null,
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

class RestorableDeckMicroResultSet extends RestorableValue<Set<DeckMicroResult>> {
  RestorableDeckMicroResultSet(this.defaultValue);

  final Set<DeckMicroResult> defaultValue;

  @override
  Set<DeckMicroResult> createDefaultValue() => defaultValue;

  @override
  void didUpdateValue(Set<DeckMicroResult>? oldValue) {
    notifyListeners();
  }

  @override
  Set<DeckMicroResult> fromPrimitives(Object? data) {
    return (data as List).map((e) => DeckMicroResult.fromJson((e as Map).cast())).toSet();
  }

  @override
  Object? toPrimitives() => value.map((e) => e.toJson()).toList();
}

final selectedCompareDeckListProvider = RestorableProvider<RestorableDeckMicroResultSet>(
  (_) => throw UnimplementedError(),
  restorationId: 'selectedCompareDeckListProvider',
);
