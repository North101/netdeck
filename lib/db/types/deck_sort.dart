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
  format,
  rotation,
  mwl;

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

  int _sortNullLast<T extends Comparable<Object>>(T? a, T? b) {
    if (a == b) {
      return 0;
    } else if (a == null) {
      return 1;
    } else if (b == null) {
      return -1;
    } else {
      return a.compareTo(b);
    }
  }

  int _sortByFormat(DeckResult a, DeckResult b) {
    return _sortNullLast(a.format?.id, b.format?.id);
  }

  int _sortByRotation(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      _sortByFormat,
      (a, b) => _sortNullLast(a.rotation?.dateStart, b.rotation?.dateStart),
    ]);
  }

  int _sortByMwl(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      _sortByFormat,
      (a, b) => _sortNullLast(a.mwl?.dateStart, b.mwl?.dateStart),
    ]);
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
      case DeckSort.format:
        return _sortByFormat;
      case DeckSort.rotation:
        return _sortByRotation;
      case DeckSort.mwl:
        return _sortByMwl;
    }
  }

  String get title {
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
      case DeckSort.format:
        return 'Format';
      case DeckSort.rotation:
        return 'Rotation';
      case DeckSort.mwl:
        return 'Banlist';
    }
  }

  List<T> call<T extends DeckResult>(Iterable<T> items) => items.sorted(sorted);
}
