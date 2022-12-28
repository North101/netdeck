// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeckCompareArguments _$DeckCompareArgumentsFromJson(Map<String, dynamic> json) {
  return _DeckCompareArguments.fromJson(json);
}

/// @nodoc
mixin _$DeckCompareArguments {
  Set<DeckCompareResult> get deckList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCompareArgumentsCopyWith<DeckCompareArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCompareArgumentsCopyWith<$Res> {
  factory $DeckCompareArgumentsCopyWith(DeckCompareArguments value,
          $Res Function(DeckCompareArguments) then) =
      _$DeckCompareArgumentsCopyWithImpl<$Res, DeckCompareArguments>;
  @useResult
  $Res call({Set<DeckCompareResult> deckList});
}

/// @nodoc
class _$DeckCompareArgumentsCopyWithImpl<$Res,
        $Val extends DeckCompareArguments>
    implements $DeckCompareArgumentsCopyWith<$Res> {
  _$DeckCompareArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckList = null,
  }) {
    return _then(_value.copyWith(
      deckList: null == deckList
          ? _value.deckList
          : deckList // ignore: cast_nullable_to_non_nullable
              as Set<DeckCompareResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCompareArgumentsCopyWith<$Res>
    implements $DeckCompareArgumentsCopyWith<$Res> {
  factory _$$_DeckCompareArgumentsCopyWith(_$_DeckCompareArguments value,
          $Res Function(_$_DeckCompareArguments) then) =
      __$$_DeckCompareArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<DeckCompareResult> deckList});
}

/// @nodoc
class __$$_DeckCompareArgumentsCopyWithImpl<$Res>
    extends _$DeckCompareArgumentsCopyWithImpl<$Res, _$_DeckCompareArguments>
    implements _$$_DeckCompareArgumentsCopyWith<$Res> {
  __$$_DeckCompareArgumentsCopyWithImpl(_$_DeckCompareArguments _value,
      $Res Function(_$_DeckCompareArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckList = null,
  }) {
    return _then(_$_DeckCompareArguments(
      null == deckList
          ? _value._deckList
          : deckList // ignore: cast_nullable_to_non_nullable
              as Set<DeckCompareResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckCompareArguments implements _DeckCompareArguments {
  const _$_DeckCompareArguments(final Set<DeckCompareResult> deckList)
      : _deckList = deckList;

  factory _$_DeckCompareArguments.fromJson(Map<String, dynamic> json) =>
      _$$_DeckCompareArgumentsFromJson(json);

  final Set<DeckCompareResult> _deckList;
  @override
  Set<DeckCompareResult> get deckList {
    if (_deckList is EqualUnmodifiableSetView) return _deckList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_deckList);
  }

  @override
  String toString() {
    return 'DeckCompareArguments(deckList: $deckList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCompareArguments &&
            const DeepCollectionEquality().equals(other._deckList, _deckList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_deckList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCompareArgumentsCopyWith<_$_DeckCompareArguments> get copyWith =>
      __$$_DeckCompareArgumentsCopyWithImpl<_$_DeckCompareArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckCompareArgumentsToJson(
      this,
    );
  }
}

abstract class _DeckCompareArguments implements DeckCompareArguments {
  const factory _DeckCompareArguments(final Set<DeckCompareResult> deckList) =
      _$_DeckCompareArguments;

  factory _DeckCompareArguments.fromJson(Map<String, dynamic> json) =
      _$_DeckCompareArguments.fromJson;

  @override
  Set<DeckCompareResult> get deckList;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCompareArgumentsCopyWith<_$_DeckCompareArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
