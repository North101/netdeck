import 'package:collection/collection.dart';

import '/db/database.dart';
import '/util.dart';

enum DeckSort {
  name,
  set,
  side,
  faction,
  created,
  updated,
}

extension DeckSortEx on DeckSort {
  int _sortByName(DeckResult a, DeckResult b) {
    return a.deck.name.compareTo(b.deck.name);
  }

  int _sortBySet(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      (a, b) => -a.cycle.position.compareTo(b.cycle.position),
      (a, b) => a.pack.position.compareTo(b.pack.position),
      (a, b) => a.identity.position.compareTo(b.identity.position),
    ]);
  }

  int _sortBySide(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      (a, b) => a.side.order.compareTo(b.side.order),
      _sortBySet,
    ]);
  }

  int _sortByFaction(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      (a, b) => a.side.order.compareTo(b.side.order),
      (a, b) => a.faction.order.compareTo(b.faction.order),
      _sortBySet,
    ]);
  }

  int _sortByCreated(DeckResult a, DeckResult b) {
    return -a.deck.created.compareTo(b.deck.created);
  }

  int _sortByUpdated(DeckResult a, DeckResult b) {
    return -a.deck.updated.compareTo(b.deck.updated);
  }

  int Function(DeckResult a, DeckResult b) get sorted {
    switch (this) {
      case DeckSort.name:
        return _sortByName;
      case DeckSort.set:
        return _sortBySet;
      case DeckSort.side:
        return _sortBySide;
      case DeckSort.faction:
        return _sortByFaction;
      case DeckSort.created:
        return _sortByCreated;
      case DeckSort.updated:
        return _sortByUpdated;
    }
  }

  String get name {
    switch (this) {
      case DeckSort.name:
        return 'Name';
      case DeckSort.set:
        return 'Set';
      case DeckSort.side:
        return 'Side';
      case DeckSort.faction:
        return 'Faction';
      case DeckSort.created:
        return 'Created';
      case DeckSort.updated:
        return 'Updated';
    }
  }

  List<T> call<T extends DeckResult>(Iterable<T> items) => items.sorted(sorted);
}

class DeckSortConverter extends MyTypeConverter<DeckSort, String> {
  const DeckSortConverter(this.defaultValue);

  final DeckSort defaultValue;

  @override
  DeckSort fromSql(String fromDb) => DeckSort.values.firstWhereOrNull((e) => toSql(e) == fromDb) ?? defaultValue;

  @override
  String toSql(DeckSort value) => value.toString();
}
