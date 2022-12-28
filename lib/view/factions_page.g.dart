// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factions_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterFactionsArguments _$$_FilterFactionsArgumentsFromJson(Map json) =>
    _$_FilterFactionsArguments(
      sides: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['sides'] as Map)),
      factions: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['factions'] as Map)),
    );

Map<String, dynamic> _$$_FilterFactionsArgumentsToJson(
        _$_FilterFactionsArguments instance) =>
    <String, dynamic>{
      'sides': instance.sides.toJson(),
      'factions': instance.factions.toJson(),
    };
