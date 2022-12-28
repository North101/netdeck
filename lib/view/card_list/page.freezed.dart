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

CardListArguments _$CardListArgumentsFromJson(Map<String, dynamic> json) {
  return _CardListArguments.fromJson(json);
}

/// @nodoc
mixin _$CardListArguments {
  DeckResult get deck => throw _privateConstructorUsedError;
  Map<String, int> get deckCards => throw _privateConstructorUsedError;
  String? get filterSearch => throw _privateConstructorUsedError;
  bool get filterCollection => throw _privateConstructorUsedError;
  FilterType<String> get filterPacks => throw _privateConstructorUsedError;
  FilterType<String> get filterSides => throw _privateConstructorUsedError;
  FilterType<String> get filterFactions => throw _privateConstructorUsedError;
  FilterType<String> get filterTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardListArgumentsCopyWith<CardListArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardListArgumentsCopyWith<$Res> {
  factory $CardListArgumentsCopyWith(
          CardListArguments value, $Res Function(CardListArguments) then) =
      _$CardListArgumentsCopyWithImpl<$Res, CardListArguments>;
  @useResult
  $Res call(
      {DeckResult deck,
      Map<String, int> deckCards,
      String? filterSearch,
      bool filterCollection,
      FilterType<String> filterPacks,
      FilterType<String> filterSides,
      FilterType<String> filterFactions,
      FilterType<String> filterTypes});

  $DeckResultCopyWith<$Res> get deck;
  $FilterTypeCopyWith<String, $Res> get filterPacks;
  $FilterTypeCopyWith<String, $Res> get filterSides;
  $FilterTypeCopyWith<String, $Res> get filterFactions;
  $FilterTypeCopyWith<String, $Res> get filterTypes;
}

/// @nodoc
class _$CardListArgumentsCopyWithImpl<$Res, $Val extends CardListArguments>
    implements $CardListArgumentsCopyWith<$Res> {
  _$CardListArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? deckCards = null,
    Object? filterSearch = freezed,
    Object? filterCollection = null,
    Object? filterPacks = null,
    Object? filterSides = null,
    Object? filterFactions = null,
    Object? filterTypes = null,
  }) {
    return _then(_value.copyWith(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as DeckResult,
      deckCards: null == deckCards
          ? _value.deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      filterSearch: freezed == filterSearch
          ? _value.filterSearch
          : filterSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      filterPacks: null == filterPacks
          ? _value.filterPacks
          : filterPacks // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterSides: null == filterSides
          ? _value.filterSides
          : filterSides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterFactions: null == filterFactions
          ? _value.filterFactions
          : filterFactions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterTypes: null == filterTypes
          ? _value.filterTypes
          : filterTypes // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeckResultCopyWith<$Res> get deck {
    return $DeckResultCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterPacks {
    return $FilterTypeCopyWith<String, $Res>(_value.filterPacks, (value) {
      return _then(_value.copyWith(filterPacks: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterSides {
    return $FilterTypeCopyWith<String, $Res>(_value.filterSides, (value) {
      return _then(_value.copyWith(filterSides: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterFactions {
    return $FilterTypeCopyWith<String, $Res>(_value.filterFactions, (value) {
      return _then(_value.copyWith(filterFactions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterTypes {
    return $FilterTypeCopyWith<String, $Res>(_value.filterTypes, (value) {
      return _then(_value.copyWith(filterTypes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardListArgumentsCopyWith<$Res>
    implements $CardListArgumentsCopyWith<$Res> {
  factory _$$_CardListArgumentsCopyWith(_$_CardListArguments value,
          $Res Function(_$_CardListArguments) then) =
      __$$_CardListArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeckResult deck,
      Map<String, int> deckCards,
      String? filterSearch,
      bool filterCollection,
      FilterType<String> filterPacks,
      FilterType<String> filterSides,
      FilterType<String> filterFactions,
      FilterType<String> filterTypes});

  @override
  $DeckResultCopyWith<$Res> get deck;
  @override
  $FilterTypeCopyWith<String, $Res> get filterPacks;
  @override
  $FilterTypeCopyWith<String, $Res> get filterSides;
  @override
  $FilterTypeCopyWith<String, $Res> get filterFactions;
  @override
  $FilterTypeCopyWith<String, $Res> get filterTypes;
}

/// @nodoc
class __$$_CardListArgumentsCopyWithImpl<$Res>
    extends _$CardListArgumentsCopyWithImpl<$Res, _$_CardListArguments>
    implements _$$_CardListArgumentsCopyWith<$Res> {
  __$$_CardListArgumentsCopyWithImpl(
      _$_CardListArguments _value, $Res Function(_$_CardListArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? deckCards = null,
    Object? filterSearch = freezed,
    Object? filterCollection = null,
    Object? filterPacks = null,
    Object? filterSides = null,
    Object? filterFactions = null,
    Object? filterTypes = null,
  }) {
    return _then(_$_CardListArguments(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as DeckResult,
      deckCards: null == deckCards
          ? _value._deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      filterSearch: freezed == filterSearch
          ? _value.filterSearch
          : filterSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      filterPacks: null == filterPacks
          ? _value.filterPacks
          : filterPacks // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterSides: null == filterSides
          ? _value.filterSides
          : filterSides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterFactions: null == filterFactions
          ? _value.filterFactions
          : filterFactions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterTypes: null == filterTypes
          ? _value.filterTypes
          : filterTypes // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardListArguments implements _CardListArguments {
  const _$_CardListArguments(
      {required this.deck,
      required final Map<String, int> deckCards,
      required this.filterSearch,
      required this.filterCollection,
      required this.filterPacks,
      required this.filterSides,
      required this.filterFactions,
      required this.filterTypes})
      : _deckCards = deckCards;

  factory _$_CardListArguments.fromJson(Map<String, dynamic> json) =>
      _$$_CardListArgumentsFromJson(json);

  @override
  final DeckResult deck;
  final Map<String, int> _deckCards;
  @override
  Map<String, int> get deckCards {
    if (_deckCards is EqualUnmodifiableMapView) return _deckCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deckCards);
  }

  @override
  final String? filterSearch;
  @override
  final bool filterCollection;
  @override
  final FilterType<String> filterPacks;
  @override
  final FilterType<String> filterSides;
  @override
  final FilterType<String> filterFactions;
  @override
  final FilterType<String> filterTypes;

  @override
  String toString() {
    return 'CardListArguments(deck: $deck, deckCards: $deckCards, filterSearch: $filterSearch, filterCollection: $filterCollection, filterPacks: $filterPacks, filterSides: $filterSides, filterFactions: $filterFactions, filterTypes: $filterTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardListArguments &&
            (identical(other.deck, deck) || other.deck == deck) &&
            const DeepCollectionEquality()
                .equals(other._deckCards, _deckCards) &&
            (identical(other.filterSearch, filterSearch) ||
                other.filterSearch == filterSearch) &&
            (identical(other.filterCollection, filterCollection) ||
                other.filterCollection == filterCollection) &&
            const DeepCollectionEquality()
                .equals(other.filterPacks, filterPacks) &&
            const DeepCollectionEquality()
                .equals(other.filterSides, filterSides) &&
            const DeepCollectionEquality()
                .equals(other.filterFactions, filterFactions) &&
            const DeepCollectionEquality()
                .equals(other.filterTypes, filterTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deck,
      const DeepCollectionEquality().hash(_deckCards),
      filterSearch,
      filterCollection,
      const DeepCollectionEquality().hash(filterPacks),
      const DeepCollectionEquality().hash(filterSides),
      const DeepCollectionEquality().hash(filterFactions),
      const DeepCollectionEquality().hash(filterTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardListArgumentsCopyWith<_$_CardListArguments> get copyWith =>
      __$$_CardListArgumentsCopyWithImpl<_$_CardListArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardListArgumentsToJson(
      this,
    );
  }
}

abstract class _CardListArguments implements CardListArguments {
  const factory _CardListArguments(
      {required final DeckResult deck,
      required final Map<String, int> deckCards,
      required final String? filterSearch,
      required final bool filterCollection,
      required final FilterType<String> filterPacks,
      required final FilterType<String> filterSides,
      required final FilterType<String> filterFactions,
      required final FilterType<String> filterTypes}) = _$_CardListArguments;

  factory _CardListArguments.fromJson(Map<String, dynamic> json) =
      _$_CardListArguments.fromJson;

  @override
  DeckResult get deck;
  @override
  Map<String, int> get deckCards;
  @override
  String? get filterSearch;
  @override
  bool get filterCollection;
  @override
  FilterType<String> get filterPacks;
  @override
  FilterType<String> get filterSides;
  @override
  FilterType<String> get filterFactions;
  @override
  FilterType<String> get filterTypes;
  @override
  @JsonKey(ignore: true)
  _$$_CardListArgumentsCopyWith<_$_CardListArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardListResults {
  Map<String, int> get deckCards => throw _privateConstructorUsedError;
  String? get filterSearch => throw _privateConstructorUsedError;
  bool get filterCollection => throw _privateConstructorUsedError;
  FilterType<String> get filterPacks => throw _privateConstructorUsedError;
  FilterType<String> get filterSides => throw _privateConstructorUsedError;
  FilterType<String> get filterFactions => throw _privateConstructorUsedError;
  FilterType<String> get filterTypes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardListResultsCopyWith<CardListResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardListResultsCopyWith<$Res> {
  factory $CardListResultsCopyWith(
          CardListResults value, $Res Function(CardListResults) then) =
      _$CardListResultsCopyWithImpl<$Res, CardListResults>;
  @useResult
  $Res call(
      {Map<String, int> deckCards,
      String? filterSearch,
      bool filterCollection,
      FilterType<String> filterPacks,
      FilterType<String> filterSides,
      FilterType<String> filterFactions,
      FilterType<String> filterTypes});

  $FilterTypeCopyWith<String, $Res> get filterPacks;
  $FilterTypeCopyWith<String, $Res> get filterSides;
  $FilterTypeCopyWith<String, $Res> get filterFactions;
  $FilterTypeCopyWith<String, $Res> get filterTypes;
}

/// @nodoc
class _$CardListResultsCopyWithImpl<$Res, $Val extends CardListResults>
    implements $CardListResultsCopyWith<$Res> {
  _$CardListResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCards = null,
    Object? filterSearch = freezed,
    Object? filterCollection = null,
    Object? filterPacks = null,
    Object? filterSides = null,
    Object? filterFactions = null,
    Object? filterTypes = null,
  }) {
    return _then(_value.copyWith(
      deckCards: null == deckCards
          ? _value.deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      filterSearch: freezed == filterSearch
          ? _value.filterSearch
          : filterSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      filterPacks: null == filterPacks
          ? _value.filterPacks
          : filterPacks // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterSides: null == filterSides
          ? _value.filterSides
          : filterSides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterFactions: null == filterFactions
          ? _value.filterFactions
          : filterFactions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterTypes: null == filterTypes
          ? _value.filterTypes
          : filterTypes // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterPacks {
    return $FilterTypeCopyWith<String, $Res>(_value.filterPacks, (value) {
      return _then(_value.copyWith(filterPacks: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterSides {
    return $FilterTypeCopyWith<String, $Res>(_value.filterSides, (value) {
      return _then(_value.copyWith(filterSides: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterFactions {
    return $FilterTypeCopyWith<String, $Res>(_value.filterFactions, (value) {
      return _then(_value.copyWith(filterFactions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get filterTypes {
    return $FilterTypeCopyWith<String, $Res>(_value.filterTypes, (value) {
      return _then(_value.copyWith(filterTypes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardListResultsCopyWith<$Res>
    implements $CardListResultsCopyWith<$Res> {
  factory _$$_CardListResultsCopyWith(
          _$_CardListResults value, $Res Function(_$_CardListResults) then) =
      __$$_CardListResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, int> deckCards,
      String? filterSearch,
      bool filterCollection,
      FilterType<String> filterPacks,
      FilterType<String> filterSides,
      FilterType<String> filterFactions,
      FilterType<String> filterTypes});

  @override
  $FilterTypeCopyWith<String, $Res> get filterPacks;
  @override
  $FilterTypeCopyWith<String, $Res> get filterSides;
  @override
  $FilterTypeCopyWith<String, $Res> get filterFactions;
  @override
  $FilterTypeCopyWith<String, $Res> get filterTypes;
}

/// @nodoc
class __$$_CardListResultsCopyWithImpl<$Res>
    extends _$CardListResultsCopyWithImpl<$Res, _$_CardListResults>
    implements _$$_CardListResultsCopyWith<$Res> {
  __$$_CardListResultsCopyWithImpl(
      _$_CardListResults _value, $Res Function(_$_CardListResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCards = null,
    Object? filterSearch = freezed,
    Object? filterCollection = null,
    Object? filterPacks = null,
    Object? filterSides = null,
    Object? filterFactions = null,
    Object? filterTypes = null,
  }) {
    return _then(_$_CardListResults(
      deckCards: null == deckCards
          ? _value._deckCards
          : deckCards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      filterSearch: freezed == filterSearch
          ? _value.filterSearch
          : filterSearch // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      filterPacks: null == filterPacks
          ? _value.filterPacks
          : filterPacks // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterSides: null == filterSides
          ? _value.filterSides
          : filterSides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterFactions: null == filterFactions
          ? _value.filterFactions
          : filterFactions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      filterTypes: null == filterTypes
          ? _value.filterTypes
          : filterTypes // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
    ));
  }
}

/// @nodoc

class _$_CardListResults implements _CardListResults {
  const _$_CardListResults(
      {required final Map<String, int> deckCards,
      required this.filterSearch,
      required this.filterCollection,
      required this.filterPacks,
      required this.filterSides,
      required this.filterFactions,
      required this.filterTypes})
      : _deckCards = deckCards;

  final Map<String, int> _deckCards;
  @override
  Map<String, int> get deckCards {
    if (_deckCards is EqualUnmodifiableMapView) return _deckCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deckCards);
  }

  @override
  final String? filterSearch;
  @override
  final bool filterCollection;
  @override
  final FilterType<String> filterPacks;
  @override
  final FilterType<String> filterSides;
  @override
  final FilterType<String> filterFactions;
  @override
  final FilterType<String> filterTypes;

  @override
  String toString() {
    return 'CardListResults(deckCards: $deckCards, filterSearch: $filterSearch, filterCollection: $filterCollection, filterPacks: $filterPacks, filterSides: $filterSides, filterFactions: $filterFactions, filterTypes: $filterTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardListResults &&
            const DeepCollectionEquality()
                .equals(other._deckCards, _deckCards) &&
            (identical(other.filterSearch, filterSearch) ||
                other.filterSearch == filterSearch) &&
            (identical(other.filterCollection, filterCollection) ||
                other.filterCollection == filterCollection) &&
            const DeepCollectionEquality()
                .equals(other.filterPacks, filterPacks) &&
            const DeepCollectionEquality()
                .equals(other.filterSides, filterSides) &&
            const DeepCollectionEquality()
                .equals(other.filterFactions, filterFactions) &&
            const DeepCollectionEquality()
                .equals(other.filterTypes, filterTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_deckCards),
      filterSearch,
      filterCollection,
      const DeepCollectionEquality().hash(filterPacks),
      const DeepCollectionEquality().hash(filterSides),
      const DeepCollectionEquality().hash(filterFactions),
      const DeepCollectionEquality().hash(filterTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardListResultsCopyWith<_$_CardListResults> get copyWith =>
      __$$_CardListResultsCopyWithImpl<_$_CardListResults>(this, _$identity);
}

abstract class _CardListResults implements CardListResults {
  const factory _CardListResults(
      {required final Map<String, int> deckCards,
      required final String? filterSearch,
      required final bool filterCollection,
      required final FilterType<String> filterPacks,
      required final FilterType<String> filterSides,
      required final FilterType<String> filterFactions,
      required final FilterType<String> filterTypes}) = _$_CardListResults;

  @override
  Map<String, int> get deckCards;
  @override
  String? get filterSearch;
  @override
  bool get filterCollection;
  @override
  FilterType<String> get filterPacks;
  @override
  FilterType<String> get filterSides;
  @override
  FilterType<String> get filterFactions;
  @override
  FilterType<String> get filterTypes;
  @override
  @JsonKey(ignore: true)
  _$$_CardListResultsCopyWith<_$_CardListResults> get copyWith =>
      throw _privateConstructorUsedError;
}
