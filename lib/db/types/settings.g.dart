// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsData _$$_SettingsDataFromJson(Map json) => _$_SettingsData(
      id: json['id'] as bool,
      filterFormatCode: json['filter_format_code'] as String?,
      filterRotationCode: json['filter_rotation_code'] as String?,
      filterMwlCode: json['filter_mwl_code'] as String?,
      filterCollection: json['filter_collection'] as bool,
      cardSort: $enumDecode(_$CardSortEnumMap, json['card_sort']),
      cardGroup: $enumDecode(_$CardGroupEnumMap, json['card_group']),
      deckSort: $enumDecode(_$DeckSortEnumMap, json['deck_sort']),
      deckGroup: $enumDecode(_$DeckGroupEnumMap, json['deck_group']),
      deckCardSort: $enumDecode(_$CardSortEnumMap, json['deck_card_sort']),
      deckCardGroup: $enumDecode(_$CardGroupEnumMap, json['deck_card_group']),
      compareCardSort:
          $enumDecode(_$CardSortEnumMap, json['compare_card_sort']),
      apexResources: json['apex_resources'] as bool,
      cardGalleryView:
          $enumDecode(_$CardGalleryPageViewEnumMap, json['card_gallery_view']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SettingsDataToJson(_$_SettingsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filter_format_code': instance.filterFormatCode,
      'filter_rotation_code': instance.filterRotationCode,
      'filter_mwl_code': instance.filterMwlCode,
      'filter_collection': instance.filterCollection,
      'card_sort': _$CardSortEnumMap[instance.cardSort]!,
      'card_group': _$CardGroupEnumMap[instance.cardGroup]!,
      'deck_sort': _$DeckSortEnumMap[instance.deckSort]!,
      'deck_group': _$DeckGroupEnumMap[instance.deckGroup]!,
      'deck_card_sort': _$CardSortEnumMap[instance.deckCardSort]!,
      'deck_card_group': _$CardGroupEnumMap[instance.deckCardGroup]!,
      'compare_card_sort': _$CardSortEnumMap[instance.compareCardSort]!,
      'apex_resources': instance.apexResources,
      'card_gallery_view':
          _$CardGalleryPageViewEnumMap[instance.cardGalleryView]!,
      'runtimeType': instance.$type,
    };

const _$CardSortEnumMap = {
  CardSort.name: 'name',
  CardSort.set: 'set',
  CardSort.side: 'side',
  CardSort.faction: 'faction',
  CardSort.type: 'type',
  CardSort.subtype: 'subtype',
};

const _$CardGroupEnumMap = {
  CardGroup.name: 'name',
  CardGroup.cycle: 'cycle',
  CardGroup.pack: 'pack',
  CardGroup.side: 'side',
  CardGroup.faction: 'faction',
  CardGroup.type: 'type',
  CardGroup.subtype: 'subtype',
};

const _$DeckSortEnumMap = {
  DeckSort.name: 'name',
  DeckSort.set: 'set',
  DeckSort.side: 'side',
  DeckSort.faction: 'faction',
  DeckSort.created: 'created',
  DeckSort.updated: 'updated',
  DeckSort.format: 'format',
  DeckSort.rotation: 'rotation',
  DeckSort.mwl: 'mwl',
};

const _$DeckGroupEnumMap = {
  DeckGroup.name: 'name',
  DeckGroup.cycle: 'cycle',
  DeckGroup.pack: 'pack',
  DeckGroup.side: 'side',
  DeckGroup.faction: 'faction',
  DeckGroup.identity: 'identity',
  DeckGroup.created: 'created',
  DeckGroup.updated: 'updated',
  DeckGroup.synced: 'synced',
  DeckGroup.format: 'format',
  DeckGroup.rotation: 'rotation',
  DeckGroup.mwl: 'mwl',
};

const _$CardGalleryPageViewEnumMap = {
  CardGalleryPageView.image: 'image',
  CardGalleryPageView.text: 'text',
};

_$SettingsResult _$$SettingsResultFromJson(Map json) => _$SettingsResult(
      id: json['id'] as bool,
      filterFormatCode: json['filter_format_code'] as String?,
      filterRotationCode: json['filter_rotation_code'] as String?,
      filterMwlCode: json['filter_mwl_code'] as String?,
      filterCollection: json['filter_collection'] as bool,
      cardSort: $enumDecode(_$CardSortEnumMap, json['card_sort']),
      cardGroup: $enumDecode(_$CardGroupEnumMap, json['card_group']),
      deckSort: $enumDecode(_$DeckSortEnumMap, json['deck_sort']),
      deckGroup: $enumDecode(_$DeckGroupEnumMap, json['deck_group']),
      deckCardSort: $enumDecode(_$CardSortEnumMap, json['deck_card_sort']),
      deckCardGroup: $enumDecode(_$CardGroupEnumMap, json['deck_card_group']),
      compareCardSort:
          $enumDecode(_$CardSortEnumMap, json['compare_card_sort']),
      apexResources: json['apex_resources'] as bool,
      cardGalleryView:
          $enumDecode(_$CardGalleryPageViewEnumMap, json['card_gallery_view']),
      filterFormat: json['filter_format'] == null
          ? null
          : FormatData.fromJson(
              Map<String, dynamic>.from(json['filter_format'] as Map)),
      filterRotation: json['filter_rotation'] == null
          ? null
          : RotationViewData.fromJson(
              Map<String, dynamic>.from(json['filter_rotation'] as Map)),
      filterMwl: json['filter_mwl'] == null
          ? null
          : MwlViewData.fromJson(
              Map<String, dynamic>.from(json['filter_mwl'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SettingsResultToJson(_$SettingsResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filter_format_code': instance.filterFormatCode,
      'filter_rotation_code': instance.filterRotationCode,
      'filter_mwl_code': instance.filterMwlCode,
      'filter_collection': instance.filterCollection,
      'card_sort': _$CardSortEnumMap[instance.cardSort]!,
      'card_group': _$CardGroupEnumMap[instance.cardGroup]!,
      'deck_sort': _$DeckSortEnumMap[instance.deckSort]!,
      'deck_group': _$DeckGroupEnumMap[instance.deckGroup]!,
      'deck_card_sort': _$CardSortEnumMap[instance.deckCardSort]!,
      'deck_card_group': _$CardGroupEnumMap[instance.deckCardGroup]!,
      'compare_card_sort': _$CardSortEnumMap[instance.compareCardSort]!,
      'apex_resources': instance.apexResources,
      'card_gallery_view':
          _$CardGalleryPageViewEnumMap[instance.cardGalleryView]!,
      'filter_format': instance.filterFormat?.toJson(),
      'filter_rotation': instance.filterRotation?.toJson(),
      'filter_mwl': instance.filterMwl?.toJson(),
      'runtimeType': instance.$type,
    };
