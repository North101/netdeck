// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckData _$$_DeckDataFromJson(Map json) => _$_DeckData(
      id: json['id'] as String,
      identityCode: json['identity_code'] as String,
      formatCode: json['format_code'] as String?,
      rotationCode: json['rotation_code'] as String?,
      mwlCode: json['mwl_code'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      deleted: json['deleted'] as bool,
      remoteUpdated: json['remote_updated'] == null
          ? null
          : DateTime.parse(json['remote_updated'] as String),
      synced: json['synced'] == null
          ? null
          : DateTime.parse(json['synced'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_DeckDataToJson(_$_DeckData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identity_code': instance.identityCode,
      'format_code': instance.formatCode,
      'rotation_code': instance.rotationCode,
      'mwl_code': instance.mwlCode,
      'name': instance.name,
      'description': instance.description,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'deleted': instance.deleted,
      'remote_updated': instance.remoteUpdated?.toIso8601String(),
      'synced': instance.synced?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$DeckNotifierData _$$DeckNotifierDataFromJson(Map json) => _$DeckNotifierData(
      id: json['id'] as String,
      identityCode: json['identity_code'] as String,
      formatCode: json['format_code'] as String?,
      rotationCode: json['rotation_code'] as String?,
      mwlCode: json['mwl_code'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      deleted: json['deleted'] as bool,
      remoteUpdated: json['remote_updated'] == null
          ? null
          : DateTime.parse(json['remote_updated'] as String),
      synced: json['synced'] == null
          ? null
          : DateTime.parse(json['synced'] as String),
      cards: Map<String, int>.from(json['cards'] as Map),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      state: $enumDecode(_$DeckSaveStateEnumMap, json['state']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeckNotifierDataToJson(_$DeckNotifierData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identity_code': instance.identityCode,
      'format_code': instance.formatCode,
      'rotation_code': instance.rotationCode,
      'mwl_code': instance.mwlCode,
      'name': instance.name,
      'description': instance.description,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'deleted': instance.deleted,
      'remote_updated': instance.remoteUpdated?.toIso8601String(),
      'synced': instance.synced?.toIso8601String(),
      'cards': instance.cards,
      'tags': instance.tags,
      'state': _$DeckSaveStateEnumMap[instance.state]!,
      'runtimeType': instance.$type,
    };

const _$DeckSaveStateEnumMap = {
  DeckSaveState.isNew: 'isNew',
  DeckSaveState.isChanged: 'isChanged',
  DeckSaveState.isSaved: 'isSaved',
};

_$_DeckResult _$$_DeckResultFromJson(Map json) => _$_DeckResult(
      deck: DeckData.fromJson(Map<String, dynamic>.from(json['deck'] as Map)),
      identity:
          CardData.fromJson(Map<String, dynamic>.from(json['identity'] as Map)),
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
      format: json['format'] == null
          ? null
          : FormatData.fromJson(
              Map<String, dynamic>.from(json['format'] as Map)),
      rotation: json['rotation'] == null
          ? null
          : RotationViewData.fromJson(
              Map<String, dynamic>.from(json['rotation'] as Map)),
      mwl: json['mwl'] == null
          ? null
          : MwlViewData.fromJson(Map<String, dynamic>.from(json['mwl'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_DeckResultToJson(_$_DeckResult instance) =>
    <String, dynamic>{
      'deck': instance.deck.toJson(),
      'identity': instance.identity.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'faction': instance.faction.toJson(),
      'side': instance.side.toJson(),
      'type': instance.type.toJson(),
      'subtype': instance.subtype?.toJson(),
      'format': instance.format?.toJson(),
      'rotation': instance.rotation?.toJson(),
      'mwl': instance.mwl?.toJson(),
      'runtimeType': instance.$type,
    };

_$DeckFullResult _$$DeckFullResultFromJson(Map json) => _$DeckFullResult(
      deck: DeckData.fromJson(Map<String, dynamic>.from(json['deck'] as Map)),
      identity:
          CardData.fromJson(Map<String, dynamic>.from(json['identity'] as Map)),
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
      format: json['format'] == null
          ? null
          : FormatData.fromJson(
              Map<String, dynamic>.from(json['format'] as Map)),
      rotation: json['rotation'] == null
          ? null
          : RotationViewData.fromJson(
              Map<String, dynamic>.from(json['rotation'] as Map)),
      mwl: json['mwl'] == null
          ? null
          : MwlViewData.fromJson(Map<String, dynamic>.from(json['mwl'] as Map)),
      cards: cardsFromJson(json['cards'] as List<Object>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeckFullResultToJson(_$DeckFullResult instance) =>
    <String, dynamic>{
      'deck': instance.deck.toJson(),
      'identity': instance.identity.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'faction': instance.faction.toJson(),
      'side': instance.side.toJson(),
      'type': instance.type.toJson(),
      'subtype': instance.subtype?.toJson(),
      'format': instance.format?.toJson(),
      'rotation': instance.rotation?.toJson(),
      'mwl': instance.mwl?.toJson(),
      'cards': cardsToJson(instance.cards),
      'tags': instance.tags,
      'runtimeType': instance.$type,
    };

_$_DeckCompareResult _$$_DeckCompareResultFromJson(Map json) =>
    _$_DeckCompareResult(
      id: json['id'] as String,
      name: json['name'] as String,
      cards: Map<String, int>.from(json['cards'] as Map),
    );

Map<String, dynamic> _$$_DeckCompareResultToJson(
        _$_DeckCompareResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cards': instance.cards,
    };
