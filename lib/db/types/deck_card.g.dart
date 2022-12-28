// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckCardData _$$_DeckCardDataFromJson(Map json) => _$_DeckCardData(
      deckId: json['deck_id'] as String,
      cardCode: json['card_code'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_DeckCardDataToJson(_$_DeckCardData instance) =>
    <String, dynamic>{
      'deck_id': instance.deckId,
      'card_code': instance.cardCode,
      'quantity': instance.quantity,
    };

_$_DeckCardResult _$$_DeckCardResultFromJson(Map json) => _$_DeckCardResult(
      deckCard: DeckCardData.fromJson(
          Map<String, dynamic>.from(json['deck_card'] as Map)),
      card: CardData.fromJson(Map<String, dynamic>.from(json['card'] as Map)),
      pack: PackData.fromJson(Map<String, dynamic>.from(json['pack'] as Map)),
      cycle:
          CycleData.fromJson(Map<String, dynamic>.from(json['cycle'] as Map)),
      faction: FactionData.fromJson(
          Map<String, dynamic>.from(json['faction'] as Map)),
      side: SideData.fromJson(Map<String, dynamic>.from(json['side'] as Map)),
      type: TypeData.fromJson(Map<String, dynamic>.from(json['type'] as Map)),
      subtype: json['subtype'] == null
          ? null
          : TypeData.fromJson(
              Map<String, dynamic>.from(json['subtype'] as Map)),
    );

Map<String, dynamic> _$$_DeckCardResultToJson(_$_DeckCardResult instance) =>
    <String, dynamic>{
      'deck_card': instance.deckCard.toJson(),
      'card': instance.card.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'faction': instance.faction.toJson(),
      'side': instance.side.toJson(),
      'type': instance.type.toJson(),
      'subtype': instance.subtype?.toJson(),
    };
