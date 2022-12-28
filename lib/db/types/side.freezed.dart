// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SideData _$SideDataFromJson(Map<String, dynamic> json) {
  return _SideData.fromJson(json);
}

/// @nodoc
mixin _$SideData {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SideDataCopyWith<SideData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideDataCopyWith<$Res> {
  factory $SideDataCopyWith(SideData value, $Res Function(SideData) then) =
      _$SideDataCopyWithImpl<$Res, SideData>;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$SideDataCopyWithImpl<$Res, $Val extends SideData>
    implements $SideDataCopyWith<$Res> {
  _$SideDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_SideDataCopyWith<$Res> implements $SideDataCopyWith<$Res> {
  factory _$$_SideDataCopyWith(
          _$_SideData value, $Res Function(_$_SideData) then) =
      __$$_SideDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$$_SideDataCopyWithImpl<$Res>
    extends _$SideDataCopyWithImpl<$Res, _$_SideData>
    implements _$$_SideDataCopyWith<$Res> {
  __$$_SideDataCopyWithImpl(
      _$_SideData _value, $Res Function(_$_SideData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_SideData(
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
class _$_SideData extends _SideData {
  const _$_SideData({required this.code, required this.name}) : super._();

  factory _$_SideData.fromJson(Map<String, dynamic> json) =>
      _$$_SideDataFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'SideData(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SideData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SideDataCopyWith<_$_SideData> get copyWith =>
      __$$_SideDataCopyWithImpl<_$_SideData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SideDataToJson(
      this,
    );
  }
}

abstract class _SideData extends SideData {
  const factory _SideData(
      {required final String code, required final String name}) = _$_SideData;
  const _SideData._() : super._();

  factory _SideData.fromJson(Map<String, dynamic> json) = _$_SideData.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SideDataCopyWith<_$_SideData> get copyWith =>
      throw _privateConstructorUsedError;
}
