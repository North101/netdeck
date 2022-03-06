import '../database.dart';

extension CardResultEx on CardResult {
  String get code => card.code;

  DeckResult2 toDeck({
    required DeckData deck,
    FormatData? format,
    MwlData? mwl,
    required Map<CardResult, int> cards,
    required List<String> tags,
  }) {
    return DeckResult2(
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

  DeckCardResult toDeckCard(String deckId, int quantity) {
    return DeckCardResult(
      deckCard: DeckCardData(
        deckId: deckId,
        cardCode: card.code,
        quantity: quantity,
      ),
      card: card,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
    );
  }
}
