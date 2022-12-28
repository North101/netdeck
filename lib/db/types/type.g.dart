// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TypeData _$$_TypeDataFromJson(Map json) => _$_TypeData(
      code: json['code'] as String,
      sideCode: json['side_code'] as String?,
      position: json['position'] as int,
      name: json['name'] as String,
      isSubtype: json['is_subtype'] as bool,
    );

Map<String, dynamic> _$$_TypeDataToJson(_$_TypeData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'side_code': instance.sideCode,
      'position': instance.position,
      'name': instance.name,
      'is_subtype': instance.isSubtype,
    };

_$_TypeResult _$$_TypeResultFromJson(Map json) => _$_TypeResult(
      type: TypeData.fromJson(Map<String, dynamic>.from(json['type'] as Map)),
      side: json['side'] == null
          ? null
          : SideData.fromJson(Map<String, dynamic>.from(json['side'] as Map)),
    );

Map<String, dynamic> _$$_TypeResultToJson(_$_TypeResult instance) =>
    <String, dynamic>{
      'type': instance.type.toJson(),
      'side': instance.side?.toJson(),
    };
