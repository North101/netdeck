// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NrdbDeckSuccessResult _$$NrdbDeckSuccessResultFromJson(Map json) =>
    _$NrdbDeckSuccessResult(
      json['version_number'] as String,
      json['success'] as bool,
      NrdbDeck.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
      json['total'] as int,
      $type: json['type'] as String?,
    );

_$NrdbDeckFailureResult _$$NrdbDeckFailureResultFromJson(Map json) =>
    _$NrdbDeckFailureResult(
      json['version_number'] as String,
      json['success'] as bool,
      json['msg'] as String,
      $type: json['type'] as String?,
    );

_$_NrdbUser _$$_NrdbUserFromJson(Map json) => _$_NrdbUser(
      json['id'] as int,
      json['username'] as String,
      json['email'] as String,
      json['reputation'] as int,
      json['sharing'] as bool,
    );

Map<String, dynamic> _$$_NrdbUserToJson(_$_NrdbUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'reputation': instance.reputation,
      'sharing': instance.sharing,
    };

_$_NrdbDeck _$$_NrdbDeckFromJson(Map json) => _$_NrdbDeck(
      id: idFromJson(json['id']),
      name: json['name'] as String,
      description: json['description'] as String,
      mwlCode: json['mwl_code'] as String?,
      dateCreation: DateTime.parse(json['date_creation'] as String),
      dateUpdate: DateTime.parse(json['date_update'] as String),
      cards: Map<String, int>.from(json['cards'] as Map),
      tags: tagsFromJson(json['tags'] as String?),
    );

Map<String, dynamic> _$$_NrdbDeckToJson(_$_NrdbDeck instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'mwl_code': instance.mwlCode,
      'date_creation': instance.dateCreation.toIso8601String(),
      'date_update': instance.dateUpdate.toIso8601String(),
      'cards': instance.cards,
      'tags': tagsToJson(instance.tags),
    };
