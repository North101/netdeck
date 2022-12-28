// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotation_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RotationPackResult _$$_RotationPackResultFromJson(Map json) =>
    _$_RotationPackResult(
      format:
          FormatData.fromJson(Map<String, dynamic>.from(json['format'] as Map)),
      rotation: RotationViewData.fromJson(
          Map<String, dynamic>.from(json['rotation'] as Map)),
      pack: PackData.fromJson(Map<String, dynamic>.from(json['pack'] as Map)),
      cycle:
          CycleData.fromJson(Map<String, dynamic>.from(json['cycle'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RotationPackResultToJson(
        _$_RotationPackResult instance) =>
    <String, dynamic>{
      'format': instance.format.toJson(),
      'rotation': instance.rotation.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'runtimeType': instance.$type,
    };

_$RotationCardResult _$$RotationCardResultFromJson(Map json) =>
    _$RotationCardResult(
      format:
          FormatData.fromJson(Map<String, dynamic>.from(json['format'] as Map)),
      rotation: RotationViewData.fromJson(
          Map<String, dynamic>.from(json['rotation'] as Map)),
      pack: PackData.fromJson(Map<String, dynamic>.from(json['pack'] as Map)),
      cycle:
          CycleData.fromJson(Map<String, dynamic>.from(json['cycle'] as Map)),
      card: CardData.fromJson(Map<String, dynamic>.from(json['card'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RotationCardResultToJson(
        _$RotationCardResult instance) =>
    <String, dynamic>{
      'format': instance.format.toJson(),
      'rotation': instance.rotation.toJson(),
      'pack': instance.pack.toJson(),
      'cycle': instance.cycle.toJson(),
      'card': instance.card.toJson(),
      'runtimeType': instance.$type,
    };
