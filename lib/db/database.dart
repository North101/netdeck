import 'dart:io';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '/util/extensions.dart';
import 'extensions/deck_card_result.dart';
import 'types.dart';
import 'util.dart';

export 'extensions.dart';
export 'types.dart';
export 'util.dart';

part 'database.g.dart';

LazyDatabase _openConnection(Future<File> filename) {
  return LazyDatabase(() async {
    // ignore: dead_code
    return NativeDatabase(await filename, logStatements: false && kDebugMode);
  });
}

@DriftDatabase(include: {
  'sql/card.drift',
  'sql/collection.drift',
  'sql/cycle.drift',
  'sql/deck_card.drift',
  'sql/deck_tag.drift',
  'sql/deck.drift',
  'sql/faction.drift',
  'sql/format.drift',
  'sql/mwl_card.drift',
  'sql/mwl.drift',
  'sql/nrdb.drift',
  'sql/pack.drift',
  'sql/queries.drift',
  'sql/rotation.drift',
  'sql/settings.drift',
  'sql/side.drift',
  'sql/type.drift',
})
class Database extends _$Database {
  Database() : super(_openConnection(dbFilename()));
  
  Database.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int schemaVersion = 1;

  static Future<File> dbFilename() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return File(p.join(dbFolder.path, 'db.sqlite'));
  }

  static Future<FileSystemEntity> deleteDatabase() async {
    final filename = await dbFilename();
    return filename.delete();
  }

  Future<DeckData> copyDeck(DeckData deck, {String? newDeckId, DateTime? now}) async {
    newDeckId ??= const Uuid().v4();
    now ??= DateTime.now().toUtc();
    final newDeck = deck.copyWith(
      id: newDeckId,
      name: '${deck.name} Copy',
      created: now,
      updated: now,
      synced: const Value(null),
      remoteUpdated: const Value(null),
    );
    await into(this.deck).insert(newDeck);
    return newDeck;
  }

  Stream<List<DeckResult2>> listDecks2({Expression<bool?> where = trueExpression}) {
    final deckListStream = listDecks(where: where).watch();
    final cardListStream = deckListStream.flatMap((deckList) {
      return listDeckCards(where: deckCard.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    final tagListStream = deckListStream.flatMap((deckList) {
      return listDeckTags(where: deckTag.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    return CombineLatestStream.combine3<List<DeckResult>, List<DeckCardResult>, List<DeckTagData>, List<DeckResult2>>(
      deckListStream,
      cardListStream,
      tagListStream,
      (
        deckList,
        cardList,
        tagList,
      ) {
        return deckList.map((deck) {
          return DeckResult2(
            deck: deck.deck,
            identity: deck.identity,
            pack: deck.pack,
            cycle: deck.cycle,
            faction: deck.faction,
            side: deck.side,
            type: deck.type,
            subtype: deck.subtype,
            format: deck.format,
            rotation: deck.rotation,
            mwl: deck.mwl,
            cards: cardList
                .where((e) => e.deckCard.deckId == deck.deck.id)
                .map((e) => MapEntry(e.toCard(), e.deckCard.quantity))
                .toMap(),
            tags: tagList.where((e) => e.deckId == deck.deck.id).map((e) => e.tag).toList(),
          );
        }).toList();
      },
    );
  }
}

class DeckResult2 extends DeckResult {
  DeckResult2({
    required DeckData deck,
    required CardData identity,
    required PackData pack,
    required CycleData cycle,
    required FactionData faction,
    required SideData side,
    required TypeData type,
    TypeData? subtype,
    FormatData? format,
    RotationData? rotation,
    MwlData? mwl,
    required this.cards,
    required this.tags,
  }) : super(
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
        );

  final Map<CardResult, int> cards;
  final List<String> tags;

  DeckResult2 copyWith({
    DeckData? deck,
    Value<FormatData?> format = const Value.absent(),
    Value<RotationData?> rotation = const Value.absent(),
    Value<MwlData?> mwl = const Value.absent(),
    Map<CardResult, int>? cards,
    List<String>? tags,
  }) {
    return DeckResult2(
      deck: (deck ?? this.deck).copyWith(
        formatCode: Value(format.present ? format.value?.code : (deck ?? this.deck).formatCode),
        mwlCode: Value(mwl.present ? mwl.value?.code : (deck ?? this.deck).mwlCode),
        rotationCode: Value(rotation.present ? rotation.value?.code : (deck ?? this.deck).rotationCode),
      ),
      identity: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format.present ? format.value : this.format,
      rotation: rotation.present ? rotation.value : this.rotation,
      mwl: mwl.present ? mwl.value : this.mwl,
      cards: cards ?? this.cards,
      tags: tags ?? this.tags,
    );
  }

  @override
  int get hashCode =>
      Object.hash(deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl, cards, tags);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckResult2 &&
          other.deck == deck &&
          other.identity == identity &&
          other.pack == pack &&
          other.cycle == cycle &&
          other.faction == faction &&
          other.side == side &&
          other.type == type &&
          other.subtype == subtype &&
          other.format == format &&
          other.rotation == rotation &&
          other.mwl == mwl &&
          const MapEquality().equals(other.cards, cards) &&
          const ListEquality().equals(other.tags, tags));
}

extension BatchEx on Batch {
  void deleteAll<T extends Table, D>(TableInfo<T, D> table) {
    return deleteWhere<T, D>(table, (tbl) => trueExpression);
  }
}
