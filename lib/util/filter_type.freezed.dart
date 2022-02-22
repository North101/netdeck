// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterTypeTearOff {
  const _$FilterTypeTearOff();

  _FilterType<T> call<T>(
      {bool visible = true,
      Set<T> values = const {},
      Set<T> always = const {},
      Set<T> never = const {}}) {
    return _FilterType<T>(
      visible: visible,
      values: values,
      always: always,
      never: never,
    );
  }
}

/// @nodoc
const $FilterType = _$FilterTypeTearOff();

/// @nodoc
mixin _$FilterType<T> {
  bool get visible => throw _privateConstructorUsedError;
  Set<T> get values => throw _privateConstructorUsedError;
  Set<T> get always => throw _privateConstructorUsedError;
  Set<T> get never => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterTypeCopyWith<T, FilterType<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterTypeCopyWith<T, $Res> {
  factory $FilterTypeCopyWith(
          FilterType<T> value, $Res Function(FilterType<T>) then) =
      _$FilterTypeCopyWithImpl<T, $Res>;
  $Res call({bool visible, Set<T> values, Set<T> always, Set<T> never});
}

/// @nodoc
class _$FilterTypeCopyWithImpl<T, $Res>
    implements $FilterTypeCopyWith<T, $Res> {
  _$FilterTypeCopyWithImpl(this._value, this._then);

  final FilterType<T> _value;
  // ignore: unused_field
  final $Res Function(FilterType<T>) _then;

  @override
  $Res call({
    Object? visible = freezed,
    Object? values = freezed,
    Object? always = freezed,
    Object? never = freezed,
  }) {
    return _then(_value.copyWith(
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      always: always == freezed
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      never: never == freezed
          ? _value.never
          : never // ignore: cast_nullable_to_non_nullable
              as Set<T>,
    ));
  }
}

/// @nodoc
abstract class _$FilterTypeCopyWith<T, $Res>
    implements $FilterTypeCopyWith<T, $Res> {
  factory _$FilterTypeCopyWith(
          _FilterType<T> value, $Res Function(_FilterType<T>) then) =
      __$FilterTypeCopyWithImpl<T, $Res>;
  @override
  $Res call({bool visible, Set<T> values, Set<T> always, Set<T> never});
}

/// @nodoc
class __$FilterTypeCopyWithImpl<T, $Res>
    extends _$FilterTypeCopyWithImpl<T, $Res>
    implements _$FilterTypeCopyWith<T, $Res> {
  __$FilterTypeCopyWithImpl(
      _FilterType<T> _value, $Res Function(_FilterType<T>) _then)
      : super(_value, (v) => _then(v as _FilterType<T>));

  @override
  _FilterType<T> get _value => super._value as _FilterType<T>;

  @override
  $Res call({
    Object? visible = freezed,
    Object? values = freezed,
    Object? always = freezed,
    Object? never = freezed,
  }) {
    return _then(_FilterType<T>(
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      always: always == freezed
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      never: never == freezed
          ? _value.never
          : never // ignore: cast_nullable_to_non_nullable
              as Set<T>,
    ));
  }
}

/// @nodoc

class _$_FilterType<T> extends _FilterType<T> {
  _$_FilterType(
      {this.visible = true,
      this.values = const {},
      this.always = const {},
      this.never = const {}})
      : super._();

  @JsonKey()
  @override
  final bool visible;
  @JsonKey()
  @override
  final Set<T> values;
  @JsonKey()
  @override
  final Set<T> always;
  @JsonKey()
  @override
  final Set<T> never;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterType<T> &&
            const DeepCollectionEquality().equals(other.visible, visible) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            const DeepCollectionEquality().equals(other.always, always) &&
            const DeepCollectionEquality().equals(other.never, never));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(visible),
      const DeepCollectionEquality().hash(values),
      const DeepCollectionEquality().hash(always),
      const DeepCollectionEquality().hash(never));

  @JsonKey(ignore: true)
  @override
  _$FilterTypeCopyWith<T, _FilterType<T>> get copyWith =>
      __$FilterTypeCopyWithImpl<T, _FilterType<T>>(this, _$identity);
}

abstract class _FilterType<T> extends FilterType<T> {
  factory _FilterType(
      {bool visible,
      Set<T> values,
      Set<T> always,
      Set<T> never}) = _$_FilterType<T>;
  _FilterType._() : super._();

  @override
  bool get visible;
  @override
  Set<T> get values;
  @override
  Set<T> get always;
  @override
  Set<T> get never;
  @override
  @JsonKey(ignore: true)
  _$FilterTypeCopyWith<T, _FilterType<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
