// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$FilterTypeCopyWithImpl<T, $Res, FilterType<T>>;
  @useResult
  $Res call({bool visible, Set<T> values, Set<T> always, Set<T> never});
}

/// @nodoc
class _$FilterTypeCopyWithImpl<T, $Res, $Val extends FilterType<T>>
    implements $FilterTypeCopyWith<T, $Res> {
  _$FilterTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visible = null,
    Object? values = null,
    Object? always = null,
    Object? never = null,
  }) {
    return _then(_value.copyWith(
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      always: null == always
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      never: null == never
          ? _value.never
          : never // ignore: cast_nullable_to_non_nullable
              as Set<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterTypeCopyWith<T, $Res>
    implements $FilterTypeCopyWith<T, $Res> {
  factory _$$_FilterTypeCopyWith(
          _$_FilterType<T> value, $Res Function(_$_FilterType<T>) then) =
      __$$_FilterTypeCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool visible, Set<T> values, Set<T> always, Set<T> never});
}

/// @nodoc
class __$$_FilterTypeCopyWithImpl<T, $Res>
    extends _$FilterTypeCopyWithImpl<T, $Res, _$_FilterType<T>>
    implements _$$_FilterTypeCopyWith<T, $Res> {
  __$$_FilterTypeCopyWithImpl(
      _$_FilterType<T> _value, $Res Function(_$_FilterType<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visible = null,
    Object? values = null,
    Object? always = null,
    Object? never = null,
  }) {
    return _then(_$_FilterType<T>(
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      always: null == always
          ? _value._always
          : always // ignore: cast_nullable_to_non_nullable
              as Set<T>,
      never: null == never
          ? _value._never
          : never // ignore: cast_nullable_to_non_nullable
              as Set<T>,
    ));
  }
}

/// @nodoc

class _$_FilterType<T> extends _FilterType<T> {
  _$_FilterType(
      {this.visible = true,
      final Set<T> values = const {},
      final Set<T> always = const {},
      final Set<T> never = const {}})
      : _values = values,
        _always = always,
        _never = never,
        super._();

  @override
  @JsonKey()
  final bool visible;
  final Set<T> _values;
  @override
  @JsonKey()
  Set<T> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_values);
  }

  final Set<T> _always;
  @override
  @JsonKey()
  Set<T> get always {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_always);
  }

  final Set<T> _never;
  @override
  @JsonKey()
  Set<T> get never {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_never);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterType<T> &&
            (identical(other.visible, visible) || other.visible == visible) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(other._always, _always) &&
            const DeepCollectionEquality().equals(other._never, _never));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      visible,
      const DeepCollectionEquality().hash(_values),
      const DeepCollectionEquality().hash(_always),
      const DeepCollectionEquality().hash(_never));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterTypeCopyWith<T, _$_FilterType<T>> get copyWith =>
      __$$_FilterTypeCopyWithImpl<T, _$_FilterType<T>>(this, _$identity);
}

abstract class _FilterType<T> extends FilterType<T> {
  factory _FilterType(
      {final bool visible,
      final Set<T> values,
      final Set<T> always,
      final Set<T> never}) = _$_FilterType<T>;
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
  _$$_FilterTypeCopyWith<T, _$_FilterType<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
