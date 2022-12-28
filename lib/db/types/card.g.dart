// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardData _$$_CardDataFromJson(Map json) => _$_CardData(
      code: json['code'] as String,
      packCode: json['pack_code'] as String,
      factionCode: json['faction_code'] as String,
      typeCode: json['type_code'] as String,
      position: json['position'] as int,
      title: json['title'] as String,
      body: json['body'] as String?,
      keywords: json['keywords'] as String?,
      quantity: json['quantity'] as int,
      cost: json['cost'] as int?,
      deckLimit: json['deck_limit'] as int,
      factionCost: json['faction_cost'] as int,
      uniqueness: json['uniqueness'] as bool,
      strength: json['strength'] as int?,
      agendaPoints: json['agenda_points'] as int?,
      memoryCost: json['memory_cost'] as int?,
      advancementCost: json['advancement_cost'] as int?,
      trashCost: json['trash_cost'] as int?,
      baseLink: json['base_link'] as int?,
      influenceLimit: json['influence_limit'] as int?,
      minimumDeckSize: json['minimum_deck_size'] as int?,
      flavor: json['flavor'] as String?,
      illustrator: json['illustrator'] as String?,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$_CardDataToJson(_$_CardData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'pack_code': instance.packCode,
      'faction_code': instance.factionCode,
      'type_code': instance.typeCode,
      'position': instance.position,
      'title': instance.title,
      'body': instance.body,
      'keywords': instance.keywords,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'deck_limit': instance.deckLimit,
      'faction_cost': instance.factionCost,
      'uniqueness': instance.uniqueness,
      'strength': instance.strength,
      'agenda_points': instance.agendaPoints,
      'memory_cost': instance.memoryCost,
      'advancement_cost': instance.advancementCost,
      'trash_cost': instance.trashCost,
      'base_link': instance.baseLink,
      'influence_limit': instance.influenceLimit,
      'minimum_deck_size': instance.minimumDeckSize,
      'flavor': instance.flavor,
      'illustrator': instance.illustrator,
      'image_url': instance.imageUrl,
    };

_$_CardResult _$$_CardResultFromJson(Map json) => _$_CardResult(
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

Map<String, dynamic> _$$_CardResultToJson(_$_CardResult instance) =>
    <String, dynamic>{
      'card': instance.card.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'faction': instance.faction.toJson(),
      'side': instance.side.toJson(),
      'type': instance.type.toJson(),
      'subtype': instance.subtype?.toJson(),
    };
