// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mwl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MwlData _$$_MwlDataFromJson(Map json) => _$_MwlData(
      code: json['code'] as String,
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      runnerPoints: json['runner_points'] as int?,
      corpPoints: json['corp_points'] as int?,
    );

Map<String, dynamic> _$$_MwlDataToJson(_$_MwlData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'runner_points': instance.runnerPoints,
      'corp_points': instance.corpPoints,
    };

_$_MwlViewData _$$_MwlViewDataFromJson(Map json) => _$_MwlViewData(
      code: json['code'] as String,
      mwlCode: json['mwl_code'] as String?,
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      runnerPoints: json['runner_points'] as int?,
      corpPoints: json['corp_points'] as int?,
      type: $enumDecodeNullable(_$MwlTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_MwlViewDataToJson(_$_MwlViewData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'mwl_code': instance.mwlCode,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'runner_points': instance.runnerPoints,
      'corp_points': instance.corpPoints,
      'type': _$MwlTypeEnumMap[instance.type],
    };

const _$MwlTypeEnumMap = {
  MwlType.active: 'active',
  MwlType.latest: 'latest',
};
