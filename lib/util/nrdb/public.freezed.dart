// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'public.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResult {
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated,
            List<Map<String, dynamic>> data, Map<String, dynamic> info)
        modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiResultCopyWith<ApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<$Res> {
  factory $ApiResultCopyWith(ApiResult value, $Res Function(ApiResult) then) =
      _$ApiResultCopyWithImpl<$Res>;
  $Res call({DateTime lastUpdated});
}

/// @nodoc
class _$ApiResultCopyWithImpl<$Res> implements $ApiResultCopyWith<$Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  final ApiResult _value;
  // ignore: unused_field
  final $Res Function(ApiResult) _then;

  @override
  $Res call({
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$UnmodifiedApiResultCopyWith<$Res>
    implements $ApiResultCopyWith<$Res> {
  factory _$$UnmodifiedApiResultCopyWith(_$UnmodifiedApiResult value,
          $Res Function(_$UnmodifiedApiResult) then) =
      __$$UnmodifiedApiResultCopyWithImpl<$Res>;
  @override
  $Res call({DateTime lastUpdated});
}

/// @nodoc
class __$$UnmodifiedApiResultCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res>
    implements _$$UnmodifiedApiResultCopyWith<$Res> {
  __$$UnmodifiedApiResultCopyWithImpl(
      _$UnmodifiedApiResult _value, $Res Function(_$UnmodifiedApiResult) _then)
      : super(_value, (v) => _then(v as _$UnmodifiedApiResult));

  @override
  _$UnmodifiedApiResult get _value => super._value as _$UnmodifiedApiResult;

  @override
  $Res call({
    Object? lastUpdated = freezed,
  }) {
    return _then(_$UnmodifiedApiResult(
      lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UnmodifiedApiResult implements UnmodifiedApiResult {
  const _$UnmodifiedApiResult(this.lastUpdated);

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ApiResult.unmodified(lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnmodifiedApiResult &&
            const DeepCollectionEquality()
                .equals(other.lastUpdated, lastUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lastUpdated));

  @JsonKey(ignore: true)
  @override
  _$$UnmodifiedApiResultCopyWith<_$UnmodifiedApiResult> get copyWith =>
      __$$UnmodifiedApiResultCopyWithImpl<_$UnmodifiedApiResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated,
            List<Map<String, dynamic>> data, Map<String, dynamic> info)
        modified,
  }) {
    return unmodified(lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
  }) {
    return unmodified?.call(lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
    required TResult orElse(),
  }) {
    if (unmodified != null) {
      return unmodified(lastUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) {
    return unmodified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
  }) {
    return unmodified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) {
    if (unmodified != null) {
      return unmodified(this);
    }
    return orElse();
  }
}

abstract class UnmodifiedApiResult implements ApiResult {
  const factory UnmodifiedApiResult(final DateTime lastUpdated) =
      _$UnmodifiedApiResult;

  @override
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$UnmodifiedApiResultCopyWith<_$UnmodifiedApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifiedApiResultCopyWith<$Res>
    implements $ApiResultCopyWith<$Res> {
  factory _$$ModifiedApiResultCopyWith(
          _$ModifiedApiResult value, $Res Function(_$ModifiedApiResult) then) =
      __$$ModifiedApiResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime lastUpdated,
      List<Map<String, dynamic>> data,
      Map<String, dynamic> info});
}

/// @nodoc
class __$$ModifiedApiResultCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res>
    implements _$$ModifiedApiResultCopyWith<$Res> {
  __$$ModifiedApiResultCopyWithImpl(
      _$ModifiedApiResult _value, $Res Function(_$ModifiedApiResult) _then)
      : super(_value, (v) => _then(v as _$ModifiedApiResult));

  @override
  _$ModifiedApiResult get _value => super._value as _$ModifiedApiResult;

  @override
  $Res call({
    Object? lastUpdated = freezed,
    Object? data = freezed,
    Object? info = freezed,
  }) {
    return _then(_$ModifiedApiResult(
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      info: info == freezed
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$ModifiedApiResult implements ModifiedApiResult {
  const _$ModifiedApiResult(
      {required this.lastUpdated,
      required final List<Map<String, dynamic>> data,
      required final Map<String, dynamic> info})
      : _data = data,
        _info = info;

  @override
  final DateTime lastUpdated;
  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final Map<String, dynamic> _info;
  @override
  Map<String, dynamic> get info {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_info);
  }

  @override
  String toString() {
    return 'ApiResult.modified(lastUpdated: $lastUpdated, data: $data, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifiedApiResult &&
            const DeepCollectionEquality()
                .equals(other.lastUpdated, lastUpdated) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastUpdated),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_info));

  @JsonKey(ignore: true)
  @override
  _$$ModifiedApiResultCopyWith<_$ModifiedApiResult> get copyWith =>
      __$$ModifiedApiResultCopyWithImpl<_$ModifiedApiResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated,
            List<Map<String, dynamic>> data, Map<String, dynamic> info)
        modified,
  }) {
    return modified(lastUpdated, data, info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
  }) {
    return modified?.call(lastUpdated, data, info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, List<Map<String, dynamic>> data,
            Map<String, dynamic> info)?
        modified,
    required TResult orElse(),
  }) {
    if (modified != null) {
      return modified(lastUpdated, data, info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) {
    return modified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
  }) {
    return modified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) {
    if (modified != null) {
      return modified(this);
    }
    return orElse();
  }
}

abstract class ModifiedApiResult implements ApiResult {
  const factory ModifiedApiResult(
      {required final DateTime lastUpdated,
      required final List<Map<String, dynamic>> data,
      required final Map<String, dynamic> info}) = _$ModifiedApiResult;

  @override
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get data => throw _privateConstructorUsedError;
  Map<String, dynamic> get info => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$ModifiedApiResultCopyWith<_$ModifiedApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}
