// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterTypesArguments _$FilterTypesArgumentsFromJson(Map<String, dynamic> json) {
  return _FilterTypesArguments.fromJson(json);
}

/// @nodoc
mixin _$FilterTypesArguments {
  FilterType<String> get sides => throw _privateConstructorUsedError;
  FilterType<String> get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterTypesArgumentsCopyWith<FilterTypesArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterTypesArgumentsCopyWith<$Res> {
  factory $FilterTypesArgumentsCopyWith(FilterTypesArguments value,
          $Res Function(FilterTypesArguments) then) =
      _$FilterTypesArgumentsCopyWithImpl<$Res, FilterTypesArguments>;
  @useResult
  $Res call({FilterType<String> sides, FilterType<String> types});

  $FilterTypeCopyWith<String, $Res> get sides;
  $FilterTypeCopyWith<String, $Res> get types;
}

/// @nodoc
class _$FilterTypesArgumentsCopyWithImpl<$Res,
        $Val extends FilterTypesArguments>
    implements $FilterTypesArgumentsCopyWith<$Res> {
  _$FilterTypesArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sides = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
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
  $FilterTypeCopyWith<String, $Res> get types {
    return $FilterTypeCopyWith<String, $Res>(_value.types, (value) {
      return _then(_value.copyWith(types: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FilterTypesArgumentsCopyWith<$Res>
    implements $FilterTypesArgumentsCopyWith<$Res> {
  factory _$$_FilterTypesArgumentsCopyWith(_$_FilterTypesArguments value,
          $Res Function(_$_FilterTypesArguments) then) =
      __$$_FilterTypesArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FilterType<String> sides, FilterType<String> types});

  @override
  $FilterTypeCopyWith<String, $Res> get sides;
  @override
  $FilterTypeCopyWith<String, $Res> get types;
}

/// @nodoc
class __$$_FilterTypesArgumentsCopyWithImpl<$Res>
    extends _$FilterTypesArgumentsCopyWithImpl<$Res, _$_FilterTypesArguments>
    implements _$$_FilterTypesArgumentsCopyWith<$Res> {
  __$$_FilterTypesArgumentsCopyWithImpl(_$_FilterTypesArguments _value,
      $Res Function(_$_FilterTypesArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sides = null,
    Object? types = null,
  }) {
    return _then(_$_FilterTypesArguments(
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterTypesArguments implements _FilterTypesArguments {
  const _$_FilterTypesArguments({required this.sides, required this.types});

  factory _$_FilterTypesArguments.fromJson(Map<String, dynamic> json) =>
      _$$_FilterTypesArgumentsFromJson(json);

  @override
  final FilterType<String> sides;
  @override
  final FilterType<String> types;

  @override
  String toString() {
    return 'FilterTypesArguments(sides: $sides, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterTypesArguments &&
            const DeepCollectionEquality().equals(other.sides, sides) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sides),
      const DeepCollectionEquality().hash(types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterTypesArgumentsCopyWith<_$_FilterTypesArguments> get copyWith =>
      __$$_FilterTypesArgumentsCopyWithImpl<_$_FilterTypesArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterTypesArgumentsToJson(
      this,
    );
  }
}

abstract class _FilterTypesArguments implements FilterTypesArguments {
  const factory _FilterTypesArguments(
      {required final FilterType<String> sides,
      required final FilterType<String> types}) = _$_FilterTypesArguments;

  factory _FilterTypesArguments.fromJson(Map<String, dynamic> json) =
      _$_FilterTypesArguments.fromJson;

  @override
  FilterType<String> get sides;
  @override
  FilterType<String> get types;
  @override
  @JsonKey(ignore: true)
  _$$_FilterTypesArgumentsCopyWith<_$_FilterTypesArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
