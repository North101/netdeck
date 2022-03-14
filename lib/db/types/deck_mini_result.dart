import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '/db/database.dart';

class DeckMiniResult extends DeckData {
  DeckMiniResult({
    required super.id,
    required super.identityCode,
    required super.formatCode,
    required super.rotationCode,
    required super.mwlCode,
    required super.name,
    required super.description,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.remoteUpdated,
    required super.synced,
    required this.cards,
    required this.tags,
  });

  factory DeckMiniResult.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckMiniResult(
      id: serializer.fromJson<String>(json['id']),
      identityCode: serializer.fromJson<String>(json['identity_code']),
      formatCode: serializer.fromJson<String?>(json['format_code']),
      rotationCode: serializer.fromJson<String?>(json['rotation_code']),
      mwlCode: serializer.fromJson<String?>(json['mwl_code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      remoteUpdated: serializer.fromJson<DateTime?>(json['remote_updated']),
      synced: serializer.fromJson<DateTime?>(json['synced']),
      cards: (json['cards'] as Map).cast<String, int>(),
      tags: (json['tags'] as List).cast<String>(),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return {
      'id': serializer.toJson<String>(id),
      'identity_code': serializer.toJson<String>(identityCode),
      'format_code': serializer.toJson<String?>(formatCode),
      'rotation_code': serializer.toJson<String?>(rotationCode),
      'mwl_code': serializer.toJson<String?>(mwlCode),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool>(deleted),
      'remote_updated': serializer.toJson<DateTime?>(remoteUpdated),
      'synced': serializer.toJson<DateTime?>(synced),
      'cards': cards,
      'tags': tags,
    };
  }

  final Map<String, int> cards;
  final List<String> tags;

  @override
  DeckMiniResult copyWith({
    String? id,
    String? identityCode,
    Value<String?> formatCode = const Value.absent(),
    Value<String?> rotationCode = const Value.absent(),
    Value<String?> mwlCode = const Value.absent(),
    String? name,
    String? description,
    DateTime? created,
    DateTime? updated,
    bool? deleted,
    Value<DateTime?> remoteUpdated = const Value.absent(),
    Value<DateTime?> synced = const Value.absent(),
    Map<String, int>? cards,
    List<String>? tags,
  }) =>
      DeckMiniResult(
        id: id ?? this.id,
        identityCode: identityCode ?? this.identityCode,
        formatCode: formatCode.present ? formatCode.value : this.formatCode,
        rotationCode: rotationCode.present ? rotationCode.value : this.rotationCode,
        mwlCode: mwlCode.present ? mwlCode.value : this.mwlCode,
        name: name ?? this.name,
        description: description ?? this.description,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted ?? this.deleted,
        remoteUpdated: remoteUpdated.present ? remoteUpdated.value : this.remoteUpdated,
        synced: synced.present ? synced.value : this.synced,
        cards: cards ?? this.cards,
        tags: tags ?? this.tags,
      );

  @override
  String toString() {
    return (StringBuffer('DeckMiniResult(')
          ..write('id: $id, ')
          ..write('identityCode: $identityCode, ')
          ..write('formatCode: $formatCode, ')
          ..write('rotationCode: $rotationCode, ')
          ..write('mwlCode: $mwlCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('remoteUpdated: $remoteUpdated, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
        id,
        identityCode,
        formatCode,
        rotationCode,
        mwlCode,
        name,
        description,
        created,
        updated,
        deleted,
        remoteUpdated,
        synced,
        const MapEquality().hash(cards),
        const ListEquality().hash(tags),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckMiniResult &&
          other.id == id &&
          other.identityCode == identityCode &&
          other.formatCode == formatCode &&
          other.rotationCode == rotationCode &&
          other.mwlCode == mwlCode &&
          other.name == name &&
          other.description == description &&
          other.created == created &&
          other.updated == updated &&
          other.deleted == deleted &&
          other.remoteUpdated == remoteUpdated &&
          other.synced == synced &&
          const MapEquality().equals(other.cards, cards) &&
          const ListEquality().equals(other.tags, tags));
}
