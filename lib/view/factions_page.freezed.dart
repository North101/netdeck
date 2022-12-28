// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'factions_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterFactionsArguments _$FilterFactionsArgumentsFromJson(
    Map<String, dynamic> json) {
  return _FilterFactionsArguments.fromJson(json);
}

/// @nodoc
mixin _$FilterFactionsArguments {
  FilterType<String> get sides => throw _privateConstructorUsedError;
  FilterType<String> get factions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterFactionsArgumentsCopyWith<FilterFactionsArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterFactionsArgumentsCopyWith<$Res> {
  factory $FilterFactionsArgumentsCopyWith(FilterFactionsArguments value,
          $Res Function(FilterFactionsArguments) then) =
      _$FilterFactionsArgumentsCopyWithImpl<$Res, FilterFactionsArguments>;
  @useResult
  $Res call({FilterType<String> sides, FilterType<String> factions});

  $FilterTypeCopyWith<String, $Res> get sides;
  $FilterTypeCopyWith<String, $Res> get factions;
}

/// @nodoc
class _$FilterFactionsArgumentsCopyWithImpl<$Res,
        $Val extends FilterFactionsArguments>
    implements $FilterFactionsArgumentsCopyWith<$Res> {
  _$FilterFactionsArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sides = null,
    Object? factions = null,
  }) {
    return _then(_value.copyWith(
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      factions: null == factions
          ? _value.factions
          : factions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get sides {
    return $FilterTypeCopyWith<String, $Res>(_value.sides, (value) {
      return _then(_value.copyWith(sides: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get factions {
    return $FilterTypeCopyWith<String, $Res>(_value.factions, (value) {
      return _then(_value.copyWith(factions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FilterFactionsArgumentsCopyWith<$Res>
    implements $FilterFactionsArgumentsCopyWith<$Res> {
  factory _$$_FilterFactionsArgumentsCopyWith(_$_FilterFactionsArguments value,
          $Res Function(_$_FilterFactionsArguments) then) =
      __$$_FilterFactionsArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FilterType<String> sides, FilterType<String> factions});

  @override
  $FilterTypeCopyWith<String, $Res> get sides;
  @override
  $FilterTypeCopyWith<String, $Res> get factions;
}

/// @nodoc
class __$$_FilterFactionsArgumentsCopyWithImpl<$Res>
    extends _$FilterFactionsArgumentsCopyWithImpl<$Res,
        _$_FilterFactionsArguments>
    implements _$$_FilterFactionsArgumentsCopyWith<$Res> {
  __$$_FilterFactionsArgumentsCopyWithImpl(_$_FilterFactionsArguments _value,
      $Res Function(_$_FilterFactionsArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sides = null,
    Object? factions = null,
  }) {
    return _then(_$_FilterFactionsArguments(
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      factions: null == factions
          ? _value.factions
          : factions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterFactionsArguments implements _FilterFactionsArguments {
  const _$_FilterFactionsArguments(
      {required this.sides, required this.factions});

  factory _$_FilterFactionsArguments.fromJson(Map<String, dynamic> json) =>
      _$$_FilterFactionsArgumentsFromJson(json);

  @override
  final FilterType<String> sides;
  @override
  final FilterType<String> factions;

  @override
  String toString() {
    return 'FilterFactionsArguments(sides: $sides, factions: $factions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterFactionsArguments &&
            const DeepCollectionEquality().equals(other.sides, sides) &&
            const DeepCollectionEquality().equals(other.factions, factions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sides),
      const DeepCollectionEquality().hash(factions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterFactionsArgumentsCopyWith<_$_FilterFactionsArguments>
      get copyWith =>
          __$$_FilterFactionsArgumentsCopyWithImpl<_$_FilterFactionsArguments>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterFactionsArgumentsToJson(
      this,
    );
  }
}

abstract class _FilterFactionsArguments implements FilterFactionsArguments {
  const factory _FilterFactionsArguments(
      {required final FilterType<String> sides,
      required final FilterType<String> factions}) = _$_FilterFactionsArguments;

  factory _FilterFactionsArguments.fromJson(Map<String, dynamic> json) =
      _$_FilterFactionsArguments.fromJson;

  @override
  FilterType<String> get sides;
  @override
  FilterType<String> get factions;
  @override
  @JsonKey(ignore: true)
  _$$_FilterFactionsArgumentsCopyWith<_$_FilterFactionsArguments>
      get copyWith => throw _privateConstructorUsedError;
}
