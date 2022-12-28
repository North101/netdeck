// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackData _$$_PackDataFromJson(Map json) => _$_PackData(
      code: json['code'] as String,
      cycleCode: json['cycle_code'] as String,
      position: json['position'] as int,
      name: json['name'] as String,
      dateRelease: json['date_release'] == null
          ? null
          : DateTime.parse(json['date_release'] as String),
      size: json['size'] as int?,
    );

Map<String, dynamic> _$$_PackDataToJson(_$_PackData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'cycle_code': instance.cycleCode,
      'position': instance.position,
      'name': instance.name,
      'date_release': instance.dateRelease?.toIso8601String(),
      'size': instance.size,
    };

_$_PackResult _$$_PackResultFromJson(Map json) => _$_PackResult(
      pack: PackData.fromJson(Map<String, dynamic>.from(json['pack'] as Map)),
      cycle:
          CycleData.fromJson(Map<String, dynamic>.from(json['cycle'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_PackResultToJson(_$_PackResult instance) =>
    <String, dynamic>{
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'runtimeType': instance.$type,
    };

_$CollectionResult _$$CollectionResultFromJson(Map json) => _$CollectionResult(
      pack: PackData.fromJson(Map<String, dynamic>.from(json['pack'] as Map)),
      cycle:
          CycleData.fromJson(Map<String, dynamic>.from(json['cycle'] as Map)),
      inCollection: json['in_collection'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CollectionResultToJson(_$CollectionResult instance) =>
    <String, dynamic>{
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'in_collection': instance.inCollection,
      'runtimeType': instance.$type,
    };
