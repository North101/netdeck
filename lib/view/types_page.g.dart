// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterTypesArguments _$$_FilterTypesArgumentsFromJson(Map json) =>
    _$_FilterTypesArguments(
      sides: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['sides'] as Map)),
      types: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['types'] as Map)),
    );

Map<String, dynamic> _$$_FilterTypesArgumentsToJson(
        _$_FilterTypesArguments instance) =>
    <String, dynamic>{
      'sides': instance.sides.toJson(),
      'types': instance.types.toJson(),
    };
