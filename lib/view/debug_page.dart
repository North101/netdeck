import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';

final dbExistsProvider = FutureProvider((ref) {
  return Database.dbFilename().then((value) {
    return value.exists();
  });
});

class DebugPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => openPage(context),
                child: const Text('Keep Database'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(builder: (context, ref, child) {
                final dbExists = ref.watch(dbExistsProvider).maybeWhen(
                  data: (data) => data,
                  orElse: () => false,
                );
                return ElevatedButton(
                  onPressed: dbExists
                      ? () async {
                          await Database.deleteDatabase();
                          await openPage(context);
                        }
                      : null,
                  child: const Text('Delete Database'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
