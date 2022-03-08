import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/providers/db.dart';
import '/util/nrdb/private.dart';
import '/util/nrdb/public.dart';

final hasInternetProvider = StreamProvider((ref) {
  return Connectivity()
      .onConnectivityChanged
      .map((event) => event == ConnectivityResult.mobile || event == ConnectivityResult.wifi);
});

final nrdbAuthStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(AuthState.init(ref));
});

final nrdbPublicApiProvider = StateNotifierProvider<NrdbPublicApiNotifier, AsyncValue<DateTime>>((ref) {
  final db = ref.watch(dbProvider);
  return NrdbPublicApiNotifier(NrdbPublicApi(db));
});

final lastSyncProvider = StateProvider<DateTime?>((ref) => null);

final periodicLastSyncProvider = StreamProvider<Duration?>((ref) {
  final lastSync = ref.watch(lastSyncProvider);
  return MergeStream([
    Stream.value(null),
    Stream.periodic(const Duration(minutes: 1), (x) {
      return lastSync != null ? DateTime.now().difference(lastSync) : null;
    }),
  ]);
});

final shouldSyncProvider = Provider<OnlineAuthState?>((ref) {
  final nrdbAuthState = ref.watch(nrdbAuthStateProvider);
  if (nrdbAuthState is! OnlineAuthState) return null;

  final periodicShouldSync = ref.watch(periodicLastSyncProvider.select((value) {
    return value.maybeWhen(
      data: (data) => data == null || data > const Duration(minutes: 30),
      orElse: () => false,
    );
  }));
  return periodicShouldSync ? nrdbAuthState : null;
});
