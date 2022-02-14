import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

import '/util.dart';
import '../database.dart';

enum DeckGroup {
  name,
  cycle,
  pack,
  side,
  faction,
  identity,
  created,
  updated,
  synced,
}

extension DeckGroupEx on DeckGroup {
  int _sortByName(DeckResult a, DeckResult b) {
    return a.deck.name.compareTo(b.deck.name);
  }

  int _sortByCycle(DeckResult a, DeckResult b) {
    return -a.cycle.position.compareTo(b.cycle.position);
  }

  int _sortByPack(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      _sortByCycle,
      (a, b) => a.pack.position.compareTo(b.pack.position),
    ]);
  }

  int _sortBySide(DeckResult a, DeckResult b) {
    return a.side.order.compareTo(b.side.order);
  }

  int _sortByFaction(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      _sortBySide,
      (a, b) => a.faction.order.compareTo(b.faction.order),
    ]);
  }

  int _sortByIdentity(DeckResult a, DeckResult b) {
    return compareToChain<DeckResult>(a, b, [
      _sortByFaction,
      (a, b) => a.identity.code.compareTo(b.identity.code),
    ]);
  }

  int _sortByCreated(DeckResult a, DeckResult b) {
    return -a.deck.created.compareTo(b.deck.created);
  }

  int _sortByUpdated(DeckResult a, DeckResult b) {
    return -a.deck.updated.compareTo(b.deck.updated);
  }

  int _sortBySynced(DeckResult a, DeckResult b) {
    return (a.deck.nrdbId != null ? 1 : 0).compareTo((b.deck.nrdbId != null ? 1 : 0));
  }

  int Function(DeckResult a, DeckResult b) get sorted {
    switch (this) {
      case DeckGroup.name:
        return _sortByName;
      case DeckGroup.cycle:
        return _sortByCycle;
      case DeckGroup.pack:
        return _sortByPack;
      case DeckGroup.side:
        return _sortBySide;
      case DeckGroup.faction:
        return _sortByFaction;
      case DeckGroup.identity:
        return _sortByIdentity;
      case DeckGroup.created:
        return _sortByCreated;
      case DeckGroup.updated:
        return _sortByUpdated;
      case DeckGroup.synced:
        return _sortBySynced;
    }
  }

  String _groupByName(DeckResult item) {
    final value = item.deck.name.characters.first;
    if (isLetter(value)) {
      return value;
    } else if (isDigit(value)) {
      return '#';
    }
    return '...';
  }

  String _groupByCycle(DeckResult item) {
    return item.cycle.name;
  }

  String _groupByPack(DeckResult item) {
    return item.cycle.name == item.pack.name ? _groupByCycle(item) : '${item.cycle.name} / ${item.pack.name}';
  }

  String _groupBySide(DeckResult item) {
    return item.side.name;
  }

  String _groupByFaction(DeckResult item) {
    return '${item.side.name} / ${item.faction.name}';
  }

  String _groupByIdentity(DeckResult item) {
    return item.identity.title;
  }

  String _groupByCreated(DeckResult item) {
    return relativeDate(item.deck.created);
  }

  String _groupByUpdated(DeckResult item) {
    return relativeDate(item.deck.updated);
  }

  String _groupBySynced(DeckResult item) {
    return item.deck.nrdbId != null ? 'Online' : 'Offline';
  }

  String Function(DeckResult item) get grouped {
    switch (this) {
      case DeckGroup.name:
        return _groupByName;
      case DeckGroup.cycle:
        return _groupByCycle;
      case DeckGroup.pack:
        return _groupByPack;
      case DeckGroup.side:
        return _groupBySide;
      case DeckGroup.faction:
        return _groupByFaction;
      case DeckGroup.identity:
        return _groupByIdentity;
      case DeckGroup.created:
        return _groupByCreated;
      case DeckGroup.updated:
        return _groupByUpdated;
      case DeckGroup.synced:
        return _groupBySynced;
    }
  }

  String get name {
    switch (this) {
      case DeckGroup.name:
        return 'Name';
      case DeckGroup.cycle:
        return 'Cycle';
      case DeckGroup.pack:
        return 'Pack';
      case DeckGroup.side:
        return 'Side';
      case DeckGroup.faction:
        return 'Faction';
      case DeckGroup.identity:
        return 'Identity';
      case DeckGroup.created:
        return 'Created';
      case DeckGroup.updated:
        return 'Updated';
      case DeckGroup.synced:
        return 'Synced';
    }
  }

  HeaderList<DeckResult> call(List<DeckResult> list) {
    return HeaderList(groupBy<DeckResult, String>(list, grouped)
        .entries
        .map((e) => HeaderItems(e.key, e.value))
        .sortedByCompare<DeckResult>((e) => e.first, sorted));
  }
}

class DeckGroupConverter extends NullAwareTypeConverter<DeckGroup, String> {
  const DeckGroupConverter(this.defaultValue);

  final DeckGroup defaultValue;

  @override
  DeckGroup requireMapToDart(String fromDb) =>
      DeckGroup.values.firstWhereOrNull((e) => requireMapToSql(e) == fromDb) ?? defaultValue;

  @override
  String requireMapToSql(DeckGroup value) => value.toString();
}
