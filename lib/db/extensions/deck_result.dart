import 'package:drift/drift.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';

extension DeckResultEx on DeckResult {
  static fromJson(Map<String, dynamic> json) => DeckResult(
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
    };
  }

  DeckFullResult toFullResult({
    Map<CardResult, int> cards = const {},
    List<String> tags = const [],
  }) =>
      DeckFullResult(
        deck: deck,
        identity: identity,
        pack: pack,
        cycle: cycle,
        faction: faction,
        side: side,
        type: type,
        subtype: subtype,
        format: format,
        rotation: rotation,
        mwl: mwl,
        cards: cards,
        tags: tags,
      );

  DeckResult copyWith({
    DeckData? deck,
    Value<FormatData?> format = const Value.absent(),
    Value<RotationViewData?> rotation = const Value.absent(),
    Value<MwlViewData?> mwl = const Value.absent(),
  }) {
    return DeckResult(
      deck: (deck ?? this.deck).copyWith(
        formatCode: Value(format.present ? format.value?.code : (deck ?? this.deck).formatCode),
        mwlCode: Value(mwl.present ? mwl.value?.code : (deck ?? this.deck).mwlCode),
        rotationCode: Value(rotation.present ? rotation.value?.code : (deck ?? this.deck).rotationCode),
      ),
      identity: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format.present ? format.value : this.format,
      rotation: rotation.present ? rotation.value : this.rotation,
      mwl: mwl.present ? mwl.value : this.mwl,
    );
  }

  CardResult toCard() {
    return CardResult(
      card: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
    );
  }

  SyncIssues syncIssues([DateTime? remoteUpdated]) => deck.syncIssues(remoteUpdated);
}
