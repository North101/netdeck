import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '/db/database.dart';
import '/util.dart';
import '/util/header_list.dart';

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
  format,
  rotation,
  mwl;

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
    return (a.deck.remoteUpdated != null ? 1 : 0).compareTo((b.deck.remoteUpdated != null ? 1 : 0));
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
      case DeckGroup.format:
        return _sortByFormat;
      case DeckGroup.rotation:
        return _sortByRotation;
      case DeckGroup.mwl:
        return _sortByMwl;
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
    return item.deck.remoteUpdated != null ? 'Online' : 'Offline';
  }

  String _groupByFormat(DeckResult item) {
    return item.format?.name ?? 'None';
  }

  String _groupByRotation(DeckResult item) {
    return item.rotation?.name ?? 'None';
  }

  String _groupByMwl(DeckResult item) {
    return item.mwl?.name ?? 'None';
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
      case DeckGroup.format:
        return _groupByFormat;
      case DeckGroup.rotation:
        return _groupByRotation;
      case DeckGroup.mwl:
        return _groupByMwl;
    }
  }

  String get title {
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
      case DeckGroup.format:
        return 'Format';
      case DeckGroup.rotation:
        return 'Rotation';
      case DeckGroup.mwl:
        return 'Banlist';
    }
  }

  HeaderList<T> call<T extends DeckResult>(List<T> list) {
    return HeaderList(groupBy(list, grouped)
        .entries
        .map((e) => HeaderItems(e.key, e.value))
        .sortedByCompare<T>((e) => e.first, sorted));
  }
}
