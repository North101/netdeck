// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HttpResult<T> _$HttpResultFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['type']) {
    case 'success':
      return SuccessHttpResult<T>.fromJson(json, fromJsonT);
    case 'failed':
      return FailedHttpResult<T>.fromJson(json, fromJsonT);
    case 'notFound':
      return NotFoundHttpResult<T>.fromJson(json, fromJsonT);
    case 'unknown':
      return UnknownHttpResult<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'HttpResult', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$HttpResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, T data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failed,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failed,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failed,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(FailedHttpResult<T> value) failed,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessHttpResult<T> value)? success,
    TResult? Function(FailedHttpResult<T> value)? failed,
    TResult? Function(NotFoundHttpResult<T> value)? notFound,
    TResult? Function(UnknownHttpResult<T> value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(FailedHttpResult<T> value)? failed,
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
      _$HttpResultCopyWithImpl<T, $Res, HttpResult<T>>;
}

/// @nodoc
class _$HttpResultCopyWithImpl<T, $Res, $Val extends HttpResult<T>>
    implements $HttpResultCopyWith<T, $Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessHttpResultCopyWith<T, $Res> {
  factory _$$SuccessHttpResultCopyWith(_$SuccessHttpResult<T> value,
          $Res Function(_$SuccessHttpResult<T>) then) =
      __$$SuccessHttpResultCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String versionNumber, bool success, T data, int total});
}

/// @nodoc
class __$$SuccessHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res, _$SuccessHttpResult<T>>
    implements _$$SuccessHttpResultCopyWith<T, $Res> {
  __$$SuccessHttpResultCopyWithImpl(_$SuccessHttpResult<T> _value,
      $Res Function(_$SuccessHttpResult<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionNumber = null,
    Object? success = null,
    Object? data = freezed,
    Object? total = null,
  }) {
    return _then(_$SuccessHttpResult<T>(
      null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$SuccessHttpResult<T> implements SuccessHttpResult<T> {
  const _$SuccessHttpResult(
      this.versionNumber, this.success, this.data, this.total,
      {final String? $type})
      : $type = $type ?? 'success';

  factory _$SuccessHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessHttpResultFromJson(json, fromJsonT);

  @override
  final String versionNumber;
  @override
  final bool success;
  @override
  final T data;
  @override
  final int total;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'HttpResult<$T>.success(versionNumber: $versionNumber, success: $success, data: $data, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessHttpResult<T> &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, versionNumber, success,
      const DeepCollectionEquality().hash(data), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessHttpResultCopyWith<T, _$SuccessHttpResult<T>> get copyWith =>
      __$$SuccessHttpResultCopyWithImpl<T, _$SuccessHttpResult<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, T data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failed,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return success(versionNumber, this.success, data, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failed,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
  }) {
    return success?.call(versionNumber, this.success, data, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failed,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(versionNumber, this.success, data, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(FailedHttpResult<T> value) failed,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessHttpResult<T> value)? success,
    TResult? Function(FailedHttpResult<T> value)? failed,
    TResult? Function(NotFoundHttpResult<T> value)? notFound,
    TResult? Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(FailedHttpResult<T> value)? failed,
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
  const factory SuccessHttpResult(
      final String versionNumber,
      final bool success,
      final T data,
      final int total) = _$SuccessHttpResult<T>;

  factory SuccessHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessHttpResult<T>.fromJson;

  String get versionNumber;
  bool get success;
  T get data;
  int get total;
  @JsonKey(ignore: true)
  _$$SuccessHttpResultCopyWith<T, _$SuccessHttpResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedHttpResultCopyWith<T, $Res> {
  factory _$$FailedHttpResultCopyWith(_$FailedHttpResult<T> value,
          $Res Function(_$FailedHttpResult<T>) then) =
      __$$FailedHttpResultCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String versionNumber, bool success, String msg});
}

/// @nodoc
class __$$FailedHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res, _$FailedHttpResult<T>>
    implements _$$FailedHttpResultCopyWith<T, $Res> {
  __$$FailedHttpResultCopyWithImpl(
      _$FailedHttpResult<T> _value, $Res Function(_$FailedHttpResult<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionNumber = null,
    Object? success = null,
    Object? msg = null,
  }) {
    return _then(_$FailedHttpResult<T>(
      null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$FailedHttpResult<T> implements FailedHttpResult<T> {
  const _$FailedHttpResult(this.versionNumber, this.success, this.msg,
      {final String? $type})
      : $type = $type ?? 'failed';

  factory _$FailedHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$FailedHttpResultFromJson(json, fromJsonT);

  @override
  final String versionNumber;
  @override
  final bool success;
  @override
  final String msg;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'HttpResult<$T>.failed(versionNumber: $versionNumber, success: $success, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedHttpResult<T> &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, versionNumber, success, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedHttpResultCopyWith<T, _$FailedHttpResult<T>> get copyWith =>
      __$$FailedHttpResultCopyWithImpl<T, _$FailedHttpResult<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, T data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failed,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return failed(versionNumber, this.success, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failed,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
  }) {
    return failed?.call(versionNumber, this.success, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failed,
    TResult Function()? notFound,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(versionNumber, this.success, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessHttpResult<T> value) success,
    required TResult Function(FailedHttpResult<T> value) failed,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessHttpResult<T> value)? success,
    TResult? Function(FailedHttpResult<T> value)? failed,
    TResult? Function(NotFoundHttpResult<T> value)? notFound,
    TResult? Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(FailedHttpResult<T> value)? failed,
    TResult Function(NotFoundHttpResult<T> value)? notFound,
    TResult Function(UnknownHttpResult<T> value)? unknown,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedHttpResult<T> implements HttpResult<T> {
  const factory FailedHttpResult(
          final String versionNumber, final bool success, final String msg) =
      _$FailedHttpResult<T>;

  factory FailedHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$FailedHttpResult<T>.fromJson;

  String get versionNumber;
  bool get success;
  String get msg;
  @JsonKey(ignore: true)
  _$$FailedHttpResultCopyWith<T, _$FailedHttpResult<T>> get copyWith =>
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
    extends _$HttpResultCopyWithImpl<T, $Res, _$NotFoundHttpResult<T>>
    implements _$$NotFoundHttpResultCopyWith<T, $Res> {
  __$$NotFoundHttpResultCopyWithImpl(_$NotFoundHttpResult<T> _value,
      $Res Function(_$NotFoundHttpResult<T>) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$NotFoundHttpResult<T> implements NotFoundHttpResult<T> {
  const _$NotFoundHttpResult({final String? $type})
      : $type = $type ?? 'notFound';

  factory _$NotFoundHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$NotFoundHttpResultFromJson(json, fromJsonT);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'HttpResult<$T>.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundHttpResult<T>);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, T data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failed,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failed,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failed,
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
    required TResult Function(FailedHttpResult<T> value) failed,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessHttpResult<T> value)? success,
    TResult? Function(FailedHttpResult<T> value)? failed,
    TResult? Function(NotFoundHttpResult<T> value)? notFound,
    TResult? Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(FailedHttpResult<T> value)? failed,
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

  factory NotFoundHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$NotFoundHttpResult<T>.fromJson;
}

/// @nodoc
abstract class _$$UnknownHttpResultCopyWith<T, $Res> {
  factory _$$UnknownHttpResultCopyWith(_$UnknownHttpResult<T> value,
          $Res Function(_$UnknownHttpResult<T>) then) =
      __$$UnknownHttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UnknownHttpResultCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res, _$UnknownHttpResult<T>>
    implements _$$UnknownHttpResultCopyWith<T, $Res> {
  __$$UnknownHttpResultCopyWithImpl(_$UnknownHttpResult<T> _value,
      $Res Function(_$UnknownHttpResult<T>) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$UnknownHttpResult<T> implements UnknownHttpResult<T> {
  const _$UnknownHttpResult({final String? $type}) : $type = $type ?? 'unknown';

  factory _$UnknownHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$UnknownHttpResultFromJson(json, fromJsonT);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'HttpResult<$T>.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownHttpResult<T>);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, T data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failed,
    required TResult Function() notFound,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failed,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String versionNumber, bool success, T data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failed,
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
    required TResult Function(FailedHttpResult<T> value) failed,
    required TResult Function(NotFoundHttpResult<T> value) notFound,
    required TResult Function(UnknownHttpResult<T> value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessHttpResult<T> value)? success,
    TResult? Function(FailedHttpResult<T> value)? failed,
    TResult? Function(NotFoundHttpResult<T> value)? notFound,
    TResult? Function(UnknownHttpResult<T> value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessHttpResult<T> value)? success,
    TResult Function(FailedHttpResult<T> value)? failed,
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

  factory UnknownHttpResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$UnknownHttpResult<T>.fromJson;
}

NrdbDeck _$NrdbDeckFromJson(Map<String, dynamic> json) {
  return _NrdbDeck.fromJson(json);
}

/// @nodoc
mixin _$NrdbDeck {
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get mwlCode => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;
  DateTime get dateUpdate => throw _privateConstructorUsedError;
  Map<String, int> get cards => throw _privateConstructorUsedError;
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NrdbDeckCopyWith<NrdbDeck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NrdbDeckCopyWith<$Res> {
  factory $NrdbDeckCopyWith(NrdbDeck value, $Res Function(NrdbDeck) then) =
      _$NrdbDeckCopyWithImpl<$Res, NrdbDeck>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          String id,
      String name,
      String description,
      String? mwlCode,
      DateTime dateCreation,
      DateTime dateUpdate,
      Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          List<String> tags});
}

/// @nodoc
class _$NrdbDeckCopyWithImpl<$Res, $Val extends NrdbDeck>
    implements $NrdbDeckCopyWith<$Res> {
  _$NrdbDeckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? mwlCode = freezed,
    Object? dateCreation = null,
    Object? dateUpdate = null,
    Object? cards = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdate: null == dateUpdate
          ? _value.dateUpdate
          : dateUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NrdbDeckCopyWith<$Res> implements $NrdbDeckCopyWith<$Res> {
  factory _$$_NrdbDeckCopyWith(
          _$_NrdbDeck value, $Res Function(_$_NrdbDeck) then) =
      __$$_NrdbDeckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          String id,
      String name,
      String description,
      String? mwlCode,
      DateTime dateCreation,
      DateTime dateUpdate,
      Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          List<String> tags});
}

/// @nodoc
class __$$_NrdbDeckCopyWithImpl<$Res>
    extends _$NrdbDeckCopyWithImpl<$Res, _$_NrdbDeck>
    implements _$$_NrdbDeckCopyWith<$Res> {
  __$$_NrdbDeckCopyWithImpl(
      _$_NrdbDeck _value, $Res Function(_$_NrdbDeck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? mwlCode = freezed,
    Object? dateCreation = null,
    Object? dateUpdate = null,
    Object? cards = null,
    Object? tags = null,
  }) {
    return _then(_$_NrdbDeck(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdate: null == dateUpdate
          ? _value.dateUpdate
          : dateUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NrdbDeck implements _NrdbDeck {
  const _$_NrdbDeck(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          required this.id,
      required this.name,
      required this.description,
      required this.mwlCode,
      required this.dateCreation,
      required this.dateUpdate,
      required final Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          required final List<String> tags})
      : _cards = cards,
        _tags = tags;

  factory _$_NrdbDeck.fromJson(Map<String, dynamic> json) =>
      _$$_NrdbDeckFromJson(json);

  @override
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? mwlCode;
  @override
  final DateTime dateCreation;
  @override
  final DateTime dateUpdate;
  final Map<String, int> _cards;
  @override
  Map<String, int> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  final List<String> _tags;
  @override
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'NrdbDeck(id: $id, name: $name, description: $description, mwlCode: $mwlCode, dateCreation: $dateCreation, dateUpdate: $dateUpdate, cards: $cards, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NrdbDeck &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mwlCode, mwlCode) || other.mwlCode == mwlCode) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.dateUpdate, dateUpdate) ||
                other.dateUpdate == dateUpdate) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      mwlCode,
      dateCreation,
      dateUpdate,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NrdbDeckCopyWith<_$_NrdbDeck> get copyWith =>
      __$$_NrdbDeckCopyWithImpl<_$_NrdbDeck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NrdbDeckToJson(
      this,
    );
  }
}

abstract class _NrdbDeck implements NrdbDeck {
  const factory _NrdbDeck(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          required final String id,
      required final String name,
      required final String description,
      required final String? mwlCode,
      required final DateTime dateCreation,
      required final DateTime dateUpdate,
      required final Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          required final List<String> tags}) = _$_NrdbDeck;

  factory _NrdbDeck.fromJson(Map<String, dynamic> json) = _$_NrdbDeck.fromJson;

  @override
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get mwlCode;
  @override
  DateTime get dateCreation;
  @override
  DateTime get dateUpdate;
  @override
  Map<String, int> get cards;
  @override
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_NrdbDeckCopyWith<_$_NrdbDeck> get copyWith =>
      throw _privateConstructorUsedError;
}

NrdbUser _$NrdbUserFromJson(Map<String, dynamic> json) {
  return _NrdbUser.fromJson(json);
}

/// @nodoc
mixin _$NrdbUser {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get reputation => throw _privateConstructorUsedError;
  bool get sharing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NrdbUserCopyWith<NrdbUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NrdbUserCopyWith<$Res> {
  factory $NrdbUserCopyWith(NrdbUser value, $Res Function(NrdbUser) then) =
      _$NrdbUserCopyWithImpl<$Res, NrdbUser>;
  @useResult
  $Res call(
      {int id, String username, String email, int reputation, bool sharing});
}

/// @nodoc
class _$NrdbUserCopyWithImpl<$Res, $Val extends NrdbUser>
    implements $NrdbUserCopyWith<$Res> {
  _$NrdbUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? reputation = null,
    Object? sharing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      reputation: null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      sharing: null == sharing
          ? _value.sharing
          : sharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NrdbUserCopyWith<$Res> implements $NrdbUserCopyWith<$Res> {
  factory _$$_NrdbUserCopyWith(
          _$_NrdbUser value, $Res Function(_$_NrdbUser) then) =
      __$$_NrdbUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String username, String email, int reputation, bool sharing});
}

/// @nodoc
class __$$_NrdbUserCopyWithImpl<$Res>
    extends _$NrdbUserCopyWithImpl<$Res, _$_NrdbUser>
    implements _$$_NrdbUserCopyWith<$Res> {
  __$$_NrdbUserCopyWithImpl(
      _$_NrdbUser _value, $Res Function(_$_NrdbUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? reputation = null,
    Object? sharing = null,
  }) {
    return _then(_$_NrdbUser(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      null == sharing
          ? _value.sharing
          : sharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NrdbUser implements _NrdbUser {
  const _$_NrdbUser(
      this.id, this.username, this.email, this.reputation, this.sharing);

  factory _$_NrdbUser.fromJson(Map<String, dynamic> json) =>
      _$$_NrdbUserFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final int reputation;
  @override
  final bool sharing;

  @override
  String toString() {
    return 'NrdbUser(id: $id, username: $username, email: $email, reputation: $reputation, sharing: $sharing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NrdbUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.reputation, reputation) ||
                other.reputation == reputation) &&
            (identical(other.sharing, sharing) || other.sharing == sharing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, reputation, sharing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NrdbUserCopyWith<_$_NrdbUser> get copyWith =>
      __$$_NrdbUserCopyWithImpl<_$_NrdbUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NrdbUserToJson(
      this,
    );
  }
}

abstract class _NrdbUser implements NrdbUser {
  const factory _NrdbUser(
      final int id,
      final String username,
      final String email,
      final int reputation,
      final bool sharing) = _$_NrdbUser;

  factory _NrdbUser.fromJson(Map<String, dynamic> json) = _$_NrdbUser.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  int get reputation;
  @override
  bool get sharing;
  @override
  @JsonKey(ignore: true)
  _$$_NrdbUserCopyWith<_$_NrdbUser> get copyWith =>
      throw _privateConstructorUsedError;
}
