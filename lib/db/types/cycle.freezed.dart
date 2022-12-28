// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CycleData _$CycleDataFromJson(Map<String, dynamic> json) {
  return _CycleData.fromJson(json);
}

/// @nodoc
mixin _$CycleData {
  String get code => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  bool get rotated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleDataCopyWith<CycleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleDataCopyWith<$Res> {
  factory $CycleDataCopyWith(CycleData value, $Res Function(CycleData) then) =
      _$CycleDataCopyWithImpl<$Res, CycleData>;
  @useResult
  $Res call({String code, int position, String name, int size, bool rotated});
}

/// @nodoc
class _$CycleDataCopyWithImpl<$Res, $Val extends CycleData>
    implements $CycleDataCopyWith<$Res> {
  _$CycleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? position = null,
    Object? name = null,
    Object? size = null,
    Object? rotated = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      rotated: null == rotated
          ? _value.rotated
          : rotated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleDataCopyWith<$Res> implements $CycleDataCopyWith<$Res> {
  factory _$$_CycleDataCopyWith(
          _$_CycleData value, $Res Function(_$_CycleData) then) =
      __$$_CycleDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, int position, String name, int size, bool rotated});
}

/// @nodoc
class __$$_CycleDataCopyWithImpl<$Res>
    extends _$CycleDataCopyWithImpl<$Res, _$_CycleData>
    implements _$$_CycleDataCopyWith<$Res> {
  __$$_CycleDataCopyWithImpl(
      _$_CycleData _value, $Res Function(_$_CycleData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? position = null,
    Object? name = null,
    Object? size = null,
    Object? rotated = null,
  }) {
    return _then(_$_CycleData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      rotated: null == rotated
          ? _value.rotated
          : rotated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CycleData extends _CycleData {
  const _$_CycleData(
      {required this.code,
      required this.position,
      required this.name,
      required this.size,
      required this.rotated})
      : super._();

  factory _$_CycleData.fromJson(Map<String, dynamic> json) =>
      _$$_CycleDataFromJson(json);

  @override
  final String code;
  @override
  final int position;
  @override
  final String name;
  @override
  final int size;
  @override
  final bool rotated;

  @override
  String toString() {
    return 'CycleData(code: $code, position: $position, name: $name, size: $size, rotated: $rotated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CycleData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.rotated, rotated) || other.rotated == rotated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, position, name, size, rotated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleDataCopyWith<_$_CycleData> get copyWith =>
      __$$_CycleDataCopyWithImpl<_$_CycleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CycleDataToJson(
      this,
    );
  }
}

abstract class _CycleData extends CycleData {
  const factory _CycleData(
      {required final String code,
      required final int position,
      required final String name,
      required final int size,
      required final bool rotated}) = _$_CycleData;
  const _CycleData._() : super._();

  factory _CycleData.fromJson(Map<String, dynamic> json) =
      _$_CycleData.fromJson;

  @override
  String get code;
  @override
  int get position;
  @override
  String get name;
  @override
  int get size;
  @override
  bool get rotated;
  @override
  @JsonKey(ignore: true)
  _$$_CycleDataCopyWith<_$_CycleData> get copyWith =>
      throw _privateConstructorUsedError;
}
