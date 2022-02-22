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

final lastSyncProvider = StateProvider<DateTime>((ref) => DateTime(0));

final periodicLastSyncProvider = StreamProvider<Duration>((ref) {
  final lastSync = ref.watch(lastSyncProvider);
  return MergeStream([
    Stream.value(DateTime.now().difference(lastSync)),
    Stream.periodic(const Duration(minutes: 1), (x) => DateTime.now().difference(lastSync)),
  ]);
});

final shouldSyncProvider = Provider((ref) {
  final hasInternet = ref.watch(hasInternetProvider).whenOrNull(data: (value) => value);
  if (hasInternet != true) return null;

  final lastSync = ref.watch(periodicLastSyncProvider.select((value) => value.whenOrNull(data: (data) => data)));
  if (lastSync == null) return null;

  final nrdbAuthState = ref.watch(nrdbAuthStateProvider);
  return nrdbAuthState is OnlineAuthState && lastSync >= const Duration(minutes: 30) ? nrdbAuthState : null;
});
