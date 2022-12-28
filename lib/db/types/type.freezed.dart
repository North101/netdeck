// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeData _$TypeDataFromJson(Map<String, dynamic> json) {
  return _TypeData.fromJson(json);
}

/// @nodoc
mixin _$TypeData {
  String get code => throw _privateConstructorUsedError;
  String? get sideCode => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isSubtype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeDataCopyWith<TypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeDataCopyWith<$Res> {
  factory $TypeDataCopyWith(TypeData value, $Res Function(TypeData) then) =
      _$TypeDataCopyWithImpl<$Res, TypeData>;
  @useResult
  $Res call(
      {String code,
      String? sideCode,
      int position,
      String name,
      bool isSubtype});
}

/// @nodoc
class _$TypeDataCopyWithImpl<$Res, $Val extends TypeData>
    implements $TypeDataCopyWith<$Res> {
  _$TypeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? sideCode = freezed,
    Object? position = null,
    Object? name = null,
    Object? isSubtype = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: freezed == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSubtype: null == isSubtype
          ? _value.isSubtype
          : isSubtype // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TypeDataCopyWith<$Res> implements $TypeDataCopyWith<$Res> {
  factory _$$_TypeDataCopyWith(
          _$_TypeData value, $Res Function(_$_TypeData) then) =
      __$$_TypeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String? sideCode,
      int position,
      String name,
      bool isSubtype});
}

/// @nodoc
class __$$_TypeDataCopyWithImpl<$Res>
    extends _$TypeDataCopyWithImpl<$Res, _$_TypeData>
    implements _$$_TypeDataCopyWith<$Res> {
  __$$_TypeDataCopyWithImpl(
      _$_TypeData _value, $Res Function(_$_TypeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? sideCode = freezed,
    Object? position = null,
    Object? name = null,
    Object? isSubtype = null,
  }) {
    return _then(_$_TypeData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: freezed == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isSubtype: null == isSubtype
          ? _value.isSubtype
          : isSubtype // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeData extends _TypeData {
  const _$_TypeData(
      {required this.code,
      required this.sideCode,
      required this.position,
      required this.name,
      required this.isSubtype})
      : super._();

  factory _$_TypeData.fromJson(Map<String, dynamic> json) =>
      _$$_TypeDataFromJson(json);

  @override
  final String code;
  @override
  final String? sideCode;
  @override
  final int position;
  @override
  final String name;
  @override
  final bool isSubtype;

  @override
  String toString() {
    return 'TypeData(code: $code, sideCode: $sideCode, position: $position, name: $name, isSubtype: $isSubtype)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sideCode, sideCode) ||
                other.sideCode == sideCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSubtype, isSubtype) ||
                other.isSubtype == isSubtype));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, sideCode, position, name, isSubtype);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeDataCopyWith<_$_TypeData> get copyWith =>
      __$$_TypeDataCopyWithImpl<_$_TypeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeDataToJson(
      this,
    );
  }
}

abstract class _TypeData extends TypeData {
  const factory _TypeData(
      {required final String code,
      required final String? sideCode,
      required final int position,
      required final String name,
      required final bool isSubtype}) = _$_TypeData;
  const _TypeData._() : super._();

  factory _TypeData.fromJson(Map<String, dynamic> json) = _$_TypeData.fromJson;

  @override
  String get code;
  @override
  String? get sideCode;
  @override
  int get position;
  @override
  String get name;
  @override
  bool get isSubtype;
  @override
  @JsonKey(ignore: true)
  _$$_TypeDataCopyWith<_$_TypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeResult _$TypeResultFromJson(Map<String, dynamic> json) {
  return _TypeResult.fromJson(json);
}

/// @nodoc
mixin _$TypeResult {
  TypeData get type => throw _privateConstructorUsedError;
  SideData? get side => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeResultCopyWith<TypeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeResultCopyWith<$Res> {
  factory $TypeResultCopyWith(
          TypeResult value, $Res Function(TypeResult) then) =
      _$TypeResultCopyWithImpl<$Res, TypeResult>;
  @useResult
  $Res call({TypeData type, SideData? side});

  $TypeDataCopyWith<$Res> get type;
  $SideDataCopyWith<$Res>? get side;
}

/// @nodoc
class _$TypeResultCopyWithImpl<$Res, $Val extends TypeResult>
    implements $TypeResultCopyWith<$Res> {
  _$TypeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? side = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeDataCopyWith<$Res> get type {
    return $TypeDataCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SideDataCopyWith<$Res>? get side {
    if (_value.side == null) {
      return null;
    }

    return $SideDataCopyWith<$Res>(_value.side!, (value) {
      return _then(_value.copyWith(side: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TypeResultCopyWith<$Res>
    implements $TypeResultCopyWith<$Res> {
  factory _$$_TypeResultCopyWith(
          _$_TypeResult value, $Res Function(_$_TypeResult) then) =
      __$$_TypeResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TypeData type, SideData? side});

  @override
  $TypeDataCopyWith<$Res> get type;
  @override
  $SideDataCopyWith<$Res>? get side;
}

/// @nodoc
class __$$_TypeResultCopyWithImpl<$Res>
    extends _$TypeResultCopyWithImpl<$Res, _$_TypeResult>
    implements _$$_TypeResultCopyWith<$Res> {
  __$$_TypeResultCopyWithImpl(
      _$_TypeResult _value, $Res Function(_$_TypeResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? side = freezed,
  }) {
    return _then(_$_TypeResult(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      side: freezed == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeResult implements _TypeResult {
  const _$_TypeResult({required this.type, required this.side});

  factory _$_TypeResult.fromJson(Map<String, dynamic> json) =>
      _$$_TypeResultFromJson(json);

  @override
  final TypeData type;
  @override
  final SideData? side;

  @override
  String toString() {
    return 'TypeResult(type: $type, side: $side)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeResult &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.side, side) || other.side == side));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, side);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeResultCopyWith<_$_TypeResult> get copyWith =>
      __$$_TypeResultCopyWithImpl<_$_TypeResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeResultToJson(
      this,
    );
  }
}

abstract class _TypeResult implements TypeResult {
  const factory _TypeResult(
      {required final TypeData type,
      required final SideData? side}) = _$_TypeResult;

  factory _TypeResult.fromJson(Map<String, dynamic> json) =
      _$_TypeResult.fromJson;

  @override
  TypeData get type;
  @override
  SideData? get side;
  @override
  @JsonKey(ignore: true)
  _$$_TypeResultCopyWith<_$_TypeResult> get copyWith =>
      throw _privateConstructorUsedError;
}
