// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RotationData _$RotationDataFromJson(Map<String, dynamic> json) {
  return _RotationData.fromJson(json);
}

/// @nodoc
mixin _$RotationData {
  String get code => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RotationDataCopyWith<RotationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationDataCopyWith<$Res> {
  factory $RotationDataCopyWith(
          RotationData value, $Res Function(RotationData) then) =
      _$RotationDataCopyWithImpl<$Res, RotationData>;
  @useResult
  $Res call({String code, String formatCode, String name, DateTime? dateStart});
}

/// @nodoc
class _$RotationDataCopyWithImpl<$Res, $Val extends RotationData>
    implements $RotationDataCopyWith<$Res> {
  _$RotationDataCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RotationDataCopyWith<$Res>
    implements $RotationDataCopyWith<$Res> {
  factory _$$_RotationDataCopyWith(
          _$_RotationData value, $Res Function(_$_RotationData) then) =
      __$$_RotationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String formatCode, String name, DateTime? dateStart});
}

/// @nodoc
class __$$_RotationDataCopyWithImpl<$Res>
    extends _$RotationDataCopyWithImpl<$Res, _$_RotationData>
    implements _$$_RotationDataCopyWith<$Res> {
  __$$_RotationDataCopyWithImpl(
      _$_RotationData _value, $Res Function(_$_RotationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
  }) {
    return _then(_$_RotationData(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RotationData extends _RotationData {
  const _$_RotationData(
      {required this.code,
      required this.formatCode,
      required this.name,
      required this.dateStart})
      : super._();

  factory _$_RotationData.fromJson(Map<String, dynamic> json) =>
      _$$_RotationDataFromJson(json);

  @override
  final String code;
  @override
  final String formatCode;
  @override
  final String name;
  @override
  final DateTime? dateStart;

  @override
  String toString() {
    return 'RotationData(code: $code, formatCode: $formatCode, name: $name, dateStart: $dateStart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, formatCode, name, dateStart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationDataCopyWith<_$_RotationData> get copyWith =>
      __$$_RotationDataCopyWithImpl<_$_RotationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RotationDataToJson(
      this,
    );
  }
}

abstract class _RotationData extends RotationData {
  const factory _RotationData(
      {required final String code,
      required final String formatCode,
      required final String name,
      required final DateTime? dateStart}) = _$_RotationData;
  const _RotationData._() : super._();

  factory _RotationData.fromJson(Map<String, dynamic> json) =
      _$_RotationData.fromJson;

  @override
  String get code;
  @override
  String get formatCode;
  @override
  String get name;
  @override
  DateTime? get dateStart;
  @override
  @JsonKey(ignore: true)
  _$$_RotationDataCopyWith<_$_RotationData> get copyWith =>
      throw _privateConstructorUsedError;
}

RotationViewData _$RotationViewDataFromJson(Map<String, dynamic> json) {
  return _RotationViewData.fromJson(json);
}

/// @nodoc
mixin _$RotationViewData {
  String get code => throw _privateConstructorUsedError;
  String? get rotationCode => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  RotationType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RotationViewDataCopyWith<RotationViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationViewDataCopyWith<$Res> {
  factory $RotationViewDataCopyWith(
          RotationViewData value, $Res Function(RotationViewData) then) =
      _$RotationViewDataCopyWithImpl<$Res, RotationViewData>;
  @useResult
  $Res call(
      {String code,
      String? rotationCode,
      String formatCode,
      String name,
      DateTime? dateStart,
      RotationType? type});
}

/// @nodoc
class _$RotationViewDataCopyWithImpl<$Res, $Val extends RotationViewData>
    implements $RotationViewDataCopyWith<$Res> {
  _$RotationViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? rotationCode = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      rotationCode: freezed == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RotationType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RotationViewDataCopyWith<$Res>
    implements $RotationViewDataCopyWith<$Res> {
  factory _$$_RotationViewDataCopyWith(
          _$_RotationViewData value, $Res Function(_$_RotationViewData) then) =
      __$$_RotationViewDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String? rotationCode,
      String formatCode,
      String name,
      DateTime? dateStart,
      RotationType? type});
}

/// @nodoc
class __$$_RotationViewDataCopyWithImpl<$Res>
    extends _$RotationViewDataCopyWithImpl<$Res, _$_RotationViewData>
    implements _$$_RotationViewDataCopyWith<$Res> {
  __$$_RotationViewDataCopyWithImpl(
      _$_RotationViewData _value, $Res Function(_$_RotationViewData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? rotationCode = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? dateStart = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_RotationViewData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      rotationCode: freezed == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RotationType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RotationViewData extends _RotationViewData {
  const _$_RotationViewData(
      {required this.code,
      required this.rotationCode,
      required this.formatCode,
      required this.name,
      required this.dateStart,
      required this.type})
      : super._();

  factory _$_RotationViewData.fromJson(Map<String, dynamic> json) =>
      _$$_RotationViewDataFromJson(json);

  @override
  final String code;
  @override
  final String? rotationCode;
  @override
  final String formatCode;
  @override
  final String name;
  @override
  final DateTime? dateStart;
  @override
  final RotationType? type;

  @override
  String toString() {
    return 'RotationViewData(code: $code, rotationCode: $rotationCode, formatCode: $formatCode, name: $name, dateStart: $dateStart, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationViewData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.rotationCode, rotationCode) ||
                other.rotationCode == rotationCode) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, rotationCode, formatCode, name, dateStart, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationViewDataCopyWith<_$_RotationViewData> get copyWith =>
      __$$_RotationViewDataCopyWithImpl<_$_RotationViewData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RotationViewDataToJson(
      this,
    );
  }
}

abstract class _RotationViewData extends RotationViewData {
  const factory _RotationViewData(
      {required final String code,
      required final String? rotationCode,
      required final String formatCode,
      required final String name,
      required final DateTime? dateStart,
      required final RotationType? type}) = _$_RotationViewData;
  const _RotationViewData._() : super._();

  factory _RotationViewData.fromJson(Map<String, dynamic> json) =
      _$_RotationViewData.fromJson;

  @override
  String get code;
  @override
  String? get rotationCode;
  @override
  String get formatCode;
  @override
  String get name;
  @override
  DateTime? get dateStart;
  @override
  RotationType? get type;
  @override
  @JsonKey(ignore: true)
  _$$_RotationViewDataCopyWith<_$_RotationViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

RotationCycleData _$RotationCycleDataFromJson(Map<String, dynamic> json) {
  return _RotationCycleData.fromJson(json);
}

/// @nodoc
mixin _$RotationCycleData {
  String get rotationCode => throw _privateConstructorUsedError;
  String get cycleCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RotationCycleDataCopyWith<RotationCycleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationCycleDataCopyWith<$Res> {
  factory $RotationCycleDataCopyWith(
          RotationCycleData value, $Res Function(RotationCycleData) then) =
      _$RotationCycleDataCopyWithImpl<$Res, RotationCycleData>;
  @useResult
  $Res call({String rotationCode, String cycleCode});
}

/// @nodoc
class _$RotationCycleDataCopyWithImpl<$Res, $Val extends RotationCycleData>
    implements $RotationCycleDataCopyWith<$Res> {
  _$RotationCycleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rotationCode = null,
    Object? cycleCode = null,
  }) {
    return _then(_value.copyWith(
      rotationCode: null == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
              as String,
      cycleCode: null == cycleCode
          ? _value.cycleCode
          : cycleCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RotationCycleDataCopyWith<$Res>
    implements $RotationCycleDataCopyWith<$Res> {
  factory _$$_RotationCycleDataCopyWith(_$_RotationCycleData value,
          $Res Function(_$_RotationCycleData) then) =
      __$$_RotationCycleDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rotationCode, String cycleCode});
}

/// @nodoc
class __$$_RotationCycleDataCopyWithImpl<$Res>
    extends _$RotationCycleDataCopyWithImpl<$Res, _$_RotationCycleData>
    implements _$$_RotationCycleDataCopyWith<$Res> {
  __$$_RotationCycleDataCopyWithImpl(
      _$_RotationCycleData _value, $Res Function(_$_RotationCycleData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rotationCode = null,
    Object? cycleCode = null,
  }) {
    return _then(_$_RotationCycleData(
      rotationCode: null == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
              as String,
      cycleCode: null == cycleCode
          ? _value.cycleCode
          : cycleCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RotationCycleData extends _RotationCycleData {
  const _$_RotationCycleData(
      {required this.rotationCode, required this.cycleCode})
      : super._();

  factory _$_RotationCycleData.fromJson(Map<String, dynamic> json) =>
      _$$_RotationCycleDataFromJson(json);

  @override
  final String rotationCode;
  @override
  final String cycleCode;

  @override
  String toString() {
    return 'RotationCycleData(rotationCode: $rotationCode, cycleCode: $cycleCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationCycleData &&
            (identical(other.rotationCode, rotationCode) ||
                other.rotationCode == rotationCode) &&
            (identical(other.cycleCode, cycleCode) ||
                other.cycleCode == cycleCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rotationCode, cycleCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationCycleDataCopyWith<_$_RotationCycleData> get copyWith =>
      __$$_RotationCycleDataCopyWithImpl<_$_RotationCycleData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RotationCycleDataToJson(
      this,
    );
  }
}

abstract class _RotationCycleData extends RotationCycleData {
  const factory _RotationCycleData(
      {required final String rotationCode,
      required final String cycleCode}) = _$_RotationCycleData;
  const _RotationCycleData._() : super._();

  factory _RotationCycleData.fromJson(Map<String, dynamic> json) =
      _$_RotationCycleData.fromJson;

  @override
  String get rotationCode;
  @override
  String get cycleCode;
  @override
  @JsonKey(ignore: true)
  _$$_RotationCycleDataCopyWith<_$_RotationCycleData> get copyWith =>
      throw _privateConstructorUsedError;
}
