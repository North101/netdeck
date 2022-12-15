import 'dart:math';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;

import '/db/database.dart';
import 'card_influence.dart';

class DeckValidator {
  static const lookup = {
    TheProfessorDeckValidator.identityCode: TheProfessorDeckValidator.new,
    ApexDeckValidator.identityCode: ApexDeckValidator.new,
    CustomBioticsDeckValidator.identityCode: CustomBioticsDeckValidator.new,
    NovaInitiumiaDeckValidator.identityCode: NovaInitiumiaDeckValidator.new,
    AmpereDeckValidator.identityCode: AmpereDeckValidator.new,
  };

  factory DeckValidator(
    SettingResult settings,
    DeckFullResult deck,
    Set<String>? formatCardSet,
    Map<String, MwlCardData> mwlCardMap,
  ) {
    final validator = lookup[deck.identity.code];
    if (validator != null) {
      return validator(settings, deck, formatCardSet, mwlCardMap);
    }

    if (deck.side.code == RunnerDeckValidator.sideCode) {
      return RunnerDeckValidator(settings, deck, formatCardSet, mwlCardMap);
    } else if (deck.side.code == CorpDeckValidator.sideCode) {
      return CorpDeckValidator(settings, deck, formatCardSet, mwlCardMap);
    }
    return DeckValidator._(settings, deck, formatCardSet, mwlCardMap);
  }

  DeckValidator._(
    this.settings,
    this.deck,
    this.formatCardSet,
    this.mwlCardMap,
  );

  String? agendaError;
  final SettingResult settings;
  final DeckFullResult deck;
  final Set<String>? formatCardSet;
  final Map<String, MwlCardData> mwlCardMap;

  int? _agendaPoints;
  Map<CardResult, String?>? _cardErrorList;
  int? _deckSize;
  int? _influence;
  int? _minAgendaPoints;
  int? _maxAgendaPoints;
  int? _maxInfluence;
  int? _restrictedCount;
  int? _mwlPoints;
  int? _maxMwlPoints;

  MwlCardData? mwlCard(CardData card) => mwlCardMap[card.title];

  Map<CardResult, int> get cardList => deck.cards;

  int get deckSize => _deckSize ??= cardList.values.sum;

  int? get minDeckSize => deck.identity.minimumDeckSize;

  String? get deckSizeError {
    if (minDeckSize != null && deckSize < minDeckSize!) {
      return 'The deck has less cards than the minimum required by the Identity.';
    }
    return null;
  }

  int get agendaPoints {
    return _agendaPoints ??= cardList.entries.where((e) {
      return e.key.type.code == 'agenda';
    }).map((e) {
      return (e.key.card.agendaPoints ?? 0) * e.value;
    }).sum;
  }

  int get minAgendaPoints => _minAgendaPoints ??= (deckSize / 5).floor() * 2 + 2;

  int get maxAgendaPoints => _maxAgendaPoints ??= minAgendaPoints + 1;

  int get mwlPoints {
    return _mwlPoints ??= (mwlCard(deck.identity)?.points ?? 0) +
        cardList.keys.map((e) => mwlCard(e.card)).toSet().map((e) => e?.points ?? 0).sum;
  }

  int? get maxMwlPoints => _maxMwlPoints ??= deck.mwl?.points(deck.side);

  String? get mwlPointsError {
    final maxMwlPoints = this.maxMwlPoints;
    if (maxMwlPoints != null && mwlPoints > maxMwlPoints) {
      return 'This deck has spent more points than available.';
    }
    return null;
  }

  int get influence => _influence ??= cardList.entries.map((e) => cardInfluence(e.key, e.value)).sum;

  int cardInfluence(CardResult card, int quantity) {
    final factionCost = mwlCard(card.card)?.universalFactionCost ??
        (card.faction.code != deck.faction.code ? card.card.factionCost : 0);
    if (factionCost == 0) return 0;

    final cardInfluence = cardInfluenceLookup[card.code] ?? const CardInfluence();
    return cardInfluence(cardList, card, quantity, factionCost);
  }

  int? get maxInfluence {
    final influenceLimit = deck.identity.influenceLimit;
    if (influenceLimit == null) return null;

    return _maxInfluence ??= max(
        influenceLimit -
            cardList.entries.map((e) {
              final globalPenalty = mwlCard(e.key.card)?.globalPenalty ?? 0;
              return globalPenalty * e.value;
            }).sum,
        1);
  }

  String? get influenceError {
    if (maxInfluence != null && influence > maxInfluence!) {
      return 'The deck spends more influence than available on the Identity.';
    }
    return null;
  }

  int get restrictedCount => _restrictedCount ??= cardList.keys.where((card) {
        return mwlCard(card.card)?.isRestricted ?? false;
      }).length;

  Map<CardResult, String?> get cardErrorList {
    return _cardErrorList ??= cardList.map((card, quantity) {
      return MapEntry(card, cardError(card, quantity));
    });
  }

  String? cardError(CardResult card, int quantity) {
    final mwlCard = this.mwlCard(card.card);
    if (card.type.code == 'identity') {
      return 'Cannot include identities in your deck.';
    } else if ((mwlCard?.isRestricted ?? false) && restrictedCount > 1) {
      return 'Too many restriced cards.';
    } else if (quantity > (mwlCard?.deckLimit ?? card.card.deckLimit)) {
      return 'Too many copies.';
    } else if (!(formatCardSet?.contains(card.card.title) ?? true)) {
      return 'Not valid for format.';
    }
    return null;
  }

  Iterable<String> get allErrors sync* {
    if (deckSizeError != null) yield deckSizeError!;
    if (agendaError != null) yield agendaError!;
    if (influenceError != null) yield influenceError!;
    if (mwlPointsError != null) yield mwlPointsError!;
  }

  drift.Expression<bool> filter(Database db) {
    return trueExpression;
  }
}

class RunnerDeckValidator extends DeckValidator {
  RunnerDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  ) : super._();

  static const sideCode = 'runner';

  @override
  String? cardError(CardResult card, int quantity) {
    if (card.side.code != sideCode) {
      return 'Cannot include ${card.side.name} cards.';
    }

    return super.cardError(card, quantity);
  }
}

class TheProfessorDeckValidator extends RunnerDeckValidator {
  TheProfessorDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  );

  static const identityCode = '03029';

  @override
  int cardInfluence(CardResult card, int quantity) {
    if (card.type.code == 'program') {
      quantity = max(quantity - 1, 0);
    }

    return super.cardInfluence(card, quantity);
  }
}

class ApexDeckValidator extends RunnerDeckValidator {
  ApexDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  );

  static const identityCode = '09029';

  @override
  drift.Expression<bool> filter(Database db) {
    if (!settings.settings.apexResources) return super.filter(db);

    return buildAnd([
      super.filter(db),
      buildOr([
        db.type.code.equals('resource').not(),
        db.card.keywords.equals('Virtual'),
      ]),
    ]);
  }
}

class CorpDeckValidator extends DeckValidator {
  CorpDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  ) : super._();

  static const sideCode = 'corp';

  @override
  String? get agendaError {
    if (agendaPoints < minAgendaPoints || agendaPoints > maxAgendaPoints) {
      return 'The deck has the wrong number of Agenda Points.';
    }
    return null;
  }

  @override
  String? cardError(CardResult card, int quantity) {
    if (card.side.code != sideCode) {
      return 'Cannot include ${card.side.name} cards.';
    } else if (card.type.code == 'agenda' &&
        card.faction.code != 'neutral-corp' &&
        card.faction.code != deck.faction.code) {
      return 'Cannot include Agendas from a different faction.';
    }

    return super.cardError(card, quantity);
  }

  @override
  drift.Expression<bool> filter(Database db) {
    return buildOr([
      db.type.code.equals('agenda').not(),
      db.faction.code.equals(deck.faction.code),
      db.faction.code.equals('neutral-corp'),
    ]);
  }
}

class CustomBioticsDeckValidator extends CorpDeckValidator {
  CustomBioticsDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  );

  static const identityCode = '03002';

  @override
  String? cardError(CardResult card, int quantity) {
    if (card.faction.code == 'jinteki') {
      return 'Can\t include Jinteki cards';
    }

    return super.cardError(card, quantity);
  }

  @override
  drift.Expression<bool> filter(Database db) {
    return buildAnd([
      super.filter(db),
      db.faction.code.equals('jinteki').not(),
    ]);
  }
}

class NovaInitiumiaDeckValidator extends RunnerDeckValidator {
  NovaInitiumiaDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  );

  static const identityCode = '33093';

  @override
  String? cardError(CardResult card, int quantity) {
    if (quantity > 1) {
      return 'Your deck cannot include more than 1 copy of any card.';
    }

    return super.cardError(card, quantity);
  }
}

class AmpereDeckValidator extends CorpDeckValidator {
  AmpereDeckValidator(
    super.settings,
    super.deck,
    super.formatCardSet,
    super.mwlCardMap,
  );

  static const identityCode = '33128';

  @override
  String? cardError(CardResult card, int quantity) {
    if (quantity > 1) {
      return 'Your deck cannot include more than 1 copy of any card.';
    } else if (card.type.code == 'agenda') {
      final factionAgendas = cardList.keys.where((e) => e.type.code == 'agenda' && e.faction == card.faction);
      if (factionAgendas.length > 2) {
        return 'Your deck cannot include more than 2 different agenda cards from each Corp faction.';
      }
    }

    return super.cardError(card, quantity);
  }
}
