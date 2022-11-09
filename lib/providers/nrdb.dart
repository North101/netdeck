import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/util/nrdb/private.dart';
import '/util/nrdb/public.dart';
import 'db.dart';

final hasInternetProvider = StreamProvider((ref) {
  return Connectivity()
      .onConnectivityChanged
      .map((event) => event == ConnectivityResult.mobile || event == ConnectivityResult.wifi);
});

final nrdbAuthStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(AuthState.init(ref));
});

final nrdbPublicApiProvider = RestorableProvider<NrdbPublicApiNotifier>((ref) {
  final db = ref.watch(dbProvider);
  return NrdbPublicApiNotifier(NrdbPublicApi(db));
}, restorationId: 'nrdbPublicApiProvider');

final lastSyncProvider = RestorableProvider<RestorableDateTimeN>(
  (ref) => RestorableDateTimeN(null),
  restorationId: 'lastSyncProvider',
);

final periodicLastSyncProvider = StreamProvider<Duration?>((ref) async* {
  final lastSync = ref.watch(lastSyncProvider).value;
  yield null;
  yield* Stream.periodic(const Duration(minutes: 1), (x) {
    return lastSync != null ? DateTime.now().difference(lastSync) : null;
  });
});

final shouldSyncProvider = Provider<OnlineAuthState?>((ref) {
  final nrdbAuthState = ref.watch(nrdbAuthStateProvider);
  if (nrdbAuthState is! OnlineAuthState) return null;

  final periodicShouldSync = ref.watch(periodicLastSyncProvider.select((value) {
    return value.maybeWhen(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: true,
      data: (data) => data == null || data > const Duration(minutes: 30),
      orElse: () => false,
    );
  }));
  return periodicShouldSync ? nrdbAuthState : null;
});
