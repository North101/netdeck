import 'dart:io';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';

Future<DriftIsolate> _createDriftIsolate(Future<File> future) async {
  final filename = await future;
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, filename),
  );
  return await receivePort.first as DriftIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  final executor = NativeDatabase(request.filename);
  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection(executor),
  );
  request.sendDriftIsolate.send(driftIsolate);
}

class _IsolateStartRequest {
  const _IsolateStartRequest(this.sendDriftIsolate, this.filename);

  final SendPort sendDriftIsolate;
  final File filename;
}

DatabaseConnection _createDriftIsolateAndConnect(Future<File> future) {
  return DatabaseConnection.delayed(() async {
    final isolate = await _createDriftIsolate(future);
    return await isolate.connect();
  }());
}

final dbProvider = Provider<Database>((ref) {
  final filename = Database.dbFilename();
  final db = Database.connect(DatabaseConnection.delayed(_createDriftIsolateAndConnect(filename)));
  ref.onDispose(db.close);
  return db;
});

final initSettingsProvider = FutureProvider((ref) {
  final db = ref.read(dbProvider);
  return db.getSettings().getSingle();
});

final settingProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.getSettings().watchSingle();
});

final formatProvider = Provider<FormatData?>((ref) => throw UnimplementedError());

final formatListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listFormats().watch();
});

final rotationProvider = Provider<RotationData?>((ref) => throw UnimplementedError());

final rotationListProvider = StreamProvider.family<List<RotationData>, FormatData?>((ref, format) {
  final db = ref.watch(dbProvider);
  return db.listRotations(where: format?.code.let(db.rotation.formatCode.equals) ?? trueExpression).watch();
});

final mwlProvider = Provider<MwlData?>((ref) => throw UnimplementedError());

final mwlListProvider = StreamProvider.family<List<MwlData>, FormatData?>((ref, format) {
  final db = ref.watch(dbProvider);
  return db.listMwl(where: format?.code.let(db.mwl.formatCode.equals) ?? trueExpression).watch();
});

final collectionProvider = StreamProvider.family<List<CollectionResult>, bool>((ref, inCollection) {
  final db = ref.watch(dbProvider);
  return db.listCollection(inCollection: inCollection).watch();
});

final collectionByCycleProvider =
    StreamProvider.family<Map<CycleData, List<CollectionResult>>, bool>((ref, inCollection) {
  final collection = ref.watch(collectionProvider(inCollection).stream);
  return collection.map((items) {
    return groupBy<CollectionResult, CycleData>(items, (item) => item.cycle);
  });
});

final packListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listPacks().watch();
});

final factionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listFactions().watch();
});

final typeListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listTypes().watch();
});

final distinctTagListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listDistinctDeckTags().watch();
});
