// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FactionData _$$_FactionDataFromJson(Map json) => _$_FactionData(
      code: json['code'] as String,
      sideCode: json['side_code'] as String,
      name: json['name'] as String,
      color: colorFromJson(json['color'] as int),
      isMini: json['is_mini'] as bool,
    );

Map<String, dynamic> _$$_FactionDataToJson(_$_FactionData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'side_code': instance.sideCode,
      'name': instance.name,
      'color': colorToJson(instance.color),
      'is_mini': instance.isMini,
    };

_$_FactionResult _$$_FactionResultFromJson(Map json) => _$_FactionResult(
      faction: FactionData.fromJson(
          Map<String, dynamic>.from(json['faction'] as Map)),
      side: SideData.fromJson(Map<String, dynamic>.from(json['side'] as Map)),
    );

Map<String, dynamic> _$$_FactionResultToJson(_$_FactionResult instance) =>
    <String, dynamic>{
      'faction': instance.faction.toJson(),
      'side': instance.side.toJson(),
    };
