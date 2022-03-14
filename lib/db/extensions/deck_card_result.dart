import '/db/database.dart';

extension DeckCardResultEx on DeckCardResult {
  String get deckId => deckCard.deckId;
  String get cardCode => deckCard.cardCode;
  int get quantity => deckCard.quantity;

  CardResult toCard() {
    return CardResult(
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
