// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormatData _$$_FormatDataFromJson(Map json) => _$_FormatData(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_FormatDataToJson(_$_FormatData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

_$_FormatResult _$$_FormatResultFromJson(Map json) => _$_FormatResult(
      format:
          FormatData.fromJson(Map<String, dynamic>.from(json['format'] as Map)),
      currentRotation: RotationViewData.fromJson(
          Map<String, dynamic>.from(json['current_rotation'] as Map)),
      activeMwl: MwlViewData.fromJson(
          Map<String, dynamic>.from(json['active_mwl'] as Map)),
    );

Map<String, dynamic> _$$_FormatResultToJson(_$_FormatResult instance) =>
    <String, dynamic>{
      'format': instance.format.toJson(),
      'current_rotation': instance.currentRotation.toJson(),
      'active_mwl': instance.activeMwl.toJson(),
    };
