// ignore_for_file: invalid_use_of_protected_member

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

part 'private.freezed.dart';

class NrdbUser {
  const NrdbUser(
    this.id,
    this.username,
    this.email,
    this.reputation,
    this.sharing,
  );

  NrdbUser.fromJson(Map<String, dynamic> json)
      : this(
          json['id'],
          json['username'],
          json['email'],
          json['reputation'],
          json['sharing'],
        );

  final String email;
  final int id;
  final int reputation;
  final bool sharing;
  final String username;
}

class NrdbDeck {
  const NrdbDeck({
    required this.id,
    required this.name,
    required this.description,
    required this.mwlCode,
    required this.created,
    required this.updated,
    required this.cards,
    required this.tags,
  });

  factory NrdbDeck.fromJson(Map<String, dynamic> json) {
    return NrdbDeck(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      mwlCode: json['mwl_code'],
      created: DateTime.parse(json['date_creation']),
      updated: DateTime.parse(json['date_update']),
      cards: (json['cards'] as Map).cast<String, int>(),
      tags: (json['tags'] as String?)?.split(' ').where((e) => e.isNotEmpty).toList() ?? [],
    );
  }

  final String id;
  final String name;
  final String description;
  final String? mwlCode;
  final DateTime created;
  final DateTime updated;
  final Map<String, int> cards;
  final List<String> tags;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.init(
    StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
  ) = InitAuthState;

  const factory AuthState.connecting(
    StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
    Future<AuthState> future,
  ) = ConnectingAuthState;

  const factory AuthState.offline(
    StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
    TokenResponse? token,
  ) = OfflineAuthState;

  const factory AuthState.online(
    StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
    TokenResponse token,
    NrdbUser user,
  ) = OnlineAuthState;

  const factory AuthState.unauthenticated(
    StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
  ) = UnauthenticatedAuthState;

  static const FlutterAppAuth appAuth = FlutterAppAuth();
  static const refreshTokenKey = 'refresh_token';
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<AuthState> login(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final authState = ref.notifier.state.maybeMap(
      connecting: (future) => future,
      orElse: () => ConnectingAuthState(ref, _login(ref)),
    );
    ref.notifier.state = authState;

    final value = await authState.future;
    ref.notifier.state = value;
    return value;
  }

  static Future<AuthState> _login(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    try {
      final token = await AuthState.appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          EnvData.nrdbClientId,
          EnvData.nrdbRedirectUrl,
          clientSecret: EnvData.nrdbClientSecret,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: EnvData.nrdbAuthUrl,
            tokenEndpoint: EnvData.nrdbTokenUrl,
          ),
        ),
      );
      if (token == null) {
        return AuthState.unauthenticated(ref);
      } else if (token.refreshToken != null) {
        await saveRefreshToken(token.refreshToken!);
      }
      final user = await AuthState.getUser(token);
      if (user == null) {
        return AuthState.unauthenticated(ref);
      }

      return OnlineAuthState(ref, token, user);
    } on Exception catch (e) {
      print(e);

      return AuthState.unauthenticated(ref);
    }
  }

  static Future<void> logout(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    await deleteRefreshToken();
    ref.notifier.state = AuthState.unauthenticated(ref);
  }

  static Future<NrdbUser?> getUser(TokenResponse token) async {
    final response = await http.get(
      Uri.parse('https://netrunnerdb.com/api/2.0/private/account/info'),
      headers: {
        'Authorization': 'Bearer ${token.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) return null;

    return NrdbUser.fromJson(json.decode(response.body)['data'][0]);
  }

  static Future<AuthState> refreshToken(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final authState = ref.notifier.state.maybeMap(
      connecting: (state) => state,
      orElse: () => ConnectingAuthState(ref, _refreshToken(ref)),
    );
    ref.notifier.state = authState;

    final value = await authState.future;
    ref.notifier.state = value;
    return value;
  }

  static Future<AuthState> _refreshToken(final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return UnauthenticatedAuthState(ref);
    }

    try {
      final token = await AuthState.appAuth.token(
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
        await saveRefreshToken(token.refreshToken!);
      }

      final user = await AuthState.getUser(token);
      if (user == null) {
        return AuthState.offline(ref, null);
      }

      final authState = OnlineAuthState(ref, token, user);
      ref.notifier.state = authState;
      return authState;
    } on Exception catch (e) {
      print(e);

      return AuthState.offline(ref, null);
    }
  }

  static Future<String?> getRefreshToken() => AuthState.secureStorage.read(key: AuthState.refreshTokenKey);

  static Future<void> saveRefreshToken(String token) =>
      AuthState.secureStorage.write(key: AuthState.refreshTokenKey, value: token);

  static Future<void> deleteRefreshToken() => AuthState.secureStorage.delete(key: AuthState.refreshTokenKey);
}

extension AuthStateEx on AuthState {
  Future<OnlineAuthState?> online() {
    return map(
      init: (state) async => null,
      connecting: (state) async {
        final value = await state.future;
        return value.mapOrNull(online: (state) => state);
      },
      offline: (state) async {
        final value = await state.refreshToken();
        return value.mapOrNull(online: (state) => state);
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

extension UnauthenticatedAuthStateEx on UnauthenticatedAuthState {
  Future<AuthState> login() => AuthState.login(ref);
}

extension OnlineAuthStateEx on OnlineAuthState {
  static Uri getDeckEndpoint(String deckId) => Uri.parse('https://netrunnerdb.com/api/2.0/private/deck/$deckId');
  static final listDecksEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/decks');
  static final saveDeckEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/deck/save');
  static final getUserEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/private/account/info');

  Future<void> logout() => AuthState.logout(ref);

  Future<AuthState> refreshToken() => AuthState.refreshToken(ref);

  void offline() {
    ref.notifier.state = AuthState.offline(ref, token);
  }

  Map<String, String> get authHeaders => {
        'Authorization': 'Bearer ${token.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      };

  Future<HttpResult<List<NrdbDeck>>> listDecks() async {
    final response = await http.get(
      listDecksEndpoint,
      headers: authHeaders,
    );
    if (response.statusCode != 200) {
      return const HttpResult.unknown();
    }

    final List results = json.decode(response.body)['data'];
    return HttpResult.success(results.map((result) {
      return NrdbDeck.fromJson(result);
    }).toList());
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

    final Map result = json.decode(response.body)['data'][0];
    return HttpResult.success(NrdbDeck.fromJson(result.cast<String, dynamic>()));
  }

  Future<HttpResult<NrdbDeck>> saveDeck(DeckMiniResult deck) async {
    print('saveDeck: ${deck.name}');
    final response = await http.post(
      saveDeckEndpoint,
      headers: authHeaders,
      body: json.encode({
        'deck_id': deck.remoteUpdated == null ? null : deck.id,
        'name': deck.name,
        'description': deck.description,
        'content': {
          deck.identityCode: 1,
          for (final entry in deck.cards.entries)
            if (entry.value > 0) entry.key: entry.value,
        },
        'tags': deck.tags.join(' '),
      }),
    );
    print(response.body);
    if (response.statusCode == 404) {
      return const HttpResult.notFound();
    } else if (response.statusCode != 200) {
      return const HttpResult.unknown();
    }

    return HttpResult.success(NrdbDeck.fromJson(json.decode(response.body)['data'][0]));
  }

  Future<void> syncDecks(Database db, List<NrdbDeck> decks) async {
    final lastSync = ref.read(lastSyncProvider);
    lastSync.value = DateTime.now();

    final deckList = await db.listMiniDecks(
      where: (deck, identity, pack, cycle, faction, side, type, subtype, format, rotation, mwl) {
        return deck.id.isIn(decks.map((e) => e.id));
      },
    ).first;
    final updateLocalDecks = <NrdbDeck, DeckMiniResult?>{};
    final updateRemoteDecks = <DeckMiniResult>[];
    final updateRemoteDecksStatus = <NrdbDeck>[];
    for (final remoteDeck in decks) {
      final localDeck = deckList.firstWhereOrNull((e) => e.id == remoteDeck.id);
      if (localDeck == null) {
        updateLocalDecks[remoteDeck] = null;
      } else {
        final syncIssues = localDeck.syncIssues(remoteDeck.updated);
        if (syncIssues == SyncIssues.both) {
          updateRemoteDecksStatus.add(remoteDeck);
        } else if (syncIssues == SyncIssues.local) {
          updateRemoteDecks.add(localDeck);
        } else if (syncIssues == SyncIssues.remote) {
          updateLocalDecks[remoteDeck] = localDeck;
        }
      }
    }

    for (final localDeck in updateRemoteDecks) {
      final result = await saveDeck(localDeck);
      if (result is SuccessHttpResult<NrdbDeck>) {
        updateLocalDecks[result.value] = localDeck;
      }
    }
    await syncWithLocalDecks(db, updateLocalDecks);
    await db.batch((batch) async {
      for (final remoteDeck in updateRemoteDecksStatus) {
        print('updateRemoteDeckStatus: ${remoteDeck.name}');
        batch.update<Deck, DeckData>(
          db.deck,
          DeckCompanion(
            remoteUpdated: drift.Value(remoteDeck.updated),
          ),
          where: (tbl) => tbl.id.equals(remoteDeck.id),
        );
      }
    });
  }

  Future<void> forceUpload(Database db, Iterable<DeckMiniResult> localDecks) async {
    final decks = <NrdbDeck, DeckMiniResult>{};
    for (final localDeck in localDecks) {
      final saveDeckResult = await saveDeck(localDeck);
      if (saveDeckResult is SuccessHttpResult<NrdbDeck>) {
        decks[saveDeckResult.value] = localDeck;
      }
    }
    await db.transaction(() async {
      await syncWithLocalDecks(db, decks);
    });
  }

  Future<void> forceDownload(Database db, Iterable<DeckMiniResult> localDecks) async {
    final listDecksResult = await listDecks();
    if (listDecksResult is! SuccessHttpResult<List<NrdbDeck>>) return;

    final decks = <NrdbDeck, DeckMiniResult>{};
    for (final remoteDeck in listDecksResult.value) {
      final localDeck = localDecks.firstWhereOrNull((e) => e.id == remoteDeck.id);
      if (localDeck != null) {
        decks[remoteDeck] = localDeck;
      }
    }
    await db.transaction(() async {
      await syncWithLocalDecks(db, decks);
    });
  }

  Future<void> syncWithLocalDecks(Database db, Map<NrdbDeck, DeckMiniResult?> decks) async {
    await db.batch((batch) async {
      final deleteDeckIds = <String>[];
      for (final deck in decks.entries) {
        final remoteDeck = deck.key;
        final localDeck = deck.value;
        await syncWithLocalDeck(
          db,
          batch,
          remoteDeck,
          formatCode: drift.Value(localDeck?.formatCode),
          rotationCode: drift.Value(localDeck?.rotationCode),
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
    print('syncLocalDeck: ${deck.name}');
    final identityCode = identityCodes.firstOrNull;
    if (identityCode == null) return;

    batch.insert<Deck, DeckData>(
      db.deck,
      DeckCompanion.insert(
        id: deck.id,
        identityCode: identityCode,
        name: deck.name,
        description: deck.description,
        created: deck.created,
        updated: deck.updated,
        synced: drift.Value(deck.updated),
        remoteUpdated: drift.Value(deck.updated),
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

extension OfflineAuthStateEx on OfflineAuthState {
  Future<void> logout() => AuthState.logout(ref);

  Future<AuthState> refreshToken() => AuthState.refreshToken(ref);
}

@freezed
class HttpResult<T> with _$HttpResult {
  const factory HttpResult.success(T value) = SuccessHttpResult;

  const factory HttpResult.notFound() = NotFoundHttpResult;

  const factory HttpResult.unknown() = UnknownHttpResult;
}
