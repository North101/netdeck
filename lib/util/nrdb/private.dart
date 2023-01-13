import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '/db/database.dart';
import '/env.dart';
import '/providers/nrdb.dart';
import 'private_model.dart';

part 'private.freezed.dart';

class RefreshTokenStorage {
  const RefreshTokenStorage();

  static const secureStorage = FlutterSecureStorage();

  static const refreshTokenKey = 'refresh_token';

  Future<String?> get() => secureStorage.read(key: refreshTokenKey);

  Future<void> save(String token) => secureStorage.write(key: refreshTokenKey, value: token);

  Future<void> delete() => secureStorage.delete(key: refreshTokenKey);
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);

  set _value(AuthState authState) => state = authState;

  AuthState get _value => state;
}

typedef AuthStateRef = StateNotifierProviderRef<AuthStateNotifier, AuthState>;

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  @With<AuthStateRefMixin>()
  @With<RefreshTokenMixin>()
  const factory AuthState.init(AuthStateRef ref) = InitAuthState;

  @With<AuthStateRefMixin>()
  const factory AuthState.connecting(
    AuthStateRef ref,
    Future<AuthState> future,
  ) = ConnectingAuthState;

  @With<AuthStateRefMixin>()
  @With<LogoutMixin>()
  @With<RefreshTokenMixin>()
  const factory AuthState.offline(
    AuthStateRef ref,
    TokenResponse? token,
  ) = OfflineAuthState;

  @With<AuthStateRefMixin>()
  @With<LogoutMixin>()
  @With<RefreshTokenMixin>()
  @With<OnlineAuthStateMixin>()
  const factory AuthState.online(
    AuthStateRef ref,
    TokenResponse token,
    NrdbUser user,
  ) = OnlineAuthState;

  @With<AuthStateRefMixin>()
  @With<LoginMixin>()
  const factory AuthState.unauthenticated(AuthStateRef ref) = UnauthenticatedAuthState;

  final appAuth = const FlutterAppAuth();
  final tokenStorage = const RefreshTokenStorage();

  Future<OnlineAuthState?> online() {
    return map(
      init: (state) async => null,
      connecting: (state) async {
        final authState = await state.future;
        return authState.mapOrNull(online: (state) => state);
      },
      offline: (state) async {
        final authState = await state.refreshToken();
        return authState.mapOrNull(online: (state) => state);
      },
      online: (state) async => state,
      unauthenticated: (state) async => null,
    );
  }

  bool get isConnected => map(
        init: (state) => false,
        connecting: (state) => false,
        offline: (state) => true,
        online: (state) => true,
        unauthenticated: (state) => false,
      );
}

mixin AuthStateRefMixin on AuthState {
  set _authState(AuthState value) => ref.notifier._value = value;

  AuthState get _authState => ref.notifier._value;

  Future<NrdbUser?> getUser(TokenResponse token) async {
    final response = await http.get(
      Uri.parse('https://netrunnerdb.com/api/2.0/private/account/info'),
      headers: {
        'Authorization': 'Bearer ${token.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) return null;

    return NrdbUser.fromJson((json.decode(response.body)['data'][0] as Map).cast());
  }
}

mixin LoginMixin on AuthStateRefMixin {
  Future<AuthState> login() async {
    final authState = _authState.maybeMap(
      connecting: (future) => future,
      orElse: () => ConnectingAuthState(ref, _login()),
    );
    _authState = authState;

    final value = await authState.future;
    _authState = value;
    return value;
  }

  Future<AuthState> _login() async {
    try {
      final token = await appAuth
          .authorizeAndExchangeCode(
            AuthorizationTokenRequest(
              EnvData.nrdbClientId,
              EnvData.nrdbRedirectUrl,
              clientSecret: EnvData.nrdbClientSecret,
              serviceConfiguration: const AuthorizationServiceConfiguration(
                authorizationEndpoint: EnvData.nrdbAuthUrl,
                tokenEndpoint: EnvData.nrdbTokenUrl,
              ),
            ),
          )
          .catchError((e) => null);
      if (token == null) {
        return AuthState.unauthenticated(ref);
      } else if (token.refreshToken != null) {
        await tokenStorage.save(token.refreshToken!);
      }
      final user = await getUser(token).catchError((e) => null);
      if (user == null) return AuthState.unauthenticated(ref);

      return AuthState.online(ref, token, user);
    } on Exception catch (e) {
      print(e);

      return AuthState.unauthenticated(ref);
    }
  }
}

mixin LogoutMixin on AuthStateRefMixin {
  Future<void> logout() async {
    await tokenStorage.delete();
    _authState = AuthState.unauthenticated(ref);
  }
}

mixin RefreshTokenMixin on AuthStateRefMixin {
  Future<AuthState> refreshToken() async {
    final authState = _authState.maybeMap(
      connecting: (state) => state,
      orElse: () => ConnectingAuthState(ref, _refreshToken()),
    );
    _authState = authState;

    _authState = await authState.future;
    return _authState;
  }

  Future<AuthState> _refreshToken() async {
    final refreshToken = await tokenStorage.get().onError((error, stackTrace) => null);
    if (refreshToken == null) return AuthState.unauthenticated(ref);

    try {
      final token = await appAuth.token(
        TokenRequest(
          EnvData.nrdbClientId,
          EnvData.nrdbRedirectUrl,
          clientSecret: EnvData.nrdbClientSecret,
          refreshToken: refreshToken,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: EnvData.nrdbAuthUrl,
            tokenEndpoint: EnvData.nrdbTokenUrl,
          ),
        ),
      );
      if (token == null) {
        return AuthState.offline(ref, null);
      } else if (token.refreshToken != null) {
        await tokenStorage.save(token.refreshToken!);
      }

      final user = await getUser(token);
      if (user == null) return AuthState.offline(ref, null);

      _authState = OnlineAuthState(ref, token, user);
      return _authState;
    } on Exception catch (e) {
      print(e);

      return AuthState.offline(ref, null);
    }
  }
}

mixin OnlineAuthStateMixin on LogoutMixin, RefreshTokenMixin {
  static Uri getDeckEndpoint(String deckId) => Uri.parse('https://netrunnerdb.com/api/2.0/private/deck/$deckId');
  static final listDecksEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/decks');
  static final saveDeckEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/deck/save');
  static final getUserEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/account/info');

  TokenResponse get token;

  Map<String, String> get authHeaders => {
        'Authorization': 'Bearer ${token.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      };

  void offline() => _authState = AuthState.offline(ref, token);

  Future<HttpResult<List<NrdbDeck>>> listDecks() async {
    final response = await http.get(
      listDecksEndpoint,
      headers: authHeaders,
    );
    if (response.statusCode != 200) return const HttpResult.unknown();

    return HttpResult.fromJson((json.decode(response.body) as Map).cast(), (json) {
      return (json as List).map((e) => NrdbDeck.fromJson((e as Map).cast())).toList();
    });
  }

  Future<HttpResult<NrdbDeck>> getDeck(String deckId) async {
    final response = await http.get(
      getDeckEndpoint(deckId),
      headers: authHeaders,
    );
    if (response.statusCode == 404) {
      return const HttpResult.notFound();
    } else if (response.statusCode != 200) {
      return const HttpResult.unknown();
    }

    return HttpResult.fromJson((json.decode(response.body) as Map).cast(), (json) {
      return (json as List).map((e) => NrdbDeck.fromJson((e as Map).cast())).first;
    });
  }

  Future<HttpResult<NrdbDeck>> saveDeck(NrdbDeck deck) async {
    final response = await http.post(
      saveDeckEndpoint,
      headers: authHeaders,
      body: json.encode({
        'deck_id': deck.id.isEmpty ? null : deck.id,
        'name': deck.name,
        'description': deck.description,
        'content': deck.cards,
        'tags': deck.tags.join(' '),
      }),
    );
    if (response.statusCode == 404) {
      return const HttpResult.notFound();
    } else if (response.statusCode != 200) {
      return const HttpResult.unknown();
    }

    return HttpResult.fromJson((json.decode(response.body) as Map).cast(), (json) {
      return (json as List).map((e) => NrdbDeck.fromJson((e as Map).cast())).first;
    });
  }

  Future<void> syncDecks(Database db, List<NrdbDeck> decks) async {
    final lastSync = ref.read(lastSyncProvider);
    lastSync.value = DateTime.now();

    final deckList = await db.listDeckNotifier(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(decks.map((e) => e.id));
      },
    ).first;
    final updateLocalDecks = <NrdbDeck, NrdbDeck?>{};
    final updateRemoteDecks = <NrdbDeck>[];
    final updateRemoteDecksStatus = <NrdbDeck>[];
    for (final remoteDeck in decks) {
      final localDeck = deckList.firstWhereOrNull((e) => e.id == remoteDeck.id);
      if (localDeck == null) {
        updateLocalDecks[remoteDeck] = null;
      } else {
        final syncIssues = localDeck.syncIssues(remoteDeck.dateUpdate);
        if (syncIssues == SyncIssues.both) {
          updateRemoteDecksStatus.add(remoteDeck);
        } else if (syncIssues == SyncIssues.local) {
          updateRemoteDecks.add(localDeck.toNrdbDeck());
        } else if (syncIssues == SyncIssues.remote) {
          updateLocalDecks[remoteDeck] = localDeck.toNrdbDeck();
        }
      }
    }

    for (final localDeck in updateRemoteDecks) {
      final deck = (await saveDeck(localDeck)).mapOrNull(success: (result) => result.data);
      if (deck != null) {
        updateLocalDecks[deck] = localDeck;
      }
    }
    await syncWithLocalDecks(db, updateLocalDecks);
    await db.batch((batch) async {
      for (final remoteDeck in updateRemoteDecksStatus) {
        batch.update<Deck, DeckData>(
          db.deck,
          DeckCompanion(
            remoteUpdated: drift.Value(remoteDeck.dateUpdate),
          ),
          where: (tbl) => tbl.id.equals(remoteDeck.id),
        );
      }
    });
  }

  Future<void> forceUpload(Database db, Iterable<NrdbDeck> localDecks) async {
    final decks = <NrdbDeck, NrdbDeck>{};
    for (final localDeck in localDecks) {
      final deck = (await saveDeck(localDeck)).mapOrNull(success: (result) => result.data);
      if (deck != null) {
        decks[deck] = localDeck;
      }
    }
    await db.transaction(() async {
      await syncWithLocalDecks(db, decks);
    });
  }

  Future<void> forceDownload(Database db, Iterable<NrdbDeck> localDecks) async {
    final listDecksResult = (await listDecks()).mapOrNull(success: (result) => result.data);
    if (listDecksResult == null) return;

    final decks = <NrdbDeck, NrdbDeck>{};
    for (final remoteDeck in listDecksResult) {
      final localDeck = localDecks.firstWhereOrNull((e) => e.id == remoteDeck.id);
      if (localDeck != null) {
        decks[remoteDeck] = localDeck;
      }
    }
    await db.transaction(() async {
      await syncWithLocalDecks(db, decks);
    });
  }

  Future<void> syncWithLocalDecks(Database db, Map<NrdbDeck, NrdbDeck?> decks) async {
    await db.batch((batch) async {
      final deleteDeckIds = <String>[];
      for (final deck in decks.entries) {
        final remoteDeck = deck.key;
        final localDeck = deck.value;
        await syncWithLocalDeck(
          db,
          batch,
          remoteDeck,
          mwlCode: drift.Value(localDeck?.mwlCode),
        );
        if (localDeck != null && remoteDeck.id != localDeck.id) {
          deleteDeckIds.add(localDeck.id);
        }
      }
      await db.deleteDecks(deckIds: deleteDeckIds);
      await db.deleteDeckCards(deckIds: deleteDeckIds);
      await db.deleteDeckTags(deckIds: deleteDeckIds);
    });
  }

  Future<void> syncWithLocalDeck(
    Database db,
    drift.Batch batch,
    NrdbDeck deck, {
    drift.Value<String?> formatCode = const drift.Value.absent(),
    drift.Value<String?> rotationCode = const drift.Value.absent(),
    drift.Value<String?> mwlCode = const drift.Value.absent(),
  }) async {
    final identityCodes = await db.listIdentityCards(codeList: deck.cards.keys.toList()).get();
    final identityCode = identityCodes.firstOrNull;
    if (identityCode == null) return;

    batch.insert<Deck, DeckData>(
      db.deck,
      DeckCompanion.insert(
        id: deck.id,
        identityCode: identityCode,
        name: deck.name,
        description: deck.description,
        created: deck.dateCreation,
        updated: deck.dateUpdate,
        synced: drift.Value(deck.dateUpdate),
        remoteUpdated: drift.Value(deck.dateUpdate),
        formatCode: formatCode,
        rotationCode: rotationCode,
        mwlCode: mwlCode,
        deleted: false,
      ),
      mode: drift.InsertMode.insertOrReplace,
    );
    batch.deleteWhere<DeckCard, DeckCardData>(db.deckCard, (tbl) => tbl.deckId.equals(deck.id));
    batch.insertAll<DeckCard, DeckCardData>(db.deckCard, [
      ...deck.cards.entries.where((e) => !identityCodes.contains(e.key)).map(
            (e) => DeckCardCompanion.insert(
              deckId: deck.id,
              cardCode: e.key,
              quantity: e.value,
            ),
          ),
    ]);
    batch.deleteWhere<DeckTag, DeckTagData>(db.deckTag, (tbl) => tbl.deckId.equals(deck.id));
    batch.insertAll<DeckTag, DeckTagData>(db.deckTag, [
      ...deck.tags.map(
        (e) => DeckTagCompanion.insert(
          deckId: deck.id,
          tag: e,
        ),
      ),
    ]);
  }
}
