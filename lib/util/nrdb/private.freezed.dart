// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitAuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitAuthStateCopyWith(
          _$InitAuthState value, $Res Function(_$InitAuthState) then) =
      __$$InitAuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class __$$InitAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitAuthState>
    implements _$$InitAuthStateCopyWith<$Res> {
  __$$InitAuthStateCopyWithImpl(
      _$InitAuthState _value, $Res Function(_$InitAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
  }) {
    return _then(_$InitAuthState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ));
  }
}

/// @nodoc

class _$InitAuthState extends InitAuthState
    with AuthStateRefMixin, RefreshTokenMixin {
  const _$InitAuthState(this.ref) : super._();

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
            (identical(other.ref, ref) || other.ref == ref));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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

abstract class InitAuthState extends AuthState
    implements AuthStateRefMixin, RefreshTokenMixin {
  const factory InitAuthState(
          final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$InitAuthState;
  const InitAuthState._() : super._();

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
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
  @useResult
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      Future<AuthState> future});
}

/// @nodoc
class __$$ConnectingAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ConnectingAuthState>
    implements _$$ConnectingAuthStateCopyWith<$Res> {
  __$$ConnectingAuthStateCopyWithImpl(
      _$ConnectingAuthState _value, $Res Function(_$ConnectingAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? future = null,
  }) {
    return _then(_$ConnectingAuthState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      null == future
          ? _value.future
          : future // ignore: cast_nullable_to_non_nullable
              as Future<AuthState>,
    ));
  }
}

/// @nodoc

class _$ConnectingAuthState extends ConnectingAuthState with AuthStateRefMixin {
  const _$ConnectingAuthState(this.ref, this.future) : super._();

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
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.future, future) || other.future == future));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, future);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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

abstract class ConnectingAuthState extends AuthState
    implements AuthStateRefMixin {
  const factory ConnectingAuthState(
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final Future<AuthState> future) = _$ConnectingAuthState;
  const ConnectingAuthState._() : super._();

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  Future<AuthState> get future;
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
  @useResult
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse? token});
}

/// @nodoc
class __$$OfflineAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OfflineAuthState>
    implements _$$OfflineAuthStateCopyWith<$Res> {
  __$$OfflineAuthStateCopyWithImpl(
      _$OfflineAuthState _value, $Res Function(_$OfflineAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? token = freezed,
  }) {
    return _then(_$OfflineAuthState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenResponse?,
    ));
  }
}

/// @nodoc

class _$OfflineAuthState extends OfflineAuthState
    with AuthStateRefMixin, LogoutMixin, RefreshTokenMixin {
  const _$OfflineAuthState(this.ref, this.token) : super._();

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
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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

abstract class OfflineAuthState extends AuthState
    implements AuthStateRefMixin, LogoutMixin, RefreshTokenMixin {
  const factory OfflineAuthState(
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final TokenResponse? token) = _$OfflineAuthState;
  const OfflineAuthState._() : super._();

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  TokenResponse? get token;
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
  @useResult
  $Res call(
      {StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      TokenResponse token,
      NrdbUser user});

  $NrdbUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$OnlineAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$OnlineAuthState>
    implements _$$OnlineAuthStateCopyWith<$Res> {
  __$$OnlineAuthStateCopyWithImpl(
      _$OnlineAuthState _value, $Res Function(_$OnlineAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_$OnlineAuthState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenResponse,
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NrdbUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NrdbUserCopyWith<$Res> get user {
    return $NrdbUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$OnlineAuthState extends OnlineAuthState
    with
        AuthStateRefMixin,
        LogoutMixin,
        RefreshTokenMixin,
        OnlineAuthStateMixin {
  const _$OnlineAuthState(this.ref, this.token, this.user) : super._();

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
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref, token, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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

abstract class OnlineAuthState extends AuthState
    implements
        AuthStateRefMixin,
        LogoutMixin,
        RefreshTokenMixin,
        OnlineAuthStateMixin {
  const factory OnlineAuthState(
      final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
      final TokenResponse token,
      final NrdbUser user) = _$OnlineAuthState;
  const OnlineAuthState._() : super._();

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  TokenResponse get token;
  NrdbUser get user;
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
  @useResult
  $Res call({StateNotifierProviderRef<AuthStateNotifier, AuthState> ref});
}

/// @nodoc
class __$$UnauthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedAuthState>
    implements _$$UnauthenticatedAuthStateCopyWith<$Res> {
  __$$UnauthenticatedAuthStateCopyWithImpl(_$UnauthenticatedAuthState _value,
      $Res Function(_$UnauthenticatedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
  }) {
    return _then(_$UnauthenticatedAuthState(
      null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as StateNotifierProviderRef<AuthStateNotifier, AuthState>,
    ));
  }
}

/// @nodoc

class _$UnauthenticatedAuthState extends UnauthenticatedAuthState
    with AuthStateRefMixin, LoginMixin {
  const _$UnauthenticatedAuthState(this.ref) : super._();

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
            (identical(other.ref, ref) || other.ref == ref));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ref);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref)?
        init,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            Future<AuthState> future)?
        connecting,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse? token)?
        offline,
    TResult? Function(
            StateNotifierProviderRef<AuthStateNotifier, AuthState> ref,
            TokenResponse token,
            NrdbUser user)?
        online,
    TResult? Function(
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
    TResult? Function(InitAuthState value)? init,
    TResult? Function(ConnectingAuthState value)? connecting,
    TResult? Function(OfflineAuthState value)? offline,
    TResult? Function(OnlineAuthState value)? online,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
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

abstract class UnauthenticatedAuthState extends AuthState
    implements AuthStateRefMixin, LoginMixin {
  const factory UnauthenticatedAuthState(
          final StateNotifierProviderRef<AuthStateNotifier, AuthState> ref) =
      _$UnauthenticatedAuthState;
  const UnauthenticatedAuthState._() : super._();

  @override
  StateNotifierProviderRef<AuthStateNotifier, AuthState> get ref;
  @override
  @JsonKey(ignore: true)
  _$$UnauthenticatedAuthStateCopyWith<_$UnauthenticatedAuthState>
      get copyWith => throw _privateConstructorUsedError;
}
