// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FactionData _$FactionDataFromJson(Map<String, dynamic> json) {
  return _FactionData.fromJson(json);
}

/// @nodoc
mixin _$FactionData {
  String get code => throw _privateConstructorUsedError;
  String get sideCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  Color get color => throw _privateConstructorUsedError;
  bool get isMini => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactionDataCopyWith<FactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactionDataCopyWith<$Res> {
  factory $FactionDataCopyWith(
          FactionData value, $Res Function(FactionData) then) =
      _$FactionDataCopyWithImpl<$Res, FactionData>;
  @useResult
  $Res call(
      {String code,
      String sideCode,
      String name,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color,
      bool isMini});
}

/// @nodoc
class _$FactionDataCopyWithImpl<$Res, $Val extends FactionData>
    implements $FactionDataCopyWith<$Res> {
  _$FactionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? sideCode = null,
    Object? name = null,
    Object? color = null,
    Object? isMini = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactionDataCopyWith<$Res>
    implements $FactionDataCopyWith<$Res> {
  factory _$$_FactionDataCopyWith(
          _$_FactionData value, $Res Function(_$_FactionData) then) =
      __$$_FactionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String sideCode,
      String name,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color,
      bool isMini});
}

/// @nodoc
class __$$_FactionDataCopyWithImpl<$Res>
    extends _$FactionDataCopyWithImpl<$Res, _$_FactionData>
    implements _$$_FactionDataCopyWith<$Res> {
  __$$_FactionDataCopyWithImpl(
      _$_FactionData _value, $Res Function(_$_FactionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? sideCode = null,
    Object? name = null,
    Object? color = null,
    Object? isMini = null,
  }) {
    return _then(_$_FactionData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FactionData extends _FactionData {
  const _$_FactionData(
      {required this.code,
      required this.sideCode,
      required this.name,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
          required this.color,
      required this.isMini})
      : super._();

  factory _$_FactionData.fromJson(Map<String, dynamic> json) =>
      _$$_FactionDataFromJson(json);

  @override
  final String code;
  @override
  final String sideCode;
  @override
  final String name;
  @override
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color color;
  @override
  final bool isMini;

  @override
  String toString() {
    return 'FactionData(code: $code, sideCode: $sideCode, name: $name, color: $color, isMini: $isMini)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactionData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sideCode, sideCode) ||
                other.sideCode == sideCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isMini, isMini) || other.isMini == isMini));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, sideCode, name, color, isMini);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactionDataCopyWith<_$_FactionData> get copyWith =>
      __$$_FactionDataCopyWithImpl<_$_FactionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FactionDataToJson(
      this,
    );
  }
}

abstract class _FactionData extends FactionData {
  const factory _FactionData(
      {required final String code,
      required final String sideCode,
      required final String name,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
          required final Color color,
      required final bool isMini}) = _$_FactionData;
  const _FactionData._() : super._();

  factory _FactionData.fromJson(Map<String, dynamic> json) =
      _$_FactionData.fromJson;

  @override
  String get code;
  @override
  String get sideCode;
  @override
  String get name;
  @override
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  Color get color;
  @override
  bool get isMini;
  @override
  @JsonKey(ignore: true)
  _$$_FactionDataCopyWith<_$_FactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

FactionResult _$FactionResultFromJson(Map<String, dynamic> json) {
  return _FactionResult.fromJson(json);
}

/// @nodoc
mixin _$FactionResult {
  FactionData get faction => throw _privateConstructorUsedError;
  SideData get side => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactionResultCopyWith<FactionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactionResultCopyWith<$Res> {
  factory $FactionResultCopyWith(
          FactionResult value, $Res Function(FactionResult) then) =
      _$FactionResultCopyWithImpl<$Res, FactionResult>;
  @useResult
  $Res call({FactionData faction, SideData side});

  $FactionDataCopyWith<$Res> get faction;
  $SideDataCopyWith<$Res> get side;
}

/// @nodoc
class _$FactionResultCopyWithImpl<$Res, $Val extends FactionResult>
    implements $FactionResultCopyWith<$Res> {
  _$FactionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faction = null,
    Object? side = null,
  }) {
    return _then(_value.copyWith(
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FactionDataCopyWith<$Res> get faction {
    return $FactionDataCopyWith<$Res>(_value.faction, (value) {
      return _then(_value.copyWith(faction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SideDataCopyWith<$Res> get side {
    return $SideDataCopyWith<$Res>(_value.side, (value) {
      return _then(_value.copyWith(side: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FactionResultCopyWith<$Res>
    implements $FactionResultCopyWith<$Res> {
  factory _$$_FactionResultCopyWith(
          _$_FactionResult value, $Res Function(_$_FactionResult) then) =
      __$$_FactionResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FactionData faction, SideData side});

  @override
  $FactionDataCopyWith<$Res> get faction;
  @override
  $SideDataCopyWith<$Res> get side;
}

/// @nodoc
class __$$_FactionResultCopyWithImpl<$Res>
    extends _$FactionResultCopyWithImpl<$Res, _$_FactionResult>
    implements _$$_FactionResultCopyWith<$Res> {
  __$$_FactionResultCopyWithImpl(
      _$_FactionResult _value, $Res Function(_$_FactionResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faction = null,
    Object? side = null,
  }) {
    return _then(_$_FactionResult(
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FactionResult implements _FactionResult {
  const _$_FactionResult({required this.faction, required this.side});

  factory _$_FactionResult.fromJson(Map<String, dynamic> json) =>
      _$$_FactionResultFromJson(json);

  @override
  final FactionData faction;
  @override
  final SideData side;

  @override
  String toString() {
    return 'FactionResult(faction: $faction, side: $side)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactionResult &&
            (identical(other.faction, faction) || other.faction == faction) &&
            (identical(other.side, side) || other.side == side));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, faction, side);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactionResultCopyWith<_$_FactionResult> get copyWith =>
      __$$_FactionResultCopyWithImpl<_$_FactionResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FactionResultToJson(
      this,
    );
  }
}

abstract class _FactionResult implements FactionResult {
  const factory _FactionResult(
      {required final FactionData faction,
      required final SideData side}) = _$_FactionResult;

  factory _FactionResult.fromJson(Map<String, dynamic> json) =
      _$_FactionResult.fromJson;

  @override
  FactionData get faction;
  @override
  SideData get side;
  @override
  @JsonKey(ignore: true)
  _$$_FactionResultCopyWith<_$_FactionResult> get copyWith =>
      throw _privateConstructorUsedError;
}
