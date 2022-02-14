import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
}

extension BatchEx on Batch {
  void deleteAll<T extends Table, D>(TableInfo<T, D> table) {
    return deleteWhere<T, D>(table, (tbl) => trueExpression);
  }
}
