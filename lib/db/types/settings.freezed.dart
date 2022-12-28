// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsData _$SettingsDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _SettingsData.fromJson(json);
    case 'result':
      return SettingsResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SettingsData',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SettingsData {
  bool get id => throw _privateConstructorUsedError;
  String? get filterFormatCode => throw _privateConstructorUsedError;
  String? get filterRotationCode => throw _privateConstructorUsedError;
  String? get filterMwlCode => throw _privateConstructorUsedError;
  bool get filterCollection => throw _privateConstructorUsedError;
  CardSort get cardSort => throw _privateConstructorUsedError;
  CardGroup get cardGroup => throw _privateConstructorUsedError;
  DeckSort get deckSort => throw _privateConstructorUsedError;
  DeckGroup get deckGroup => throw _privateConstructorUsedError;
  CardSort get deckCardSort => throw _privateConstructorUsedError;
  CardGroup get deckCardGroup => throw _privateConstructorUsedError;
  CardSort get compareCardSort => throw _privateConstructorUsedError;
  bool get apexResources => throw _privateConstructorUsedError;
  CardGalleryPageView get cardGalleryView => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)
        $default, {
    required TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)
        result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SettingsData value) $default, {
    required TResult Function(SettingsResult value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingsData value)? $default, {
    TResult? Function(SettingsResult value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingsData value)? $default, {
    TResult Function(SettingsResult value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsDataCopyWith<SettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDataCopyWith<$Res> {
  factory $SettingsDataCopyWith(
          SettingsData value, $Res Function(SettingsData) then) =
      _$SettingsDataCopyWithImpl<$Res, SettingsData>;
  @useResult
  $Res call(
      {bool id,
      String? filterFormatCode,
      String? filterRotationCode,
      String? filterMwlCode,
      bool filterCollection,
      CardSort cardSort,
      CardGroup cardGroup,
      DeckSort deckSort,
      DeckGroup deckGroup,
      CardSort deckCardSort,
      CardGroup deckCardGroup,
      CardSort compareCardSort,
      bool apexResources,
      CardGalleryPageView cardGalleryView});
}

/// @nodoc
class _$SettingsDataCopyWithImpl<$Res, $Val extends SettingsData>
    implements $SettingsDataCopyWith<$Res> {
  _$SettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filterFormatCode = freezed,
    Object? filterRotationCode = freezed,
    Object? filterMwlCode = freezed,
    Object? filterCollection = null,
    Object? cardSort = null,
    Object? cardGroup = null,
    Object? deckSort = null,
    Object? deckGroup = null,
    Object? deckCardSort = null,
    Object? deckCardGroup = null,
    Object? compareCardSort = null,
    Object? apexResources = null,
    Object? cardGalleryView = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as bool,
      filterFormatCode: freezed == filterFormatCode
          ? _value.filterFormatCode
          : filterFormatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterRotationCode: freezed == filterRotationCode
          ? _value.filterRotationCode
          : filterRotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterMwlCode: freezed == filterMwlCode
          ? _value.filterMwlCode
          : filterMwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSort: null == cardSort
          ? _value.cardSort
          : cardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      cardGroup: null == cardGroup
          ? _value.cardGroup
          : cardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      deckSort: null == deckSort
          ? _value.deckSort
          : deckSort // ignore: cast_nullable_to_non_nullable
              as DeckSort,
      deckGroup: null == deckGroup
          ? _value.deckGroup
          : deckGroup // ignore: cast_nullable_to_non_nullable
              as DeckGroup,
      deckCardSort: null == deckCardSort
          ? _value.deckCardSort
          : deckCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      deckCardGroup: null == deckCardGroup
          ? _value.deckCardGroup
          : deckCardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      compareCardSort: null == compareCardSort
          ? _value.compareCardSort
          : compareCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      apexResources: null == apexResources
          ? _value.apexResources
          : apexResources // ignore: cast_nullable_to_non_nullable
              as bool,
      cardGalleryView: null == cardGalleryView
          ? _value.cardGalleryView
          : cardGalleryView // ignore: cast_nullable_to_non_nullable
              as CardGalleryPageView,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsDataCopyWith<$Res>
    implements $SettingsDataCopyWith<$Res> {
  factory _$$_SettingsDataCopyWith(
          _$_SettingsData value, $Res Function(_$_SettingsData) then) =
      __$$_SettingsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool id,
      String? filterFormatCode,
      String? filterRotationCode,
      String? filterMwlCode,
      bool filterCollection,
      CardSort cardSort,
      CardGroup cardGroup,
      DeckSort deckSort,
      DeckGroup deckGroup,
      CardSort deckCardSort,
      CardGroup deckCardGroup,
      CardSort compareCardSort,
      bool apexResources,
      CardGalleryPageView cardGalleryView});
}

/// @nodoc
class __$$_SettingsDataCopyWithImpl<$Res>
    extends _$SettingsDataCopyWithImpl<$Res, _$_SettingsData>
    implements _$$_SettingsDataCopyWith<$Res> {
  __$$_SettingsDataCopyWithImpl(
      _$_SettingsData _value, $Res Function(_$_SettingsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filterFormatCode = freezed,
    Object? filterRotationCode = freezed,
    Object? filterMwlCode = freezed,
    Object? filterCollection = null,
    Object? cardSort = null,
    Object? cardGroup = null,
    Object? deckSort = null,
    Object? deckGroup = null,
    Object? deckCardSort = null,
    Object? deckCardGroup = null,
    Object? compareCardSort = null,
    Object? apexResources = null,
    Object? cardGalleryView = null,
  }) {
    return _then(_$_SettingsData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as bool,
      filterFormatCode: freezed == filterFormatCode
          ? _value.filterFormatCode
          : filterFormatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterRotationCode: freezed == filterRotationCode
          ? _value.filterRotationCode
          : filterRotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterMwlCode: freezed == filterMwlCode
          ? _value.filterMwlCode
          : filterMwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSort: null == cardSort
          ? _value.cardSort
          : cardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      cardGroup: null == cardGroup
          ? _value.cardGroup
          : cardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      deckSort: null == deckSort
          ? _value.deckSort
          : deckSort // ignore: cast_nullable_to_non_nullable
              as DeckSort,
      deckGroup: null == deckGroup
          ? _value.deckGroup
          : deckGroup // ignore: cast_nullable_to_non_nullable
              as DeckGroup,
      deckCardSort: null == deckCardSort
          ? _value.deckCardSort
          : deckCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      deckCardGroup: null == deckCardGroup
          ? _value.deckCardGroup
          : deckCardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      compareCardSort: null == compareCardSort
          ? _value.compareCardSort
          : compareCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      apexResources: null == apexResources
          ? _value.apexResources
          : apexResources // ignore: cast_nullable_to_non_nullable
              as bool,
      cardGalleryView: null == cardGalleryView
          ? _value.cardGalleryView
          : cardGalleryView // ignore: cast_nullable_to_non_nullable
              as CardGalleryPageView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsData extends _SettingsData {
  const _$_SettingsData(
      {required this.id,
      required this.filterFormatCode,
      required this.filterRotationCode,
      required this.filterMwlCode,
      required this.filterCollection,
      required this.cardSort,
      required this.cardGroup,
      required this.deckSort,
      required this.deckGroup,
      required this.deckCardSort,
      required this.deckCardGroup,
      required this.compareCardSort,
      required this.apexResources,
      required this.cardGalleryView,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_SettingsData.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsDataFromJson(json);

  @override
  final bool id;
  @override
  final String? filterFormatCode;
  @override
  final String? filterRotationCode;
  @override
  final String? filterMwlCode;
  @override
  final bool filterCollection;
  @override
  final CardSort cardSort;
  @override
  final CardGroup cardGroup;
  @override
  final DeckSort deckSort;
  @override
  final DeckGroup deckGroup;
  @override
  final CardSort deckCardSort;
  @override
  final CardGroup deckCardGroup;
  @override
  final CardSort compareCardSort;
  @override
  final bool apexResources;
  @override
  final CardGalleryPageView cardGalleryView;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SettingsData(id: $id, filterFormatCode: $filterFormatCode, filterRotationCode: $filterRotationCode, filterMwlCode: $filterMwlCode, filterCollection: $filterCollection, cardSort: $cardSort, cardGroup: $cardGroup, deckSort: $deckSort, deckGroup: $deckGroup, deckCardSort: $deckCardSort, deckCardGroup: $deckCardGroup, compareCardSort: $compareCardSort, apexResources: $apexResources, cardGalleryView: $cardGalleryView)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filterFormatCode, filterFormatCode) ||
                other.filterFormatCode == filterFormatCode) &&
            (identical(other.filterRotationCode, filterRotationCode) ||
                other.filterRotationCode == filterRotationCode) &&
            (identical(other.filterMwlCode, filterMwlCode) ||
                other.filterMwlCode == filterMwlCode) &&
            (identical(other.filterCollection, filterCollection) ||
                other.filterCollection == filterCollection) &&
            (identical(other.cardSort, cardSort) ||
                other.cardSort == cardSort) &&
            (identical(other.cardGroup, cardGroup) ||
                other.cardGroup == cardGroup) &&
            (identical(other.deckSort, deckSort) ||
                other.deckSort == deckSort) &&
            (identical(other.deckGroup, deckGroup) ||
                other.deckGroup == deckGroup) &&
            (identical(other.deckCardSort, deckCardSort) ||
                other.deckCardSort == deckCardSort) &&
            (identical(other.deckCardGroup, deckCardGroup) ||
                other.deckCardGroup == deckCardGroup) &&
            (identical(other.compareCardSort, compareCardSort) ||
                other.compareCardSort == compareCardSort) &&
            (identical(other.apexResources, apexResources) ||
                other.apexResources == apexResources) &&
            (identical(other.cardGalleryView, cardGalleryView) ||
                other.cardGalleryView == cardGalleryView));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      filterFormatCode,
      filterRotationCode,
      filterMwlCode,
      filterCollection,
      cardSort,
      cardGroup,
      deckSort,
      deckGroup,
      deckCardSort,
      deckCardGroup,
      compareCardSort,
      apexResources,
      cardGalleryView);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsDataCopyWith<_$_SettingsData> get copyWith =>
      __$$_SettingsDataCopyWithImpl<_$_SettingsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)
        $default, {
    required TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)
        result,
  }) {
    return $default(
        id,
        filterFormatCode,
        filterRotationCode,
        filterMwlCode,
        filterCollection,
        cardSort,
        cardGroup,
        deckSort,
        deckGroup,
        deckCardSort,
        deckCardGroup,
        compareCardSort,
        apexResources,
        cardGalleryView);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
  }) {
    return $default?.call(
        id,
        filterFormatCode,
        filterRotationCode,
        filterMwlCode,
        filterCollection,
        cardSort,
        cardGroup,
        deckSort,
        deckGroup,
        deckCardSort,
        deckCardGroup,
        compareCardSort,
        apexResources,
        cardGalleryView);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id,
          filterFormatCode,
          filterRotationCode,
          filterMwlCode,
          filterCollection,
          cardSort,
          cardGroup,
          deckSort,
          deckGroup,
          deckCardSort,
          deckCardGroup,
          compareCardSort,
          apexResources,
          cardGalleryView);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SettingsData value) $default, {
    required TResult Function(SettingsResult value) result,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingsData value)? $default, {
    TResult? Function(SettingsResult value)? result,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingsData value)? $default, {
    TResult Function(SettingsResult value)? result,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsDataToJson(
      this,
    );
  }
}

abstract class _SettingsData extends SettingsData {
  const factory _SettingsData(
      {required final bool id,
      required final String? filterFormatCode,
      required final String? filterRotationCode,
      required final String? filterMwlCode,
      required final bool filterCollection,
      required final CardSort cardSort,
      required final CardGroup cardGroup,
      required final DeckSort deckSort,
      required final DeckGroup deckGroup,
      required final CardSort deckCardSort,
      required final CardGroup deckCardGroup,
      required final CardSort compareCardSort,
      required final bool apexResources,
      required final CardGalleryPageView cardGalleryView}) = _$_SettingsData;
  const _SettingsData._() : super._();

  factory _SettingsData.fromJson(Map<String, dynamic> json) =
      _$_SettingsData.fromJson;

  @override
  bool get id;
  @override
  String? get filterFormatCode;
  @override
  String? get filterRotationCode;
  @override
  String? get filterMwlCode;
  @override
  bool get filterCollection;
  @override
  CardSort get cardSort;
  @override
  CardGroup get cardGroup;
  @override
  DeckSort get deckSort;
  @override
  DeckGroup get deckGroup;
  @override
  CardSort get deckCardSort;
  @override
  CardGroup get deckCardGroup;
  @override
  CardSort get compareCardSort;
  @override
  bool get apexResources;
  @override
  CardGalleryPageView get cardGalleryView;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsDataCopyWith<_$_SettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsResultCopyWith<$Res>
    implements $SettingsDataCopyWith<$Res> {
  factory _$$SettingsResultCopyWith(
          _$SettingsResult value, $Res Function(_$SettingsResult) then) =
      __$$SettingsResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool id,
      String? filterFormatCode,
      String? filterRotationCode,
      String? filterMwlCode,
      bool filterCollection,
      CardSort cardSort,
      CardGroup cardGroup,
      DeckSort deckSort,
      DeckGroup deckGroup,
      CardSort deckCardSort,
      CardGroup deckCardGroup,
      CardSort compareCardSort,
      bool apexResources,
      CardGalleryPageView cardGalleryView,
      FormatData? filterFormat,
      RotationViewData? filterRotation,
      MwlViewData? filterMwl});

  $FormatDataCopyWith<$Res>? get filterFormat;
}

/// @nodoc
class __$$SettingsResultCopyWithImpl<$Res>
    extends _$SettingsDataCopyWithImpl<$Res, _$SettingsResult>
    implements _$$SettingsResultCopyWith<$Res> {
  __$$SettingsResultCopyWithImpl(
      _$SettingsResult _value, $Res Function(_$SettingsResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filterFormatCode = freezed,
    Object? filterRotationCode = freezed,
    Object? filterMwlCode = freezed,
    Object? filterCollection = null,
    Object? cardSort = null,
    Object? cardGroup = null,
    Object? deckSort = null,
    Object? deckGroup = null,
    Object? deckCardSort = null,
    Object? deckCardGroup = null,
    Object? compareCardSort = null,
    Object? apexResources = null,
    Object? cardGalleryView = null,
    Object? filterFormat = freezed,
    Object? filterRotation = freezed,
    Object? filterMwl = freezed,
  }) {
    return _then(_$SettingsResult(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as bool,
      filterFormatCode: freezed == filterFormatCode
          ? _value.filterFormatCode
          : filterFormatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterRotationCode: freezed == filterRotationCode
          ? _value.filterRotationCode
          : filterRotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterMwlCode: freezed == filterMwlCode
          ? _value.filterMwlCode
          : filterMwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      filterCollection: null == filterCollection
          ? _value.filterCollection
          : filterCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSort: null == cardSort
          ? _value.cardSort
          : cardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      cardGroup: null == cardGroup
          ? _value.cardGroup
          : cardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      deckSort: null == deckSort
          ? _value.deckSort
          : deckSort // ignore: cast_nullable_to_non_nullable
              as DeckSort,
      deckGroup: null == deckGroup
          ? _value.deckGroup
          : deckGroup // ignore: cast_nullable_to_non_nullable
              as DeckGroup,
      deckCardSort: null == deckCardSort
          ? _value.deckCardSort
          : deckCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      deckCardGroup: null == deckCardGroup
          ? _value.deckCardGroup
          : deckCardGroup // ignore: cast_nullable_to_non_nullable
              as CardGroup,
      compareCardSort: null == compareCardSort
          ? _value.compareCardSort
          : compareCardSort // ignore: cast_nullable_to_non_nullable
              as CardSort,
      apexResources: null == apexResources
          ? _value.apexResources
          : apexResources // ignore: cast_nullable_to_non_nullable
              as bool,
      cardGalleryView: null == cardGalleryView
          ? _value.cardGalleryView
          : cardGalleryView // ignore: cast_nullable_to_non_nullable
              as CardGalleryPageView,
      filterFormat: freezed == filterFormat
          ? _value.filterFormat
          : filterFormat // ignore: cast_nullable_to_non_nullable
              as FormatData?,
      filterRotation: freezed == filterRotation
          ? _value.filterRotation
          : filterRotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData?,
      filterMwl: freezed == filterMwl
          ? _value.filterMwl
          : filterMwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FormatDataCopyWith<$Res>? get filterFormat {
    if (_value.filterFormat == null) {
      return null;
    }

    return $FormatDataCopyWith<$Res>(_value.filterFormat!, (value) {
      return _then(_value.copyWith(filterFormat: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsResult extends SettingsResult {
  const _$SettingsResult(
      {required this.id,
      required this.filterFormatCode,
      required this.filterRotationCode,
      required this.filterMwlCode,
      required this.filterCollection,
      required this.cardSort,
      required this.cardGroup,
      required this.deckSort,
      required this.deckGroup,
      required this.deckCardSort,
      required this.deckCardGroup,
      required this.compareCardSort,
      required this.apexResources,
      required this.cardGalleryView,
      required this.filterFormat,
      required this.filterRotation,
      required this.filterMwl,
      final String? $type})
      : $type = $type ?? 'result',
        super._();

  factory _$SettingsResult.fromJson(Map<String, dynamic> json) =>
      _$$SettingsResultFromJson(json);

  @override
  final bool id;
  @override
  final String? filterFormatCode;
  @override
  final String? filterRotationCode;
  @override
  final String? filterMwlCode;
  @override
  final bool filterCollection;
  @override
  final CardSort cardSort;
  @override
  final CardGroup cardGroup;
  @override
  final DeckSort deckSort;
  @override
  final DeckGroup deckGroup;
  @override
  final CardSort deckCardSort;
  @override
  final CardGroup deckCardGroup;
  @override
  final CardSort compareCardSort;
  @override
  final bool apexResources;
  @override
  final CardGalleryPageView cardGalleryView;
  @override
  final FormatData? filterFormat;
  @override
  final RotationViewData? filterRotation;
  @override
  final MwlViewData? filterMwl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SettingsData.result(id: $id, filterFormatCode: $filterFormatCode, filterRotationCode: $filterRotationCode, filterMwlCode: $filterMwlCode, filterCollection: $filterCollection, cardSort: $cardSort, cardGroup: $cardGroup, deckSort: $deckSort, deckGroup: $deckGroup, deckCardSort: $deckCardSort, deckCardGroup: $deckCardGroup, compareCardSort: $compareCardSort, apexResources: $apexResources, cardGalleryView: $cardGalleryView, filterFormat: $filterFormat, filterRotation: $filterRotation, filterMwl: $filterMwl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filterFormatCode, filterFormatCode) ||
                other.filterFormatCode == filterFormatCode) &&
            (identical(other.filterRotationCode, filterRotationCode) ||
                other.filterRotationCode == filterRotationCode) &&
            (identical(other.filterMwlCode, filterMwlCode) ||
                other.filterMwlCode == filterMwlCode) &&
            (identical(other.filterCollection, filterCollection) ||
                other.filterCollection == filterCollection) &&
            (identical(other.cardSort, cardSort) ||
                other.cardSort == cardSort) &&
            (identical(other.cardGroup, cardGroup) ||
                other.cardGroup == cardGroup) &&
            (identical(other.deckSort, deckSort) ||
                other.deckSort == deckSort) &&
            (identical(other.deckGroup, deckGroup) ||
                other.deckGroup == deckGroup) &&
            (identical(other.deckCardSort, deckCardSort) ||
                other.deckCardSort == deckCardSort) &&
            (identical(other.deckCardGroup, deckCardGroup) ||
                other.deckCardGroup == deckCardGroup) &&
            (identical(other.compareCardSort, compareCardSort) ||
                other.compareCardSort == compareCardSort) &&
            (identical(other.apexResources, apexResources) ||
                other.apexResources == apexResources) &&
            (identical(other.cardGalleryView, cardGalleryView) ||
                other.cardGalleryView == cardGalleryView) &&
            (identical(other.filterFormat, filterFormat) ||
                other.filterFormat == filterFormat) &&
            (identical(other.filterRotation, filterRotation) ||
                other.filterRotation == filterRotation) &&
            (identical(other.filterMwl, filterMwl) ||
                other.filterMwl == filterMwl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      filterFormatCode,
      filterRotationCode,
      filterMwlCode,
      filterCollection,
      cardSort,
      cardGroup,
      deckSort,
      deckGroup,
      deckCardSort,
      deckCardGroup,
      compareCardSort,
      apexResources,
      cardGalleryView,
      filterFormat,
      filterRotation,
      filterMwl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsResultCopyWith<_$SettingsResult> get copyWith =>
      __$$SettingsResultCopyWithImpl<_$SettingsResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)
        $default, {
    required TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)
        result,
  }) {
    return result(
        id,
        filterFormatCode,
        filterRotationCode,
        filterMwlCode,
        filterCollection,
        cardSort,
        cardGroup,
        deckSort,
        deckGroup,
        deckCardSort,
        deckCardGroup,
        compareCardSort,
        apexResources,
        cardGalleryView,
        filterFormat,
        filterRotation,
        filterMwl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult? Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
  }) {
    return result?.call(
        id,
        filterFormatCode,
        filterRotationCode,
        filterMwlCode,
        filterCollection,
        cardSort,
        cardGroup,
        deckSort,
        deckGroup,
        deckCardSort,
        deckCardGroup,
        compareCardSort,
        apexResources,
        cardGalleryView,
        filterFormat,
        filterRotation,
        filterMwl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView)?
        $default, {
    TResult Function(
            bool id,
            String? filterFormatCode,
            String? filterRotationCode,
            String? filterMwlCode,
            bool filterCollection,
            CardSort cardSort,
            CardGroup cardGroup,
            DeckSort deckSort,
            DeckGroup deckGroup,
            CardSort deckCardSort,
            CardGroup deckCardGroup,
            CardSort compareCardSort,
            bool apexResources,
            CardGalleryPageView cardGalleryView,
            FormatData? filterFormat,
            RotationViewData? filterRotation,
            MwlViewData? filterMwl)?
        result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(
          id,
          filterFormatCode,
          filterRotationCode,
          filterMwlCode,
          filterCollection,
          cardSort,
          cardGroup,
          deckSort,
          deckGroup,
          deckCardSort,
          deckCardGroup,
          compareCardSort,
          apexResources,
          cardGalleryView,
          filterFormat,
          filterRotation,
          filterMwl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SettingsData value) $default, {
    required TResult Function(SettingsResult value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingsData value)? $default, {
    TResult? Function(SettingsResult value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingsData value)? $default, {
    TResult Function(SettingsResult value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsResultToJson(
      this,
    );
  }
}

abstract class SettingsResult extends SettingsData {
  const factory SettingsResult(
      {required final bool id,
      required final String? filterFormatCode,
      required final String? filterRotationCode,
      required final String? filterMwlCode,
      required final bool filterCollection,
      required final CardSort cardSort,
      required final CardGroup cardGroup,
      required final DeckSort deckSort,
      required final DeckGroup deckGroup,
      required final CardSort deckCardSort,
      required final CardGroup deckCardGroup,
      required final CardSort compareCardSort,
      required final bool apexResources,
      required final CardGalleryPageView cardGalleryView,
      required final FormatData? filterFormat,
      required final RotationViewData? filterRotation,
      required final MwlViewData? filterMwl}) = _$SettingsResult;
  const SettingsResult._() : super._();

  factory SettingsResult.fromJson(Map<String, dynamic> json) =
      _$SettingsResult.fromJson;

  @override
  bool get id;
  @override
  String? get filterFormatCode;
  @override
  String? get filterRotationCode;
  @override
  String? get filterMwlCode;
  @override
  bool get filterCollection;
  @override
  CardSort get cardSort;
  @override
  CardGroup get cardGroup;
  @override
  DeckSort get deckSort;
  @override
  DeckGroup get deckGroup;
  @override
  CardSort get deckCardSort;
  @override
  CardGroup get deckCardGroup;
  @override
  CardSort get compareCardSort;
  @override
  bool get apexResources;
  @override
  CardGalleryPageView get cardGalleryView;
  FormatData? get filterFormat;
  RotationViewData? get filterRotation;
  MwlViewData? get filterMwl;
  @override
  @JsonKey(ignore: true)
  _$$SettingsResultCopyWith<_$SettingsResult> get copyWith =>
      throw _privateConstructorUsedError;
}
