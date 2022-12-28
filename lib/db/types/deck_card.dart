import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'deck_card.freezed.dart';
part 'deck_card.g.dart';

@freezed
class DeckCardData with _$DeckCardData, DeckCardToColumns, DataMixin {
  const DeckCardData._();

  const factory DeckCardData({
    required String deckId,
    required String cardCode,
    required int quantity,
  }) = _DeckCardData;

  factory DeckCardData.fromJson(Map<String, dynamic> json) => _$DeckCardDataFromJson(json);
}

@freezed
class DeckCardResult with _$DeckCardResult {
  const DeckCardResult._();

  const factory DeckCardResult({
    required DeckCardData deckCard,
    required CardData card,
    required PackData pack,
    required CycleData cycle,
    required FactionData faction,
    required SideData side,
    required TypeData type,
    required TypeData? subtype,
  }) = _DeckCardResult;

  factory DeckCardResult.fromJson(Map<String, dynamic> json) => _$DeckCardResultFromJson(json);

  String get deckId => deckCard.deckId;
  String get cardCode => deckCard.cardCode;
  int get quantity => deckCard.quantity;

  CardResult toCard() => CardResult(
        card: card,
        pack: pack,
        cycle: cycle,
        faction: faction,
        side: side,
        type: type,
        subtype: subtype,
      );
}
