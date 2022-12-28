// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_filter_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardFilterArguments _$$_CardFilterArgumentsFromJson(Map json) =>
    _$_CardFilterArguments(
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
      collection: json['collection'] as bool,
      packs: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['packs'] as Map)),
      sides: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['sides'] as Map)),
      factions: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['factions'] as Map)),
      types: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['types'] as Map)),
    );

Map<String, dynamic> _$$_CardFilterArgumentsToJson(
        _$_CardFilterArguments instance) =>
    <String, dynamic>{
      'format': instance.format?.toJson(),
      'rotation': instance.rotation?.toJson(),
      'mwl': instance.mwl?.toJson(),
      'collection': instance.collection,
      'packs': instance.packs.toJson(),
      'sides': instance.sides.toJson(),
      'factions': instance.factions.toJson(),
      'types': instance.types.toJson(),
    };
