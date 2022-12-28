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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_MwlDataToJson(_$_MwlData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'runner_points': instance.runnerPoints,
      'corp_points': instance.corpPoints,
      'runtimeType': instance.$type,
    };

_$MwlViewData _$$MwlViewDataFromJson(Map json) => _$MwlViewData(
      code: json['code'] as String,
      mwlCode: json['mwl_code'] as String?,
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      runnerPoints: json['runner_points'] as int?,
      corpPoints: json['corp_points'] as int?,
      type: json['type'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MwlViewDataToJson(_$MwlViewData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'mwl_code': instance.mwlCode,
      'format_code': instance.formatCode,
      'name': instance.name,
      'date_start': instance.dateStart?.toIso8601String(),
      'runner_points': instance.runnerPoints,
      'corp_points': instance.corpPoints,
      'type': instance.type,
      'runtimeType': instance.$type,
    };
