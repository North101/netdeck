import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';
import '/providers/deck.dart';
import '/util/extensions.dart';

class DeckFullResult extends DeckResult {
  DeckFullResult({
    required super.deck,
    required super.identity,
    required super.pack,
    required super.cycle,
    required super.faction,
    required super.side,
    required super.type,
    super.subtype,
    super.format,
    super.rotation,
    super.mwl,
    required this.cards,
    required this.tags,
  });

  factory DeckFullResult.fromJson(Map<String, dynamic> json) => DeckFullResult(
        deck: DeckData.fromJson((json['deck'] as Map).cast()),
        identity: CardData.fromJson((json['identity'] as Map).cast()),
        pack: PackData.fromJson((json['pack'] as Map).cast()),
        cycle: CycleData.fromJson((json['cycle'] as Map).cast()),
        faction: FactionData.fromJson((json['faction'] as Map).cast()),
        side: SideData.fromJson((json['side'] as Map).cast()),
        type: TypeData.fromJson((json['type'] as Map).cast()),
        subtype: (json['subtype'] as Map?)?.let((e) => TypeData.fromJson(e.cast())),
        format: (json['format'] as Map?)?.let((e) => FormatData.fromJson(e.cast())),
        rotation: (json['rotation'] as Map?)?.let((e) => RotationViewData.fromJson(e.cast())),
        mwl: (json['mwl'] as Map?)?.let((e) => MwlViewData.fromJson(e.cast())),
        cards: (json['cards'] as List).cast<Map>().map<MapEntry<CardResult, int>>((e) {
          return MapEntry(CardResultEx.fromJson(e.cast()), e['count'] as int);
        }).toMap(),
        tags: (json['tags'] as List).cast<String>(),
      );

  Map<String, dynamic> toJson() {
    return {
      'deck': deck.toJson(),
      'identity': identity.toJson(),
      'pack': pack.toJson(),
      'cycle': cycle.toJson(),
      'faction': faction.toJson(),
      'side': side.toJson(),
      'type': type.toJson(),
      'subtype': subtype?.toJson(),
      'format': format?.toJson(),
      'rotation': rotation?.toJson(),
      'mwl': mwl?.toJson(),
      'cards': cards.entries
          .map((e) => {
                ...e.key.toJson(),
                'count': e.value,
              })
          .toList(),
      'tags': tags,
    };
  }

  final Map<CardResult, int> cards;
  final List<String> tags;

  DeckFullResult copyWith({
    DeckData? deck,
    CardData? identity,
    Value<FormatData?> format = const Value.absent(),
    Value<RotationViewData?> rotation = const Value.absent(),
    Value<MwlViewData?> mwl = const Value.absent(),
    Map<CardResult, int>? cards,
    List<String>? tags,
  }) {
    return DeckFullResult(
      deck: (deck ?? this.deck).copyWith(
        formatCode: format.present ? Value(format.value?.code) : const Value.absent(),
        rotationCode: rotation.present ? Value(rotation.value?.code) : const Value.absent(),
        mwlCode: mwl.present ? Value(mwl.value?.code) : const Value.absent(),
      ),
      identity: identity ?? this.identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format.present ? format.value : this.format,
      rotation: rotation.present ? rotation.value : this.rotation,
      mwl: mwl.present ? mwl.value : this.mwl,
      cards: cards ?? this.cards,
      tags: tags ?? this.tags,
    );
  }

  @override
  int get hashCode => Object.hash(
        deck,
        identity,
        pack,
        cycle,
        faction,
        side,
        type,
        subtype,
        format,
        rotation,
        mwl,
        const MapEquality().hash(cards),
        const ListEquality().hash(tags),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckFullResult &&
          other.deck == deck &&
          other.identity == identity &&
          other.pack == pack &&
          other.cycle == cycle &&
          other.faction == faction &&
          other.side == side &&
          other.type == type &&
          other.subtype == subtype &&
          other.format == format &&
          other.rotation == rotation &&
          other.mwl == mwl &&
          const MapEquality().equals(other.cards, cards) &&
          const ListEquality().equals(other.tags, tags));

  DeckNotifierResult toNotifierResult(DeckSaveState state) {
    return DeckNotifierResult(
      id: deck.id,
      identityCode: deck.identityCode,
      formatCode: deck.formatCode,
      rotationCode: deck.rotationCode,
      mwlCode: deck.mwlCode,
      name: deck.name,
      description: deck.description,
      created: deck.created,
      updated: deck.updated,
      deleted: deck.deleted,
      remoteUpdated: deck.remoteUpdated,
      synced: deck.synced,
      cards: cards.map((key, value) => MapEntry(key.code, value)),
      tags: tags,
      state: state,
    );
  }

  DeckMicroResult toMicroResult() {
    return DeckMicroResult(
      id: deck.id,
      name: deck.name,
      cards: cards.map((key, value) => MapEntry(key.code, value)),
    );
  }
}
