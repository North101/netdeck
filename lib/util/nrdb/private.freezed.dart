// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'private.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  InitAuthState init(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) {
    return InitAuthState(
      ref,
    );
  }

  ConnectingAuthState connecting(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      Future<AuthState> future) {
    return ConnectingAuthState(
      ref,
      future,
    );
  }

  OfflineAuthState offline(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse? token) {
    return OfflineAuthState(
      ref,
      token,
    );
  }

  OnlineAuthState online(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse token,
      NrdbUser user) {
    return OnlineAuthState(
      ref,
      token,
      user,
    );
  }

  UnauthenticatedAuthState unauthenticated(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) {
    return UnauthenticatedAuthState(
      ref,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? ref = freezed,
  }) {
    return _then(_value.copyWith(
      ref: ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ));
  }
}

/// @nodoc
abstract class $InitAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $InitAuthStateCopyWith(
          InitAuthState value, $Res Function(InitAuthState) then) =
      _$InitAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class _$InitAuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $InitAuthStateCopyWith<$Res> {
  _$InitAuthStateCopyWithImpl(
      InitAuthState _value, $Res Function(InitAuthState) _then)
      : super(_value, (v) => _then(v as InitAuthState));

  @override
  InitAuthState get _value => super._value as InitAuthState;

  @override
  $Res call({
    Object? ref = freezed,
  }) {
    return _then(InitAuthState(
      ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ));
  }
}

/// @nodoc

class _$InitAuthState implements InitAuthState {
  const _$InitAuthState(this.ref);

  @override
  final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref;

  @override
  String toString() {
    return 'AuthState.init(ref: $ref)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ref));

  @JsonKey(ignore: true)
  @override
  $InitAuthStateCopyWith<InitAuthState> get copyWith =>
      _$InitAuthStateCopyWithImpl<InitAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) {
    return init(ref);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) {
    return init?.call(ref);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(ref);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitAuthState implements AuthState {
  const factory InitAuthState(
          StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$InitAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  @override
  @JsonKey(ignore: true)
  $InitAuthStateCopyWith<InitAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectingAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $ConnectingAuthStateCopyWith(
          ConnectingAuthState value, $Res Function(ConnectingAuthState) then) =
      _$ConnectingAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      Future<AuthState> future});
}

/// @nodoc
class _$ConnectingAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $ConnectingAuthStateCopyWith<$Res> {
  _$ConnectingAuthStateCopyWithImpl(
      ConnectingAuthState _value, $Res Function(ConnectingAuthState) _then)
      : super(_value, (v) => _then(v as ConnectingAuthState));

  @override
  ConnectingAuthState get _value => super._value as ConnectingAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? future = freezed,
  }) {
    return _then(ConnectingAuthState(
      ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      future == freezed
          ? _value.future
          : future // ignore: cast_nullable_to_non_nullable
              as Future<AuthState>,
    ));
  }
}

/// @nodoc

class _$ConnectingAuthState implements ConnectingAuthState {
  const _$ConnectingAuthState(this.ref, this.future);

  @override
  final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref;
  @override
  final Future<AuthState> future;

  @override
  String toString() {
    return 'AuthState.connecting(ref: $ref, future: $future)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectingAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.future, future));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(future));

  @JsonKey(ignore: true)
  @override
  $ConnectingAuthStateCopyWith<ConnectingAuthState> get copyWith =>
      _$ConnectingAuthStateCopyWithImpl<ConnectingAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) {
    return connecting(ref, future);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) {
    return connecting?.call(ref, future);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(ref, future);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class ConnectingAuthState implements AuthState {
  const factory ConnectingAuthState(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      Future<AuthState> future) = _$ConnectingAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  Future<AuthState> get future;
  @override
  @JsonKey(ignore: true)
  $ConnectingAuthStateCopyWith<ConnectingAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $OfflineAuthStateCopyWith(
          OfflineAuthState value, $Res Function(OfflineAuthState) then) =
      _$OfflineAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse? token});
}

/// @nodoc
class _$OfflineAuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OfflineAuthStateCopyWith<$Res> {
  _$OfflineAuthStateCopyWithImpl(
      OfflineAuthState _value, $Res Function(OfflineAuthState) _then)
      : super(_value, (v) => _then(v as OfflineAuthState));

  @override
  OfflineAuthState get _value => super._value as OfflineAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? token = freezed,
  }) {
    return _then(OfflineAuthState(
      ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenResponse?,
    ));
  }
}

/// @nodoc

class _$OfflineAuthState implements OfflineAuthState {
  const _$OfflineAuthState(this.ref, this.token);

  @override
  final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref;
  @override
  final TokenResponse? token;

  @override
  String toString() {
    return 'AuthState.offline(ref: $ref, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfflineAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  $OfflineAuthStateCopyWith<OfflineAuthState> get copyWith =>
      _$OfflineAuthStateCopyWithImpl<OfflineAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) {
    return offline(ref, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) {
    return offline?.call(ref, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(ref, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class OfflineAuthState implements AuthState {
  const factory OfflineAuthState(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse? token) = _$OfflineAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  TokenResponse? get token;
  @override
  @JsonKey(ignore: true)
  $OfflineAuthStateCopyWith<OfflineAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $OnlineAuthStateCopyWith(
          OnlineAuthState value, $Res Function(OnlineAuthState) then) =
      _$OnlineAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse token,
      NrdbUser user});
}

/// @nodoc
class _$OnlineAuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OnlineAuthStateCopyWith<$Res> {
  _$OnlineAuthStateCopyWithImpl(
      OnlineAuthState _value, $Res Function(OnlineAuthState) _then)
      : super(_value, (v) => _then(v as OnlineAuthState));

  @override
  OnlineAuthState get _value => super._value as OnlineAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(OnlineAuthState(
      ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenResponse,
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NrdbUser,
    ));
  }
}

/// @nodoc

class _$OnlineAuthState implements OnlineAuthState {
  const _$OnlineAuthState(this.ref, this.token, this.user);

  @override
  final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref;
  @override
  final TokenResponse token;
  @override
  final NrdbUser user;

  @override
  String toString() {
    return 'AuthState.online(ref: $ref, token: $token, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnlineAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $OnlineAuthStateCopyWith<OnlineAuthState> get copyWith =>
      _$OnlineAuthStateCopyWithImpl<OnlineAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) {
    return online(ref, token, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) {
    return online?.call(ref, token, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(ref, token, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return online(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return online?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(this);
    }
    return orElse();
  }
}

abstract class OnlineAuthState implements AuthState {
  const factory OnlineAuthState(
      StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse token,
      NrdbUser user) = _$OnlineAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  TokenResponse get token;
  NrdbUser get user;
  @override
  @JsonKey(ignore: true)
  $OnlineAuthStateCopyWith<OnlineAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticatedAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $UnauthenticatedAuthStateCopyWith(UnauthenticatedAuthState value,
          $Res Function(UnauthenticatedAuthState) then) =
      _$UnauthenticatedAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class _$UnauthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedAuthStateCopyWith<$Res> {
  _$UnauthenticatedAuthStateCopyWithImpl(UnauthenticatedAuthState _value,
      $Res Function(UnauthenticatedAuthState) _then)
      : super(_value, (v) => _then(v as UnauthenticatedAuthState));

  @override
  UnauthenticatedAuthState get _value =>
      super._value as UnauthenticatedAuthState;

  @override
  $Res call({
    Object? ref = freezed,
  }) {
    return _then(UnauthenticatedAuthState(
      ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ));
  }
}

/// @nodoc

class _$UnauthenticatedAuthState implements UnauthenticatedAuthState {
  const _$UnauthenticatedAuthState(this.ref);

  @override
  final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref;

  @override
  String toString() {
    return 'AuthState.unauthenticated(ref: $ref)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnauthenticatedAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ref));

  @JsonKey(ignore: true)
  @override
  $UnauthenticatedAuthStateCopyWith<UnauthenticatedAuthState> get copyWith =>
      _$UnauthenticatedAuthStateCopyWithImpl<UnauthenticatedAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        init,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)
        connecting,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)
        offline,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)
        online,
    required TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)
        unauthenticated,
  }) {
    return unauthenticated(ref);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
  }) {
    return unauthenticated?.call(ref);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult Function(StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token, NrdbUser user)?
        online,
    TResult Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(ref);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitAuthState value) init,
    required TResult Function(ConnectingAuthState value) connecting,
    required TResult Function(OfflineAuthState value) offline,
    required TResult Function(OnlineAuthState value) online,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitAuthState value)? init,
    TResult Function(ConnectingAuthState value)? connecting,
    TResult Function(OfflineAuthState value)? offline,
    TResult Function(OnlineAuthState value)? online,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnauthenticatedAuthState implements AuthState {
  const factory UnauthenticatedAuthState(
          StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$UnauthenticatedAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  @override
  @JsonKey(ignore: true)
  $UnauthenticatedAuthStateCopyWith<UnauthenticatedAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HttpResultTearOff {
  const _$HttpResultTearOff();

  SuccessHttpResult<T> success<T>(T value) {
    return SuccessHttpResult<T>(
      value,
    );
  }

  NotFoundHttpResult<T> notFound<T>() {
    return NotFoundHttpResult<T>();
  }

  UnknownHttpResult<T> unknown<T>() {
    return UnknownHttpResult<T>();
  }
}

/// @nodoc
const $HttpResult = _$HttpResultTearOff();

/// @nodoc
mixin _$HttpResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResultCopyWith<T, $Res> {
  factory $HttpResultCopyWith(
          HttpResult<T> value, $Res Function(HttpResult<T>) then) =
      _$HttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$HttpResultCopyWithImpl<T, $Res>
    implements $HttpResultCopyWith<T, $Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  final HttpResult<T> _value;
  // ignore: unused_field
  final $Res Function(HttpResult<T>) _then;
}

/// @nodoc
abstract class $SuccessHttpResultCopyWith<T, $Res> {
  factory $SuccessHttpResultCopyWith(SuccessHttpResult<T> value,
          $Res Function(SuccessHttpResult<T>) then) =
      _$SuccessHttpResultCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$SuccessHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements $SuccessHttpResultCopyWith<T, $Res> {
  _$SuccessHttpResultCopyWithImpl(
      SuccessHttpResult<T> _value, $Res Function(SuccessHttpResult<T>) _then)
      : super(_value, (v) => _then(v as SuccessHttpResult<T>));

  @override
  SuccessHttpResult<T> get _value => super._value as SuccessHttpResult<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(SuccessHttpResult<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessHttpResult<T> implements SuccessHttpResult<T> {
  const _$SuccessHttpResult(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'HttpResult<$T>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessHttpResult<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $SuccessHttpResultCopyWith<T, SuccessHttpResult<T>> get copyWith =>
      _$SuccessHttpResultCopyWithImpl<T, SuccessHttpResult<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessHttpResult<T> implements HttpResult<T> {
  const factory SuccessHttpResult(T value) = _$SuccessHttpResult<T>;

  T get value;
  @JsonKey(ignore: true)
  $SuccessHttpResultCopyWith<T, SuccessHttpResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotFoundHttpResultCopyWith<T, $Res> {
  factory $NotFoundHttpResultCopyWith(NotFoundHttpResult<T> value,
          $Res Function(NotFoundHttpResult<T>) then) =
      _$NotFoundHttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$NotFoundHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements $NotFoundHttpResultCopyWith<T, $Res> {
  _$NotFoundHttpResultCopyWithImpl(
      NotFoundHttpResult<T> _value, $Res Function(NotFoundHttpResult<T>) _then)
      : super(_value, (v) => _then(v as NotFoundHttpResult<T>));

  @override
  NotFoundHttpResult<T> get _value => super._value as NotFoundHttpResult<T>;
}

/// @nodoc

class _$NotFoundHttpResult<T> implements NotFoundHttpResult<T> {
  const _$NotFoundHttpResult();

  @override
  String toString() {
    return 'HttpResult<$T>.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotFoundHttpResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundHttpResult<T> implements HttpResult<T> {
  const factory NotFoundHttpResult() = _$NotFoundHttpResult<T>;
}

/// @nodoc
abstract class $UnknownHttpResultCopyWith<T, $Res> {
  factory $UnknownHttpResultCopyWith(UnknownHttpResult<T> value,
          $Res Function(UnknownHttpResult<T>) then) =
      _$UnknownHttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$UnknownHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements $UnknownHttpResultCopyWith<T, $Res> {
  _$UnknownHttpResultCopyWithImpl(
      UnknownHttpResult<T> _value, $Res Function(UnknownHttpResult<T>) _then)
      : super(_value, (v) => _then(v as UnknownHttpResult<T>));

  @override
  UnknownHttpResult<T> get _value => super._value as UnknownHttpResult<T>;
}

/// @nodoc

class _$UnknownHttpResult<T> implements UnknownHttpResult<T> {
  const _$UnknownHttpResult();

  @override
  String toString() {
    return 'HttpResult<$T>.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnknownHttpResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownHttpResult<T> implements HttpResult<T> {
  const factory UnknownHttpResult() = _$UnknownHttpResult<T>;
}
