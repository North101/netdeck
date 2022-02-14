// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/db/database.dart';
import '/environment_config.dart';

part 'private.freezed.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(AuthState state) : super(state);
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.connecting(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref, Future<TokenResponse?> future) = ConnectingAuthState;

  const factory AuthState.offline(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref, TokenResponse? token) =
      OfflineAuthState;

  const factory AuthState.online(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref, TokenResponse token) =
      OnlineAuthState;

  const factory AuthState.unauthenticated(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      UnauthenticatedAuthState;

  static final FlutterAppAuth appAuth = FlutterAppAuth();
  static const refreshTokenKey = 'refresh_token';
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<TokenResponse?> login(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final authState = ref.notifier.state.maybeMap(
      connecting: (future) => future,
      orElse: () => ConnectingAuthState(ref, _login(ref)),
    );
    ref.notifier.state = authState;
    return authState.future;
  }

  static Future<TokenResponse?> _login(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    try {
      final token = await AuthState.appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          EnvironmentConfig.nrdbClientId,
          EnvironmentConfig.nrdbRedirectUrl,
          clientSecret: EnvironmentConfig.nrdbClientSecret,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: EnvironmentConfig.nrdbAuthUrl,
            tokenEndpoint: EnvironmentConfig.nrdbTokenUrl,
          ),
        ),
      );
      if (token == null) {
        ref.notifier.state = AuthState.offline(ref, token);
        return null;
      } else if (token.refreshToken != null) {
        await saveRefreshToken(token.refreshToken!);
      }

      ref.notifier.state = AuthState.online(ref, token);
      return token;
    } on Exception catch (e) {
      print(e);

      ref.notifier.state = AuthState.offline(ref, null);
      return null;
    }
  }

  static Future<void> logout(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    await deleteRefreshToken();
    ref.notifier.state = AuthState.unauthenticated(ref);
  }

  static Future<TokenResponse?> refreshToken(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final authState = ref.notifier.state.maybeMap(
      connecting: (state) => state,
      orElse: () => ConnectingAuthState(ref, _refreshToken(ref)),
    );
    ref.notifier.state = authState;

    return authState.future;
  }

  static Future<TokenResponse?> _refreshToken(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      ref.notifier.state = UnauthenticatedAuthState(ref);
      return null;
    }

    try {
      final token = await AuthState.appAuth.token(
        TokenRequest(
          EnvironmentConfig.nrdbClientId,
          EnvironmentConfig.nrdbRedirectUrl,
          clientSecret: EnvironmentConfig.nrdbClientSecret,
          refreshToken: refreshToken,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: EnvironmentConfig.nrdbAuthUrl,
            tokenEndpoint: EnvironmentConfig.nrdbTokenUrl,
          ),
        ),
      );
      if (token == null) {
        ref.notifier.state = AuthState.offline(ref, null);
        return null;
      } else if (token.refreshToken != null) {
        await saveRefreshToken(token.refreshToken!);
      }

      ref.notifier.state = AuthState.online(ref, token);
      return token;
    } on Exception catch (e) {
      print(e);

      ref.notifier.state = AuthState.offline(ref, null);
      return null;
    }
  }

  static Future<String?> getRefreshToken() => AuthState.secureStorage.read(key: AuthState.refreshTokenKey);

  static Future<void> saveRefreshToken(String token) =>
      AuthState.secureStorage.write(key: AuthState.refreshTokenKey, value: token);

  static Future<void> deleteRefreshToken() => AuthState.secureStorage.delete(key: AuthState.refreshTokenKey);
}

extension UnauthenticatedAuthStateEx on UnauthenticatedAuthState {
  Future<TokenResponse?> login() => AuthState.login(ref);
}

extension OnlineAuthStateEx on OnlineAuthState {
  Future<void> logout() => AuthState.logout(ref);

  Future<TokenResponse?> refreshToken() => AuthState.refreshToken(ref);
}

extension OfflineAuthStateEx on OfflineAuthState {
  Future<void> logout() => AuthState.logout(ref);

  Future<TokenResponse?> refreshToken() => AuthState.refreshToken(ref);
}

class NrdbPrivateApi {
  const NrdbPrivateApi(this.token);

  final String token;

  Future<void> getUser() async {}

  Future<void> listDecks() async {}

  Future<void> readDeck(String deckId) async {}

  Future<void> saveDeck(DeckData deck, List<String> tags, Map<String, int> deckList) async {}
}