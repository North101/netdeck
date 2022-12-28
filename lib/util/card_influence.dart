import 'package:collection/collection.dart';

import '/db/database.dart' as database;

const cardInfluenceLookup = <String, CardInfluence>{
  // Mumba Temple
  '10018': TypeCountInfluence('ice', 15),
  // Museum of History
  '10019': DeckSizeInfluence(50),
  // Product Recall
  '10029': NonFactionKeywordInfluence('haas-bioroid', 'alliance', 6),
  // Jeeves Model Bioroids
  '10067': NonFactionKeywordInfluence('haas-bioroid', 'alliance', 6),
  // Raman Rai
  '10068': NonFactionKeywordInfluence('jinteki', 'alliance', 6),
  // Ibrahim Salem
  '10109': NonFactionKeywordInfluence('nbn', 'alliance', 6),
  // Consulting Visit
  '10094': NonFactionKeywordInfluence('weyland-consortium', 'alliance', 6),
  // Executive search firm
  '10072': NonFactionKeywordInfluence('weyland-consortium', 'alliance', 6),
  // Heritage Committee
  '10013': NonFactionKeywordInfluence('jinteki', 'alliance', 6),
  // Salem's Hospitality
  '10071': NonFactionKeywordInfluence('nbn', 'alliance', 6),
  // Mumbad Virtual tour
  '10076': TypeCountInfluence('asset', 7),
  // PAD Factory
  '10038': CardCountInfluence('10038', 3),
};

class CardInfluence {
  const CardInfluence();

  int call(Map<database.CardResult, int> cardList, database.CardResult card, int quantity, int factionCost) {
    return factionCost * quantity;
  }
}

class TypeCountInfluence extends CardInfluence {
  const TypeCountInfluence(this.typeCode, this.count);

  final int count;
  final String typeCode;

  @override
  int call(Map<database.CardResult, int> cardList, database.CardResult card, int quantity, int factionCost) {
    final count = cardList.entries
        .where((e) {
          return e.key.type.code == typeCode;
        })
        .map((e) => e.value)
        .sum;
    if (count >= this.count) return 0;

    return super.call(cardList, card, quantity, factionCost);
  }
}

class CardCountInfluence extends CardInfluence {
  const CardCountInfluence(this.cardCode, this.count);

  final String cardCode;
  final int count;

  @override
  int call(Map<database.CardResult, int> cardList, database.CardResult card, int quantity, int factionCost) {
    final count = cardList.entries
        .where((e) {
          return e.key.card.code == cardCode;
        })
        .map((e) => e.value)
        .sum;
    if (count == this.count) return 0;

    return super.call(cardList, card, quantity, factionCost);
  }
}

class DeckSizeInfluence extends CardInfluence {
  const DeckSizeInfluence(this.deckSize);

  final int deckSize;

  @override
  int call(Map<database.CardResult, int> cardList, database.CardResult card, int quantity, int factionCost) {
    final deckSize = cardList.values.sum;
    if (deckSize >= this.deckSize) return 0;

    return super.call(cardList, card, quantity, factionCost);
  }
}

class NonFactionKeywordInfluence extends CardInfluence {
  const NonFactionKeywordInfluence(this.factionCode, this.keyword, this.count);

  final int count;
  final String factionCode;
  final String keyword;

  @override
  int call(Map<database.CardResult, int> cardList, database.CardResult card, int quantity, int factionCost) {
    final keywordMatch = RegExp('(?:^|\\W)${keyword.toLowerCase()}(?:\$|\\W)');
    final count = cardList.entries
        .where((e) {
          return e.key.faction.code == factionCode && !keywordMatch.hasMatch(e.key.card.keywords?.toLowerCase() ?? '');
        })
        .map((e) => e.value)
        .sum;
    if (count >= this.count) return 0;

    return super.call(cardList, card, quantity, factionCost);
  }
}
