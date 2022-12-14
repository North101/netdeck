import 'package:collection/collection.dart';

import '/db/database.dart';
import '/util.dart';

enum CardSort {
  name,
  set,
  side,
  faction,
  type,
  subtype,
}

extension CardSortEx on CardSort {
  int _sortByName(CardResult a, CardResult b) {
    return a.card.title.compareTo(b.card.title);
  }

  int _sortBySet(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => -a.cycle.position.compareTo(b.cycle.position),
      (a, b) => a.pack.position.compareTo(b.pack.position),
      (a, b) => a.card.position.compareTo(b.card.position),
    ]);
  }

  int _sortBySide(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => a.side.order.compareTo(b.side.order),
      _sortBySet,
    ]);
  }

  int _sortByFaction(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => a.side.order.compareTo(b.side.order),
      (a, b) => a.faction.order.compareTo(b.faction.order),
      _sortBySet,
    ]);
  }

  int _sortByType(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => (a.subtype ?? a.type).position.compareTo((b.subtype ?? b.type).position),
      _sortBySet,
    ]);
  }

  int _sortBySubtype(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => (a.subtype ?? a.type).position.compareTo((b.subtype ?? b.type).position),
      (a, b) => (a.card.keywords ?? '').compareTo(b.card.keywords ?? ''),
      _sortBySet,
    ]);
  }

  int Function(CardResult a, CardResult b) get sorted {
    switch (this) {
      case CardSort.name:
        return _sortByName;
      case CardSort.set:
        return _sortBySet;
      case CardSort.side:
        return _sortBySide;
      case CardSort.faction:
        return _sortByFaction;
      case CardSort.type:
        return _sortByType;
      case CardSort.subtype:
        return _sortBySubtype;
    }
  }

  String get title {
    switch (this) {
      case CardSort.name:
        return 'Name';
      case CardSort.set:
        return 'Set';
      case CardSort.side:
        return 'Side';
      case CardSort.faction:
        return 'Faction';
      case CardSort.type:
        return 'Type';
      case CardSort.subtype:
        return 'Subtype';
    }
  }

  List<CardResult> call(Iterable<CardResult> items) => items.sorted(sorted);
}
