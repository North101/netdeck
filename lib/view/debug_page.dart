import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:netrunner_deckbuilder/view/async_value_builder.dart';

import '/db/database.dart';

abstract class DatabaseResult {}

class NoneDatabaseResult implements DatabaseResult {
  const NoneDatabaseResult();
}

class ValidDatabaseResult implements DatabaseResult {
  const ValidDatabaseResult();
}

class InvalidDatabaseResult implements DatabaseResult {
  const InvalidDatabaseResult(this.error);

  final SchemaMismatch error;
}

final dbStateProvider = FutureProvider((ref) async {
  final dbFile = await Database.dbFilename();
  if (!await dbFile.exists()) return const NoneDatabaseResult();

  final db = Database();
  try {
    await db.validateDatabaseSchema();
    return const ValidDatabaseResult();
  } on SchemaMismatch catch (exception) {
    return InvalidDatabaseResult(exception);
  } finally {
    await db.close();
  }
});

class DebugPage extends ConsumerWidget {
  const DebugPage({
    required this.home,
    Key? key,
  }) : super(key: key);

  final Widget home;

  Future<void> openPage(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => home,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbState = ref.watch(dbStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
      ),
      body: AsyncValueBuilder<DatabaseResult>(
        value: dbState,
        data: (state) => Stack(
          children: [
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: state is InvalidDatabaseResult
                          ? ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            )
                          : null,
                      onPressed: () => openPage(context),
                      child: state is NoneDatabaseResult ? const Text('New Database') : const Text('Keep Database'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: state is! NoneDatabaseResult
                          ? () async {
                              await Database.deleteDatabase();
                              ref.refresh(dbStateProvider);
                            }
                          : null,
                      child: const Text('Delete Database'),
                    ),
                  ),
                ],
              ),
            ),
            if (state is InvalidDatabaseResult)
              MaterialBanner(
                content: const Text('Database not valid'),
                leading: const Icon(Icons.error, color: Colors.red),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Database Error'),
                        content: SingleChildScrollView(
                          child: Text(state.error.explanation),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('View Error'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
