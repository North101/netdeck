import 'package:drift/drift.dart';

import '/db/database.dart';
import '/db/migrations/schema_v2.dart' as v2;
import '/db/migrations/schema_v3.dart' as v3;
import '/db/migrations/schema_v4.dart' as v4;
import '/db/migrations/schema_v5.dart' as v5;
import '/db/migrations/schema_v6.dart' as v6;
import '/db/migrations/schema_v7.dart' as v7;
import '/db/migrations/schema_v8.dart' as v8;

MigrationStrategy migrationStrategy(GeneratedDatabase $db) => MigrationStrategy(onUpgrade: (m, from, to) async {
      if (from < 2) {
        final db = v2.DatabaseAtV2($db.executor);
        await m.addColumn(db.settings, db.settings.cardGalleryView);
      }
      if (from < 3) {
        final db = v3.DatabaseAtV3($db.executor);
        await m.addColumn(db.mwl, db.mwl.runnerPoints);
        await m.addColumn(db.mwl, db.mwl.corpPoints);
        await m.addColumn(db.mwlCard, db.mwlCard.points);
      }
      if (from < 4) {
        final db = v4.DatabaseAtV4($db.executor);
        await m.drop(db.card);
        await m.createTable(db.card);
        await $db.delete(db.nrdb).go();
      }
      if (from < 5) {
        final db = v5.DatabaseAtV5($db.executor);
        await m.drop(db.rotation);
        await m.createTable(db.rotation);
        await m.drop(db.card);
        await m.createTable(db.mwl);
        await $db.delete(db.nrdb).go();
      }
      if (from < 6) {
        final db = v6.DatabaseAtV6($db.executor);
        await m.alterTable(TableMigration(db.card));
        await migrateFromUnixTimestampsToText($db, m);
      }
      if (from < 7) {
        final db = v7.DatabaseAtV7($db.executor);
        await m.alterTable(TableMigration(db.settings, columnTransformer: {
          db.settings.cardSort: ifNull(
            db.settings.cardSort.nullIf(const Constant('')),
            db.settings.cardSort.defaultValue!,
          ),
          db.settings.cardGroup: ifNull(
            db.settings.cardGroup.nullIf(const Constant('')),
            db.settings.cardGroup.defaultValue!,
          ),
          db.settings.deckSort: ifNull(
            db.settings.deckSort.nullIf(const Constant('')),
            db.settings.deckSort.defaultValue!,
          ),
          db.settings.deckGroup: ifNull(
            db.settings.deckGroup.nullIf(const Constant('')),
            db.settings.deckGroup.defaultValue!,
          ),
          db.settings.deckCardSort: ifNull(
            db.settings.deckCardSort.nullIf(const Constant('')),
            db.settings.deckCardSort.defaultValue!,
          ),
          db.settings.deckCardGroup: ifNull(
            db.settings.deckCardGroup.nullIf(const Constant('')),
            db.settings.deckCardGroup.defaultValue!,
          ),
          db.settings.compareCardSort: ifNull(
            db.settings.compareCardSort.nullIf(const Constant('')),
            db.settings.compareCardSort.defaultValue!,
          ),
          db.settings.cardGalleryView: ifNull(
            db.settings.cardGalleryView.nullIf(const Constant('')),
            db.settings.cardGalleryView.defaultValue!,
          ),
        }));
      }
      if (from < 8) {
        final db = v8.DatabaseAtV8($db.executor);
        await m.drop(db.mwlCard);
        await m.create(db.mwlCard);

        await m.drop(db.rotation);
        await m.create(db.rotation);
        await m.create(db.rotationView);

        await m.drop(db.mwl);
        await m.create(db.mwl);
        await m.create(db.mwlView);

        await $db.update(db.settings).write(SettingsCompanion.custom(
              cardSort: db.settings.cardSort.iif(
                db.settings.cardSort.isIn(CardSort.values.map((e) => e.name)),
                db.settings.cardSort.defaultValue!,
              ),
              cardGroup: db.settings.cardGroup.iif(
                db.settings.cardGroup.isIn(CardGroup.values.map((e) => e.name)),
                db.settings.cardGroup.defaultValue!,
              ),
              deckSort: db.settings.deckSort.iif(
                db.settings.deckSort.isIn(DeckSort.values.map((e) => e.name)),
                db.settings.deckSort.defaultValue!,
              ),
              deckGroup: db.settings.deckGroup.iif(
                db.settings.deckGroup.isIn(DeckGroup.values.map((e) => e.name)),
                db.settings.deckGroup.defaultValue!,
              ),
              deckCardSort: db.settings.deckCardSort.iif(
                db.settings.deckCardSort.isIn(CardSort.values.map((e) => e.name)),
                db.settings.deckCardSort.defaultValue!,
              ),
              deckCardGroup: db.settings.deckCardGroup.iif(
                db.settings.deckCardGroup.isIn(CardGroup.values.map((e) => e.name)),
                db.settings.deckCardGroup.defaultValue!,
              ),
              compareCardSort: db.settings.compareCardSort.iif(
                db.settings.compareCardSort.isIn(CardSort.values.map((e) => e.name)),
                db.settings.compareCardSort.defaultValue!,
              ),
              cardGalleryView: db.settings.cardGalleryView.iif(
                db.settings.cardGalleryView.isIn(CardGalleryPageView.values.map((e) => e.name)),
                db.settings.cardGalleryView.defaultValue!,
              ),
            ));

        await $db.delete(db.nrdb).go();
      }
    });

Future<void> migrateFromUnixTimestampsToText(GeneratedDatabase $db, Migrator m) async {
  for (final table in $db.allTables) {
    final dateTimeColumns = table.$columns.where((c) => c.type == DriftSqlType.dateTime);

    if (dateTimeColumns.isNotEmpty) {
      // This table has dateTime columns which need to be migrated.
      await m.alterTable(TableMigration(
        table,
        columnTransformer: {
          for (final column in dateTimeColumns)
            // We assume that the column in the database is an int (unix
            // timestamp), use `fromUnixEpoch` to convert it to a date time.
            // Note that the resulting value in the database is in UTC.
            column: DateTimeExpressions.fromUnixEpoch(column.dartCast<int>() * const Constant(100)),
        },
      ));
    }
  }
}
