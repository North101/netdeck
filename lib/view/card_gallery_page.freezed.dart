// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_gallery_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardGalleryArguments _$CardGalleryArgumentsFromJson(Map<String, dynamic> json) {
  return _CardGalleryArguments.fromJson(json);
}

/// @nodoc
mixin _$CardGalleryArguments {
  @JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
  GroupedCardCodeList get items => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  Map<String, int>? get deckCards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardGalleryArgumentsCopyWith<CardGalleryArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardGalleryArgumentsCopyWith<$Res> {
  factory $CardGalleryArgumentsCopyWith(CardGalleryArguments value,
          $Res Function(CardGalleryArguments) then) =
      _$CardGalleryArgumentsCopyWithImpl<$Res, CardGalleryArguments>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
          GroupedCardCodeList items,
      int? index,
      Map<String, int>? deckCards});
}

/// @nodoc
class _$CardGalleryArgumentsCopyWithImpl<$Res,
        $Val extends CardGalleryArguments>
    implements $CardGalleryArgumentsCopyWith<$Res> {
  _$CardGalleryArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? index = freezed,
    Object? deckCards = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as GroupedCardCodeList,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      deckCards: freezed == deckCards
          ? _value.deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardGalleryArgumentsCopyWith<$Res>
    implements $CardGalleryArgumentsCopyWith<$Res> {
  factory _$$_CardGalleryArgumentsCopyWith(_$_CardGalleryArguments value,
          $Res Function(_$_CardGalleryArguments) then) =
      __$$_CardGalleryArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
          GroupedCardCodeList items,
      int? index,
      Map<String, int>? deckCards});
}

/// @nodoc
class __$$_CardGalleryArgumentsCopyWithImpl<$Res>
    extends _$CardGalleryArgumentsCopyWithImpl<$Res, _$_CardGalleryArguments>
    implements _$$_CardGalleryArgumentsCopyWith<$Res> {
  __$$_CardGalleryArgumentsCopyWithImpl(_$_CardGalleryArguments _value,
      $Res Function(_$_CardGalleryArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? index = freezed,
    Object? deckCards = freezed,
  }) {
    return _then(_$_CardGalleryArguments(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as GroupedCardCodeList,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      deckCards: freezed == deckCards
          ? _value._deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardGalleryArguments implements _CardGalleryArguments {
  const _$_CardGalleryArguments(
      {@JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
          required this.items,
      required this.index,
      required final Map<String, int>? deckCards})
      : _deckCards = deckCards;

  factory _$_CardGalleryArguments.fromJson(Map<String, dynamic> json) =>
      _$$_CardGalleryArgumentsFromJson(json);

  @override
  @JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
  final GroupedCardCodeList items;
  @override
  final int? index;
  final Map<String, int>? _deckCards;
  @override
  Map<String, int>? get deckCards {
    final value = _deckCards;
    if (value == null) return null;
    if (_deckCards is EqualUnmodifiableMapView) return _deckCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CardGalleryArguments(items: $items, index: $index, deckCards: $deckCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryArguments &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality()
                .equals(other._deckCards, _deckCards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      index,
      const DeepCollectionEquality().hash(_deckCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryArgumentsCopyWith<_$_CardGalleryArguments> get copyWith =>
      __$$_CardGalleryArgumentsCopyWithImpl<_$_CardGalleryArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardGalleryArgumentsToJson(
      this,
    );
  }
}

abstract class _CardGalleryArguments implements CardGalleryArguments {
  const factory _CardGalleryArguments(
      {@JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
          required final GroupedCardCodeList items,
      required final int? index,
      required final Map<String, int>? deckCards}) = _$_CardGalleryArguments;

  factory _CardGalleryArguments.fromJson(Map<String, dynamic> json) =
      _$_CardGalleryArguments.fromJson;

  @override
  @JsonKey(fromJson: itemsFromJson, toJson: itemsToJson)
  GroupedCardCodeList get items;
  @override
  int? get index;
  @override
  Map<String, int>? get deckCards;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryArgumentsCopyWith<_$_CardGalleryArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
