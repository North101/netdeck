// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_filter_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckFilterArguments _$$_DeckFilterArgumentsFromJson(Map json) =>
    _$_DeckFilterArguments(
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
      packs: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['packs'] as Map)),
      sides: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['sides'] as Map)),
      factions: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['factions'] as Map)),
      types: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['types'] as Map)),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$$_DeckFilterArgumentsToJson(
        _$_DeckFilterArguments instance) =>
    <String, dynamic>{
      'format': instance.format?.toJson(),
      'rotation': instance.rotation?.toJson(),
      'mwl': instance.mwl?.toJson(),
      'packs': instance.packs.toJson(),
      'sides': instance.sides.toJson(),
      'factions': instance.factions.toJson(),
      'types': instance.types.toJson(),
      'tags': instance.tags.toList(),
    };
