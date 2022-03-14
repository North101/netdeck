// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'private.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$InitAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitAuthStateCopyWith(
          _$InitAuthState value, $Res Function(_$InitAuthState) then) =
      __$$InitAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class __$$InitAuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$InitAuthStateCopyWith<$Res> {
  __$$InitAuthStateCopyWithImpl(
      _$InitAuthState _value, $Res Function(_$InitAuthState) _then)
      : super(_value, (v) => _then(v as _$InitAuthState));

  @override
  _$InitAuthState get _value => super._value as _$InitAuthState;

  @override
  $Res call({
    Object? ref = freezed,
  }) {
    return _then(_$InitAuthState(
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
            other is _$InitAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ref));

  @JsonKey(ignore: true)
  @override
  _$$InitAuthStateCopyWith<_$InitAuthState> get copyWith =>
      __$$InitAuthStateCopyWithImpl<_$InitAuthState>(this, _$identity);

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
          final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$InitAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$InitAuthStateCopyWith<_$InitAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectingAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$ConnectingAuthStateCopyWith(_$ConnectingAuthState value,
          $Res Function(_$ConnectingAuthState) then) =
      __$$ConnectingAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      Future<AuthState> future});
}

/// @nodoc
class __$$ConnectingAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$ConnectingAuthStateCopyWith<$Res> {
  __$$ConnectingAuthStateCopyWithImpl(
      _$ConnectingAuthState _value, $Res Function(_$ConnectingAuthState) _then)
      : super(_value, (v) => _then(v as _$ConnectingAuthState));

  @override
  _$ConnectingAuthState get _value => super._value as _$ConnectingAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? future = freezed,
  }) {
    return _then(_$ConnectingAuthState(
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
            other is _$ConnectingAuthState &&
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
  _$$ConnectingAuthStateCopyWith<_$ConnectingAuthState> get copyWith =>
      __$$ConnectingAuthStateCopyWithImpl<_$ConnectingAuthState>(
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
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final Future<AuthState> future) = _$ConnectingAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;
  Future<AuthState> get future => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$ConnectingAuthStateCopyWith<_$ConnectingAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OfflineAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$OfflineAuthStateCopyWith(
          _$OfflineAuthState value, $Res Function(_$OfflineAuthState) then) =
      __$$OfflineAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse? token});
}

/// @nodoc
class __$$OfflineAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$OfflineAuthStateCopyWith<$Res> {
  __$$OfflineAuthStateCopyWithImpl(
      _$OfflineAuthState _value, $Res Function(_$OfflineAuthState) _then)
      : super(_value, (v) => _then(v as _$OfflineAuthState));

  @override
  _$OfflineAuthState get _value => super._value as _$OfflineAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? token = freezed,
  }) {
    return _then(_$OfflineAuthState(
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
            other is _$OfflineAuthState &&
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
  _$$OfflineAuthStateCopyWith<_$OfflineAuthState> get copyWith =>
      __$$OfflineAuthStateCopyWithImpl<_$OfflineAuthState>(this, _$identity);

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
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final TokenResponse? token) = _$OfflineAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;
  TokenResponse? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$OfflineAuthStateCopyWith<_$OfflineAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnlineAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$OnlineAuthStateCopyWith(
          _$OnlineAuthState value, $Res Function(_$OnlineAuthState) then) =
      __$$OnlineAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse token,
      NrdbUser user});
}

/// @nodoc
class __$$OnlineAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$OnlineAuthStateCopyWith<$Res> {
  __$$OnlineAuthStateCopyWithImpl(
      _$OnlineAuthState _value, $Res Function(_$OnlineAuthState) _then)
      : super(_value, (v) => _then(v as _$OnlineAuthState));

  @override
  _$OnlineAuthState get _value => super._value as _$OnlineAuthState;

  @override
  $Res call({
    Object? ref = freezed,
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_$OnlineAuthState(
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
            other is _$OnlineAuthState &&
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
  _$$OnlineAuthStateCopyWith<_$OnlineAuthState> get copyWith =>
      __$$OnlineAuthStateCopyWithImpl<_$OnlineAuthState>(this, _$identity);

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
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final TokenResponse token,
      final NrdbUser user) = _$OnlineAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;
  TokenResponse get token => throw _privateConstructorUsedError;
  NrdbUser get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$OnlineAuthStateCopyWith<_$OnlineAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$UnauthenticatedAuthStateCopyWith(_$UnauthenticatedAuthState value,
          $Res Function(_$UnauthenticatedAuthState) then) =
      __$$UnauthenticatedAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class __$$UnauthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$UnauthenticatedAuthStateCopyWith<$Res> {
  __$$UnauthenticatedAuthStateCopyWithImpl(_$UnauthenticatedAuthState _value,
      $Res Function(_$UnauthenticatedAuthState) _then)
      : super(_value, (v) => _then(v as _$UnauthenticatedAuthState));

  @override
  _$UnauthenticatedAuthState get _value =>
      super._value as _$UnauthenticatedAuthState;

  @override
  $Res call({
    Object? ref = freezed,
  }) {
    return _then(_$UnauthenticatedAuthState(
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
            other is _$UnauthenticatedAuthState &&
            const DeepCollectionEquality().equals(other.ref, ref));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ref));

  @JsonKey(ignore: true)
  @override
  _$$UnauthenticatedAuthStateCopyWith<_$UnauthenticatedAuthState>
      get copyWith =>
          __$$UnauthenticatedAuthStateCopyWithImpl<_$UnauthenticatedAuthState>(
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
          final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$UnauthenticatedAuthState;

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$UnauthenticatedAuthStateCopyWith<_$UnauthenticatedAuthState>
      get copyWith => throw _privateConstructorUsedError;
}

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
abstract class _$$SuccessHttpResultCopyWith<T, $Res> {
  factory _$$SuccessHttpResultCopyWith(_$SuccessHttpResult<T> value,
          $Res Function(_$SuccessHttpResult<T>) then) =
      __$$SuccessHttpResultCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class __$$SuccessHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements _$$SuccessHttpResultCopyWith<T, $Res> {
  __$$SuccessHttpResultCopyWithImpl(_$SuccessHttpResult<T> _value,
      $Res Function(_$SuccessHttpResult<T>) _then)
      : super(_value, (v) => _then(v as _$SuccessHttpResult<T>));

  @override
  _$SuccessHttpResult<T> get _value => super._value as _$SuccessHttpResult<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SuccessHttpResult<T>(
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
            other is _$SuccessHttpResult<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$SuccessHttpResultCopyWith<T, _$SuccessHttpResult<T>> get copyWith =>
      __$$SuccessHttpResultCopyWithImpl<T, _$SuccessHttpResult<T>>(
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
  const factory SuccessHttpResult(final T value) = _$SuccessHttpResult<T>;

  T get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessHttpResultCopyWith<T, _$SuccessHttpResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundHttpResultCopyWith<T, $Res> {
  factory _$$NotFoundHttpResultCopyWith(_$NotFoundHttpResult<T> value,
          $Res Function(_$NotFoundHttpResult<T>) then) =
      __$$NotFoundHttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NotFoundHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements _$$NotFoundHttpResultCopyWith<T, $Res> {
  __$$NotFoundHttpResultCopyWithImpl(_$NotFoundHttpResult<T> _value,
      $Res Function(_$NotFoundHttpResult<T>) _then)
      : super(_value, (v) => _then(v as _$NotFoundHttpResult<T>));

  @override
  _$NotFoundHttpResult<T> get _value => super._value as _$NotFoundHttpResult<T>;
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
        (other.runtimeType == runtimeType && other is _$NotFoundHttpResult<T>);
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
abstract class _$$UnknownHttpResultCopyWith<T, $Res> {
  factory _$$UnknownHttpResultCopyWith(_$UnknownHttpResult<T> value,
          $Res Function(_$UnknownHttpResult<T>) then) =
      __$$UnknownHttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnknownHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements _$$UnknownHttpResultCopyWith<T, $Res> {
  __$$UnknownHttpResultCopyWithImpl(_$UnknownHttpResult<T> _value,
      $Res Function(_$UnknownHttpResult<T>) _then)
      : super(_value, (v) => _then(v as _$UnknownHttpResult<T>));

  @override
  _$UnknownHttpResult<T> get _value => super._value as _$UnknownHttpResult<T>;
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
        (other.runtimeType == runtimeType && other is _$UnknownHttpResult<T>);
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
