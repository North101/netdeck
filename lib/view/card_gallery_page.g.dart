// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_gallery_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardGalleryArguments _$$_CardGalleryArgumentsFromJson(Map json) =>
    _$_CardGalleryArguments(
      items: itemsFromJson(json['items'] as List),
      index: json['index'] as int?,
      deckCards: (json['deck_cards'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as int),
      ),
    );

Map<String, dynamic> _$$_CardGalleryArgumentsToJson(
        _$_CardGalleryArguments instance) =>
    <String, dynamic>{
      'items': itemsToJson(instance.items),
      'index': instance.index,
      'deck_cards': instance.deckCards,
    };
