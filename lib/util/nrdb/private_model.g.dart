// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessHttpResult<T> _$$SuccessHttpResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessHttpResult<T>(
      json['version_number'] as String,
      json['success'] as bool,
      fromJsonT(json['data']),
      json['total'] as int,
      $type: json['runtimeType'] as String?,
    );

_$FailedHttpResult<T> _$$FailedHttpResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$FailedHttpResult<T>(
      json['version_number'] as String,
      json['success'] as bool,
      json['msg'] as String,
      $type: json['runtimeType'] as String?,
    );

_$NotFoundHttpResult<T> _$$NotFoundHttpResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$NotFoundHttpResult<T>(
      $type: json['runtimeType'] as String?,
    );

_$UnknownHttpResult<T> _$$UnknownHttpResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$UnknownHttpResult<T>(
      $type: json['runtimeType'] as String?,
    );

_$_NrdbDeck _$$_NrdbDeckFromJson(Map json) => _$_NrdbDeck(
      id: NrdbDeck.idFromJson(json['id']),
      name: json['name'] as String,
      description: json['description'] as String,
      mwlCode: json['mwl_code'] as String?,
      dateCreation: DateTime.parse(json['date_creation'] as String),
      dateUpdate: DateTime.parse(json['date_update'] as String),
      cards: Map<String, int>.from(json['cards'] as Map),
      tags: NrdbDeck.tagsFromJson(json['tags'] as String?),
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
      'tags': NrdbDeck.tagsToJson(instance.tags),
    };

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
