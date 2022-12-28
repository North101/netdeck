// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeckCardData _$DeckCardDataFromJson(Map<String, dynamic> json) {
  return _DeckCardData.fromJson(json);
}

/// @nodoc
mixin _$DeckCardData {
  String get deckId => throw _privateConstructorUsedError;
  String get cardCode => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCardDataCopyWith<DeckCardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCardDataCopyWith<$Res> {
  factory $DeckCardDataCopyWith(
          DeckCardData value, $Res Function(DeckCardData) then) =
      _$DeckCardDataCopyWithImpl<$Res, DeckCardData>;
  @useResult
  $Res call({String deckId, String cardCode, int quantity});
}

/// @nodoc
class _$DeckCardDataCopyWithImpl<$Res, $Val extends DeckCardData>
    implements $DeckCardDataCopyWith<$Res> {
  _$DeckCardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckId = null,
    Object? cardCode = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      deckId: null == deckId
          ? _value.deckId
          : deckId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCode: null == cardCode
          ? _value.cardCode
          : cardCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCardDataCopyWith<$Res>
    implements $DeckCardDataCopyWith<$Res> {
  factory _$$_DeckCardDataCopyWith(
          _$_DeckCardData value, $Res Function(_$_DeckCardData) then) =
      __$$_DeckCardDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deckId, String cardCode, int quantity});
}

/// @nodoc
class __$$_DeckCardDataCopyWithImpl<$Res>
    extends _$DeckCardDataCopyWithImpl<$Res, _$_DeckCardData>
    implements _$$_DeckCardDataCopyWith<$Res> {
  __$$_DeckCardDataCopyWithImpl(
      _$_DeckCardData _value, $Res Function(_$_DeckCardData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckId = null,
    Object? cardCode = null,
    Object? quantity = null,
  }) {
    return _then(_$_DeckCardData(
      deckId: null == deckId
          ? _value.deckId
          : deckId // ignore: cast_nullable_to_non_nullable
              as String,
      cardCode: null == cardCode
          ? _value.cardCode
          : cardCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckCardData extends _DeckCardData {
  const _$_DeckCardData(
      {required this.deckId, required this.cardCode, required this.quantity})
      : super._();

  factory _$_DeckCardData.fromJson(Map<String, dynamic> json) =>
      _$$_DeckCardDataFromJson(json);

  @override
  final String deckId;
  @override
  final String cardCode;
  @override
  final int quantity;

  @override
  String toString() {
    return 'DeckCardData(deckId: $deckId, cardCode: $cardCode, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCardData &&
            (identical(other.deckId, deckId) || other.deckId == deckId) &&
            (identical(other.cardCode, cardCode) ||
                other.cardCode == cardCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deckId, cardCode, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCardDataCopyWith<_$_DeckCardData> get copyWith =>
      __$$_DeckCardDataCopyWithImpl<_$_DeckCardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckCardDataToJson(
      this,
    );
  }
}

abstract class _DeckCardData extends DeckCardData {
  const factory _DeckCardData(
      {required final String deckId,
      required final String cardCode,
      required final int quantity}) = _$_DeckCardData;
  const _DeckCardData._() : super._();

  factory _DeckCardData.fromJson(Map<String, dynamic> json) =
      _$_DeckCardData.fromJson;

  @override
  String get deckId;
  @override
  String get cardCode;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCardDataCopyWith<_$_DeckCardData> get copyWith =>
      throw _privateConstructorUsedError;
}

DeckCardResult _$DeckCardResultFromJson(Map<String, dynamic> json) {
  return _DeckCardResult.fromJson(json);
}

/// @nodoc
mixin _$DeckCardResult {
  DeckCardData get deckCard => throw _privateConstructorUsedError;
  CardData get card => throw _privateConstructorUsedError;
  PackData get pack => throw _privateConstructorUsedError;
  CycleData get cycle => throw _privateConstructorUsedError;
  FactionData get faction => throw _privateConstructorUsedError;
  SideData get side => throw _privateConstructorUsedError;
  TypeData get type => throw _privateConstructorUsedError;
  TypeData? get subtype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCardResultCopyWith<DeckCardResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCardResultCopyWith<$Res> {
  factory $DeckCardResultCopyWith(
          DeckCardResult value, $Res Function(DeckCardResult) then) =
      _$DeckCardResultCopyWithImpl<$Res, DeckCardResult>;
  @useResult
  $Res call(
      {DeckCardData deckCard,
      CardData card,
      PackData pack,
      CycleData cycle,
      FactionData faction,
      SideData side,
      TypeData type,
      TypeData? subtype});

  $DeckCardDataCopyWith<$Res> get deckCard;
  $CardDataCopyWith<$Res> get card;
  $PackDataCopyWith<$Res> get pack;
  $CycleDataCopyWith<$Res> get cycle;
  $FactionDataCopyWith<$Res> get faction;
  $SideDataCopyWith<$Res> get side;
  $TypeDataCopyWith<$Res> get type;
  $TypeDataCopyWith<$Res>? get subtype;
}

/// @nodoc
class _$DeckCardResultCopyWithImpl<$Res, $Val extends DeckCardResult>
    implements $DeckCardResultCopyWith<$Res> {
  _$DeckCardResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCard = null,
    Object? card = null,
    Object? pack = null,
    Object? cycle = null,
    Object? faction = null,
    Object? side = null,
    Object? type = null,
    Object? subtype = freezed,
  }) {
    return _then(_value.copyWith(
      deckCard: null == deckCard
          ? _value.deckCard
          : deckCard // ignore: cast_nullable_to_non_nullable
              as DeckCardData,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as TypeData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeckCardDataCopyWith<$Res> get deckCard {
    return $DeckCardDataCopyWith<$Res>(_value.deckCard, (value) {
      return _then(_value.copyWith(deckCard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<$Res> get card {
    return $CardDataCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PackDataCopyWith<$Res> get pack {
    return $PackDataCopyWith<$Res>(_value.pack, (value) {
      return _then(_value.copyWith(pack: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CycleDataCopyWith<$Res> get cycle {
    return $CycleDataCopyWith<$Res>(_value.cycle, (value) {
      return _then(_value.copyWith(cycle: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $TypeDataCopyWith<$Res> get type {
    return $TypeDataCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeDataCopyWith<$Res>? get subtype {
    if (_value.subtype == null) {
      return null;
    }

    return $TypeDataCopyWith<$Res>(_value.subtype!, (value) {
      return _then(_value.copyWith(subtype: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeckCardResultCopyWith<$Res>
    implements $DeckCardResultCopyWith<$Res> {
  factory _$$_DeckCardResultCopyWith(
          _$_DeckCardResult value, $Res Function(_$_DeckCardResult) then) =
      __$$_DeckCardResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeckCardData deckCard,
      CardData card,
      PackData pack,
      CycleData cycle,
      FactionData faction,
      SideData side,
      TypeData type,
      TypeData? subtype});

  @override
  $DeckCardDataCopyWith<$Res> get deckCard;
  @override
  $CardDataCopyWith<$Res> get card;
  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
  @override
  $FactionDataCopyWith<$Res> get faction;
  @override
  $SideDataCopyWith<$Res> get side;
  @override
  $TypeDataCopyWith<$Res> get type;
  @override
  $TypeDataCopyWith<$Res>? get subtype;
}

/// @nodoc
class __$$_DeckCardResultCopyWithImpl<$Res>
    extends _$DeckCardResultCopyWithImpl<$Res, _$_DeckCardResult>
    implements _$$_DeckCardResultCopyWith<$Res> {
  __$$_DeckCardResultCopyWithImpl(
      _$_DeckCardResult _value, $Res Function(_$_DeckCardResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCard = null,
    Object? card = null,
    Object? pack = null,
    Object? cycle = null,
    Object? faction = null,
    Object? side = null,
    Object? type = null,
    Object? subtype = freezed,
  }) {
    return _then(_$_DeckCardResult(
      deckCard: null == deckCard
          ? _value.deckCard
          : deckCard // ignore: cast_nullable_to_non_nullable
              as DeckCardData,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as TypeData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckCardResult extends _DeckCardResult {
  const _$_DeckCardResult(
      {required this.deckCard,
      required this.card,
      required this.pack,
      required this.cycle,
      required this.faction,
      required this.side,
      required this.type,
      required this.subtype})
      : super._();

  factory _$_DeckCardResult.fromJson(Map<String, dynamic> json) =>
      _$$_DeckCardResultFromJson(json);

  @override
  final DeckCardData deckCard;
  @override
  final CardData card;
  @override
  final PackData pack;
  @override
  final CycleData cycle;
  @override
  final FactionData faction;
  @override
  final SideData side;
  @override
  final TypeData type;
  @override
  final TypeData? subtype;

  @override
  String toString() {
    return 'DeckCardResult(deckCard: $deckCard, card: $card, pack: $pack, cycle: $cycle, faction: $faction, side: $side, type: $type, subtype: $subtype)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCardResult &&
            (identical(other.deckCard, deckCard) ||
                other.deckCard == deckCard) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.faction, faction) || other.faction == faction) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subtype, subtype) || other.subtype == subtype));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, deckCard, card, pack, cycle, faction, side, type, subtype);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCardResultCopyWith<_$_DeckCardResult> get copyWith =>
      __$$_DeckCardResultCopyWithImpl<_$_DeckCardResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckCardResultToJson(
      this,
    );
  }
}

abstract class _DeckCardResult extends DeckCardResult {
  const factory _DeckCardResult(
      {required final DeckCardData deckCard,
      required final CardData card,
      required final PackData pack,
      required final CycleData cycle,
      required final FactionData faction,
      required final SideData side,
      required final TypeData type,
      required final TypeData? subtype}) = _$_DeckCardResult;
  const _DeckCardResult._() : super._();

  factory _DeckCardResult.fromJson(Map<String, dynamic> json) =
      _$_DeckCardResult.fromJson;

  @override
  DeckCardData get deckCard;
  @override
  CardData get card;
  @override
  PackData get pack;
  @override
  CycleData get cycle;
  @override
  FactionData get faction;
  @override
  SideData get side;
  @override
  TypeData get type;
  @override
  TypeData? get subtype;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCardResultCopyWith<_$_DeckCardResult> get copyWith =>
      throw _privateConstructorUsedError;
}
