// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RotationData _$$_RotationDataFromJson(Map json) => _$_RotationData(
      code: json['code'] as String,
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RotationDataToJson(_$_RotationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$RotationViewData _$$RotationViewDataFromJson(Map json) => _$RotationViewData(
      code: json['code'] as String,
      rotationCode: json['rotation_code'] as String?,
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      type: $enumDecodeNullable(_$RotationTypeEnumMap, json['type']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RotationViewDataToJson(_$RotationViewData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'rotation_code': instance.rotationCode,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'type': _$RotationTypeEnumMap[instance.type],
      'runtimeType': instance.$type,
    };

const _$RotationTypeEnumMap = {
  RotationType.current: 'current',
  RotationType.latest: 'latest',
};

_$_RotationCycleData _$$_RotationCycleDataFromJson(Map json) =>
    _$_RotationCycleData(
      rotationCode: json['rotation_code'] as String,
      cycleCode: json['cycle_code'] as String,
    );

Map<String, dynamic> _$$_RotationCycleDataToJson(
        _$_RotationCycleData instance) =>
    <String, dynamic>{
      'rotation_code': instance.rotationCode,
      'cycle_code': instance.cycleCode,
    };
