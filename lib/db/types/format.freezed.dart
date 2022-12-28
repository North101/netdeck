// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'format.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormatData _$FormatDataFromJson(Map<String, dynamic> json) {
  return _FormatData.fromJson(json);
}

/// @nodoc
mixin _$FormatData {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormatDataCopyWith<FormatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatDataCopyWith<$Res> {
  factory $FormatDataCopyWith(
          FormatData value, $Res Function(FormatData) then) =
      _$FormatDataCopyWithImpl<$Res, FormatData>;
  @useResult
  $Res call({int id, String code, String name});
}

/// @nodoc
class _$FormatDataCopyWithImpl<$Res, $Val extends FormatData>
    implements $FormatDataCopyWith<$Res> {
  _$FormatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormatDataCopyWith<$Res>
    implements $FormatDataCopyWith<$Res> {
  factory _$$_FormatDataCopyWith(
          _$_FormatData value, $Res Function(_$_FormatData) then) =
      __$$_FormatDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String code, String name});
}

/// @nodoc
class __$$_FormatDataCopyWithImpl<$Res>
    extends _$FormatDataCopyWithImpl<$Res, _$_FormatData>
    implements _$$_FormatDataCopyWith<$Res> {
  __$$_FormatDataCopyWithImpl(
      _$_FormatData _value, $Res Function(_$_FormatData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_FormatData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormatData extends _FormatData {
  const _$_FormatData(
      {required this.id, required this.code, required this.name})
      : super._();

  factory _$_FormatData.fromJson(Map<String, dynamic> json) =>
      _$$_FormatDataFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'FormatData(id: $id, code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormatData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormatDataCopyWith<_$_FormatData> get copyWith =>
      __$$_FormatDataCopyWithImpl<_$_FormatData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormatDataToJson(
      this,
    );
  }
}

abstract class _FormatData extends FormatData {
  const factory _FormatData(
      {required final int id,
      required final String code,
      required final String name}) = _$_FormatData;
  const _FormatData._() : super._();

  factory _FormatData.fromJson(Map<String, dynamic> json) =
      _$_FormatData.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FormatDataCopyWith<_$_FormatData> get copyWith =>
      throw _privateConstructorUsedError;
}

FormatResult _$FormatResultFromJson(Map<String, dynamic> json) {
  return _FormatResult.fromJson(json);
}

/// @nodoc
mixin _$FormatResult {
  FormatData get format => throw _privateConstructorUsedError;
  RotationViewData get currentRotation => throw _privateConstructorUsedError;
  MwlViewData get activeMwl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormatResultCopyWith<FormatResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatResultCopyWith<$Res> {
  factory $FormatResultCopyWith(
          FormatResult value, $Res Function(FormatResult) then) =
      _$FormatResultCopyWithImpl<$Res, FormatResult>;
  @useResult
  $Res call(
      {FormatData format,
      RotationViewData currentRotation,
      MwlViewData activeMwl});

  $FormatDataCopyWith<$Res> get format;
}

/// @nodoc
class _$FormatResultCopyWithImpl<$Res, $Val extends FormatResult>
    implements $FormatResultCopyWith<$Res> {
  _$FormatResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? currentRotation = null,
    Object? activeMwl = null,
  }) {
    return _then(_value.copyWith(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData,
      currentRotation: null == currentRotation
          ? _value.currentRotation
          : currentRotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData,
      activeMwl: null == activeMwl
          ? _value.activeMwl
          : activeMwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormatDataCopyWith<$Res> get format {
    return $FormatDataCopyWith<$Res>(_value.format, (value) {
      return _then(_value.copyWith(format: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FormatResultCopyWith<$Res>
    implements $FormatResultCopyWith<$Res> {
  factory _$$_FormatResultCopyWith(
          _$_FormatResult value, $Res Function(_$_FormatResult) then) =
      __$$_FormatResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormatData format,
      RotationViewData currentRotation,
      MwlViewData activeMwl});

  @override
  $FormatDataCopyWith<$Res> get format;
}

/// @nodoc
class __$$_FormatResultCopyWithImpl<$Res>
    extends _$FormatResultCopyWithImpl<$Res, _$_FormatResult>
    implements _$$_FormatResultCopyWith<$Res> {
  __$$_FormatResultCopyWithImpl(
      _$_FormatResult _value, $Res Function(_$_FormatResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? currentRotation = null,
    Object? activeMwl = null,
  }) {
    return _then(_$_FormatResult(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData,
      currentRotation: null == currentRotation
          ? _value.currentRotation
          : currentRotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData,
      activeMwl: null == activeMwl
          ? _value.activeMwl
          : activeMwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormatResult implements _FormatResult {
  const _$_FormatResult(
      {required this.format,
      required this.currentRotation,
      required this.activeMwl});

  factory _$_FormatResult.fromJson(Map<String, dynamic> json) =>
      _$$_FormatResultFromJson(json);

  @override
  final FormatData format;
  @override
  final RotationViewData currentRotation;
  @override
  final MwlViewData activeMwl;

  @override
  String toString() {
    return 'FormatResult(format: $format, currentRotation: $currentRotation, activeMwl: $activeMwl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormatResult &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.currentRotation, currentRotation) ||
                other.currentRotation == currentRotation) &&
            (identical(other.activeMwl, activeMwl) ||
                other.activeMwl == activeMwl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, format, currentRotation, activeMwl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormatResultCopyWith<_$_FormatResult> get copyWith =>
      __$$_FormatResultCopyWithImpl<_$_FormatResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormatResultToJson(
      this,
    );
  }
}

abstract class _FormatResult implements FormatResult {
  const factory _FormatResult(
      {required final FormatData format,
      required final RotationViewData currentRotation,
      required final MwlViewData activeMwl}) = _$_FormatResult;

  factory _FormatResult.fromJson(Map<String, dynamic> json) =
      _$_FormatResult.fromJson;

  @override
  FormatData get format;
  @override
  RotationViewData get currentRotation;
  @override
  MwlViewData get activeMwl;
  @override
  @JsonKey(ignore: true)
  _$$_FormatResultCopyWith<_$_FormatResult> get copyWith =>
      throw _privateConstructorUsedError;
}
