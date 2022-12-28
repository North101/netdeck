import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class CardData with _$CardData, CardToColumns, DataMixin {
  const CardData._();

  const factory CardData({
    required String code,
    required String packCode,
    required String factionCode,
    required String typeCode,
    required int position,
    required String title,
    required String? body,
    required String? keywords,
    required int quantity,
    required int? cost,
    required int deckLimit,
    required int factionCost,
    required bool uniqueness,
    required int? strength,
    required int? agendaPoints,
    required int? memoryCost,
    required int? advancementCost,
    required int? trashCost,
    required int? baseLink,
    required int? influenceLimit,
    required int? minimumDeckSize,
    required String? flavor,
    required String? illustrator,
    required String imageUrl,
  }) = _CardData;

  factory CardData.fromJson(Map<String, dynamic> json) => _$CardDataFromJson(json);

  Uri get url => Uri.https('netrunnerdb.com', '/en/card/$code');
}

@freezed
class CardResult with _$CardResult, DataMixin {
  const CardResult._();

  const factory CardResult({
    required CardData card,
    required PackData pack,
    required CycleData cycle,
    required FactionData faction,
    required SideData side,
    required TypeData type,
    required TypeData? subtype,
  }) = _CardResult;

  factory CardResult.fromJson(Map<String, dynamic> json) => _$CardResultFromJson(json);

  DeckFullResult toDeck({
    required DeckData deck,
    required FormatData? format,
    required RotationViewData? rotation,
    required MwlViewData? mwl,
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
      rotation: rotation,
      mwl: mwl,
      cards: cards,
      tags: tags,
    );
  }
}
