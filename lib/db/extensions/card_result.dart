import '../database.dart';

extension CardResultEx on CardResult {
  String get code => card.code;

  int get factionCost => mwlCard?.universalFactionCost ?? card.factionCost;

  DeckResult toDeck(DeckData deck, FormatData? format, MwlData? mwl) {
    return DeckResult(
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
      mwlCard: mwlCard,
    );
  }
}
