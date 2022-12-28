// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckCompareArguments _$$_DeckCompareArgumentsFromJson(Map json) =>
    _$_DeckCompareArguments(
      (json['deck_list'] as List<dynamic>)
          .map((e) =>
              DeckCompareResult.fromJson(Map<String, dynamic>.from(e as Map)))
          .toSet(),
    );

Map<String, dynamic> _$$_DeckCompareArgumentsToJson(
        _$_DeckCompareArguments instance) =>
    <String, dynamic>{
      'deck_list': instance.deckList.map((e) => e.toJson()).toList(),
    };
