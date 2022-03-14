import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';

extension CardResultEx on CardResult {
  String get code => card.code;

  static CardResult fromJson(Map<String, dynamic> json) {
    return CardResult(
      card: CardData.fromJson((json['card'] as Map).cast()),
      pack: PackData.fromJson((json['pack'] as Map).cast()),
      cycle: CycleData.fromJson((json['cycle'] as Map).cast()),
      faction: FactionData.fromJson((json['faction'] as Map).cast()),
      side: SideData.fromJson((json['side'] as Map).cast()),
      type: TypeData.fromJson((json['type'] as Map).cast()),
      subtype: (json['subtype'] as Map?)?.let((e) => TypeData.fromJson(e.cast())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card': card.toJson(),
      'pack': pack.toJson(),
      'cycle': cycle.toJson(),
      'faction': faction.toJson(),
      'side': side.toJson(),
      'type': type.toJson(),
      'subtype': subtype?.toJson(),
    };
  }

  DeckFullResult toDeck({
    required DeckData deck,
    FormatData? format,
    MwlData? mwl,
    required Map<CardResult, int> cards,
    required List<String> tags,
  }) {
    return DeckFullResult(
      deck: deck,
      identity: card,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format,
      mwl: mwl,
      cards: cards,
      tags: tags,
    );
  }
}
