// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardListArguments _$$_CardListArgumentsFromJson(Map json) =>
    _$_CardListArguments(
      deck: DeckResult.fromJson(Map<String, dynamic>.from(json['deck'] as Map)),
      deckCards: Map<String, int>.from(json['deck_cards'] as Map),
      filterSearch: json['filter_search'] as String?,
      filterCollection: json['filter_collection'] as bool,
      filterPacks: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['filter_packs'] as Map)),
      filterSides: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['filter_sides'] as Map)),
      filterFactions: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['filter_factions'] as Map)),
      filterTypes: FilterType<String>.fromJson(
          Map<String, dynamic>.from(json['filter_types'] as Map)),
    );

Map<String, dynamic> _$$_CardListArgumentsToJson(
        _$_CardListArguments instance) =>
    <String, dynamic>{
      'deck': instance.deck.toJson(),
      'deck_cards': instance.deckCards,
      'filter_search': instance.filterSearch,
      'filter_collection': instance.filterCollection,
      'filter_packs': instance.filterPacks.toJson(),
      'filter_sides': instance.filterSides.toJson(),
      'filter_factions': instance.filterFactions.toJson(),
      'filter_types': instance.filterTypes.toJson(),
    };
