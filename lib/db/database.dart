import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '/db/extensions.dart';
import '/providers/deck.dart';
import '/util/extensions.dart';
import 'extensions.dart';
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

  static Future<File> dbFilename() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return File(p.join(dbFolder.path, 'db.sqlite'));
  }

  static Future<FileSystemEntity> deleteDatabase() async {
    final filename = await dbFilename();
    return filename.delete();
  }

  @override
  int schemaVersion = 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(settings, settings.cardGalleryView);
          }
          if (from < 3) {
            await m.addColumn(mwl, mwl.runnerPoints);
            await m.addColumn(mwl, mwl.corpPoints);
            await m.addColumn(mwlCard, mwlCard.points);
          }
          if (from < 4) {
            await m.drop(card);
            await m.createTable(card);
            await delete(nrdb).go();
          }
          if (from < 5) {
            await m.drop(rotation);
            await m.createTable(rotation);
            await m.drop(mwl);
            await m.createTable(mwl);
            await delete(nrdb).go();
          }
        },
      );

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

  Stream<List<DeckFullResult>> listDecks2({Expression<bool?> where = trueExpression}) {
    final deckListStream = listDecks(where: where).watch();
    final cardListStream = deckListStream.flatMap((deckList) {
      return listDeckCards(where: deckCard.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    final tagListStream = deckListStream.flatMap((deckList) {
      return listDeckTags(where: deckTag.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    return CombineLatestStream.combine3<List<DeckResult>, List<DeckCardResult>, List<DeckTagData>,
        List<DeckFullResult>>(
      deckListStream,
      cardListStream,
      tagListStream,
      (
        deckList,
        cardList,
        tagList,
      ) {
        return deckList.map((deck) {
          return deck.toFullResult(
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

  Stream<List<DeckNotifierResult>> listMiniDecks({Expression<bool?> where = trueExpression}) {
    final deckListStream = listDecks(where: where).watch();
    final cardListStream = deckListStream.flatMap((deckList) {
      return listDeckCards(where: deckCard.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    final tagListStream = deckListStream.flatMap((deckList) {
      return listDeckTags(where: deckTag.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    return CombineLatestStream.combine3<List<DeckResult>, List<DeckCardResult>, List<DeckTagData>,
        List<DeckNotifierResult>>(
      deckListStream,
      cardListStream,
      tagListStream,
      (
        deckList,
        cardList,
        tagList,
      ) {
        return deckList.map((deck) {
          return DeckNotifierResult(
            id: deck.deck.id,
            identityCode: deck.deck.identityCode,
            formatCode: deck.deck.formatCode,
            rotationCode: deck.deck.rotationCode,
            mwlCode: deck.deck.mwlCode,
            name: deck.deck.name,
            description: deck.deck.description,
            created: deck.deck.created,
            updated: deck.deck.updated,
            deleted: deck.deck.deleted,
            remoteUpdated: deck.deck.remoteUpdated,
            synced: deck.deck.synced,
            cards: cardList
                .where((e) => e.deckCard.deckId == deck.deck.id)
                .map((e) => MapEntry(e.cardCode, e.deckCard.quantity))
                .toMap(),
            tags: tagList.where((e) => e.deckId == deck.deck.id).map((e) => e.tag).toList(),
            state: DeckSaveState.isSaved,
          );
        }).toList();
      },
    );
  }

  Stream<List<DeckMicroResult>> listMicroDecks({Expression<bool?> where = trueExpression}) {
    final deckListStream = listDecks(where: where).watch();
    final cardListStream = deckListStream.flatMap((deckList) {
      return listDeckCards(where: deckCard.deckId.isIn(deckList.map((e) => e.deck.id))).watch();
    });
    return CombineLatestStream.combine2<List<DeckResult>, List<DeckCardResult>, List<DeckMicroResult>>(
      deckListStream,
      cardListStream,
      (deckList, cardList) {
        return deckList.map((deck) {
          return DeckMicroResult(
            id: deck.deck.id,
            name: deck.deck.name,
            cards: cardList
                .where((e) => e.deckCard.deckId == deck.deck.id)
                .map((e) => MapEntry(e.cardCode, e.deckCard.quantity))
                .toMap(),
          );
        }).toList();
      },
    );
  }
}

extension BatchEx on Batch {
  void deleteAll<T extends Table, D>(TableInfo<T, D> table) {
    return deleteWhere<T, D>(table, (tbl) => trueExpression);
  }
}

abstract class MyTypeConverter<D, S extends Object> extends TypeConverter<D, S> implements JsonTypeConverter<D, S> {
  const MyTypeConverter();

  @override
  D fromJson(S json) => fromSql(json);

  @override
  S toJson(D value) => toSql(value);
}
