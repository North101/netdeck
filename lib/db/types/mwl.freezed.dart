// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mwl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MwlData _$MwlDataFromJson(Map<String, dynamic> json) {
  return _MwlData.fromJson(json);
}

/// @nodoc
mixin _$MwlData {
  String get code => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  int? get runnerPoints => throw _privateConstructorUsedError;
  int? get corpPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MwlDataCopyWith<MwlData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MwlDataCopyWith<$Res> {
  factory $MwlDataCopyWith(MwlData value, $Res Function(MwlData) then) =
      _$MwlDataCopyWithImpl<$Res, MwlData>;
  @useResult
  $Res call(
      {String code,
      String formatCode,
      String name,
      DateTime? dateStart,
      int? runnerPoints,
      int? corpPoints});
}

/// @nodoc
class _$MwlDataCopyWithImpl<$Res, $Val extends MwlData>
    implements $MwlDataCopyWith<$Res> {
  _$MwlDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MwlDataCopyWith<$Res> implements $MwlDataCopyWith<$Res> {
  factory _$$_MwlDataCopyWith(
          _$_MwlData value, $Res Function(_$_MwlData) then) =
      __$$_MwlDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String formatCode,
      String name,
      DateTime? dateStart,
      int? runnerPoints,
      int? corpPoints});
}

/// @nodoc
class __$$_MwlDataCopyWithImpl<$Res>
    extends _$MwlDataCopyWithImpl<$Res, _$_MwlData>
    implements _$$_MwlDataCopyWith<$Res> {
  __$$_MwlDataCopyWithImpl(_$_MwlData _value, $Res Function(_$_MwlData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
  }) {
    return _then(_$_MwlData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MwlData extends _MwlData {
  const _$_MwlData(
      {required this.code,
      required this.formatCode,
      required this.name,
      required this.dateStart,
      required this.runnerPoints,
      required this.corpPoints})
      : super._();

  factory _$_MwlData.fromJson(Map<String, dynamic> json) =>
      _$$_MwlDataFromJson(json);

  @override
  final String code;
  @override
  final String formatCode;
  @override
  final String name;
  @override
  final DateTime? dateStart;
  @override
  final int? runnerPoints;
  @override
  final int? corpPoints;

  @override
  String toString() {
    return 'MwlData(code: $code, formatCode: $formatCode, name: $name, dateStart: $dateStart, runnerPoints: $runnerPoints, corpPoints: $corpPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MwlData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.runnerPoints, runnerPoints) ||
                other.runnerPoints == runnerPoints) &&
            (identical(other.corpPoints, corpPoints) ||
                other.corpPoints == corpPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, formatCode, name, dateStart, runnerPoints, corpPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MwlDataCopyWith<_$_MwlData> get copyWith =>
      __$$_MwlDataCopyWithImpl<_$_MwlData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MwlDataToJson(
      this,
    );
  }
}

abstract class _MwlData extends MwlData {
  const factory _MwlData(
      {required final String code,
      required final String formatCode,
      required final String name,
      required final DateTime? dateStart,
      required final int? runnerPoints,
      required final int? corpPoints}) = _$_MwlData;
  const _MwlData._() : super._();

  factory _MwlData.fromJson(Map<String, dynamic> json) = _$_MwlData.fromJson;

  @override
  String get code;
  @override
  String get formatCode;
  @override
  String get name;
  @override
  DateTime? get dateStart;
  @override
  int? get runnerPoints;
  @override
  int? get corpPoints;
  @override
  @JsonKey(ignore: true)
  _$$_MwlDataCopyWith<_$_MwlData> get copyWith =>
      throw _privateConstructorUsedError;
}

MwlViewData _$MwlViewDataFromJson(Map<String, dynamic> json) {
  return _MwlViewData.fromJson(json);
}

/// @nodoc
mixin _$MwlViewData {
  String get code => throw _privateConstructorUsedError;
  String? get mwlCode => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  int? get runnerPoints => throw _privateConstructorUsedError;
  int? get corpPoints => throw _privateConstructorUsedError;
  MwlType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MwlViewDataCopyWith<MwlViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MwlViewDataCopyWith<$Res> {
  factory $MwlViewDataCopyWith(
          MwlViewData value, $Res Function(MwlViewData) then) =
      _$MwlViewDataCopyWithImpl<$Res, MwlViewData>;
  @useResult
  $Res call(
      {String code,
      String? mwlCode,
      String formatCode,
      String name,
      DateTime? dateStart,
      int? runnerPoints,
      int? corpPoints,
      MwlType? type});
}

/// @nodoc
class _$MwlViewDataCopyWithImpl<$Res, $Val extends MwlViewData>
    implements $MwlViewDataCopyWith<$Res> {
  _$MwlViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? mwlCode = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MwlType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MwlViewDataCopyWith<$Res>
    implements $MwlViewDataCopyWith<$Res> {
  factory _$$_MwlViewDataCopyWith(
          _$_MwlViewData value, $Res Function(_$_MwlViewData) then) =
      __$$_MwlViewDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String? mwlCode,
      String formatCode,
      String name,
      DateTime? dateStart,
      int? runnerPoints,
      int? corpPoints,
      MwlType? type});
}

/// @nodoc
class __$$_MwlViewDataCopyWithImpl<$Res>
    extends _$MwlViewDataCopyWithImpl<$Res, _$_MwlViewData>
    implements _$$_MwlViewDataCopyWith<$Res> {
  __$$_MwlViewDataCopyWithImpl(
      _$_MwlViewData _value, $Res Function(_$_MwlViewData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? mwlCode = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_MwlViewData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MwlType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MwlViewData extends _MwlViewData {
  const _$_MwlViewData(
      {required this.code,
      required this.mwlCode,
      required this.formatCode,
      required this.name,
      required this.dateStart,
      required this.runnerPoints,
      required this.corpPoints,
      required this.type})
      : super._();

  factory _$_MwlViewData.fromJson(Map<String, dynamic> json) =>
      _$$_MwlViewDataFromJson(json);

  @override
  final String code;
  @override
  final String? mwlCode;
  @override
  final String formatCode;
  @override
  final String name;
  @override
  final DateTime? dateStart;
  @override
  final int? runnerPoints;
  @override
  final int? corpPoints;
  @override
  final MwlType? type;

  @override
  String toString() {
    return 'MwlViewData(code: $code, mwlCode: $mwlCode, formatCode: $formatCode, name: $name, dateStart: $dateStart, runnerPoints: $runnerPoints, corpPoints: $corpPoints, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MwlViewData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.mwlCode, mwlCode) || other.mwlCode == mwlCode) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.runnerPoints, runnerPoints) ||
                other.runnerPoints == runnerPoints) &&
            (identical(other.corpPoints, corpPoints) ||
                other.corpPoints == corpPoints) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, mwlCode, formatCode, name,
      dateStart, runnerPoints, corpPoints, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MwlViewDataCopyWith<_$_MwlViewData> get copyWith =>
      __$$_MwlViewDataCopyWithImpl<_$_MwlViewData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MwlViewDataToJson(
      this,
    );
  }
}

abstract class _MwlViewData extends MwlViewData {
  const factory _MwlViewData(
      {required final String code,
      required final String? mwlCode,
      required final String formatCode,
      required final String name,
      required final DateTime? dateStart,
      required final int? runnerPoints,
      required final int? corpPoints,
      required final MwlType? type}) = _$_MwlViewData;
  const _MwlViewData._() : super._();

  factory _MwlViewData.fromJson(Map<String, dynamic> json) =
      _$_MwlViewData.fromJson;

  @override
  String get code;
  @override
  String? get mwlCode;
  @override
  String get formatCode;
  @override
  String get name;
  @override
  DateTime? get dateStart;
  @override
  int? get runnerPoints;
  @override
  int? get corpPoints;
  @override
  MwlType? get type;
  @override
  @JsonKey(ignore: true)
  _$$_MwlViewDataCopyWith<_$_MwlViewData> get copyWith =>
      throw _privateConstructorUsedError;
}
