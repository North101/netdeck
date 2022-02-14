import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

import '/util.dart';
import '../database.dart';

enum CardGroup {
  name,
  cycle,
  pack,
  side,
  faction,
  type,
  subtype,
}

extension CardGroupEx on CardGroup {
  int _sortByName(CardResult a, CardResult b) {
    return a.card.title.compareTo(b.card.title);
  }

  int _sortByCycle(CardResult a, CardResult b) {
    return -a.cycle.position.compareTo(b.cycle.position);
  }

  int _sortByPack(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      _sortByCycle,
      (a, b) => a.pack.position.compareTo(b.pack.position),
    ]);
  }

  int _sortBySide(CardResult a, CardResult b) {
    return a.side.order.compareTo(b.side.order);
  }

  int _sortByFaction(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      _sortBySide,
      (a, b) => a.faction.order.compareTo(b.faction.order),
    ]);
  }

  int _sortByType(CardResult a, CardResult b) {
    return (a.subtype ?? a.type).position.compareTo((b.subtype ?? b.type).position);
  }

  int _sortBySubtype(CardResult a, CardResult b) {
    return compareToChain<CardResult>(a, b, [
      (a, b) => (a.subtype ?? a.type).position.compareTo((b.subtype ?? b.type).position),
      (a, b) => (a.card.keywords ?? '').compareTo(b.card.keywords ?? ''),
    ]);
  }

  int Function(CardResult a, CardResult b) get sorted {
    switch (this) {
      case CardGroup.name:
        return _sortByName;
      case CardGroup.cycle:
        return _sortByCycle;
      case CardGroup.pack:
        return _sortByPack;
      case CardGroup.side:
        return _sortBySide;
      case CardGroup.faction:
        return _sortByFaction;
      case CardGroup.type:
        return _sortByType;
      case CardGroup.subtype:
        return _sortBySubtype;
    }
  }

  String _groupByName(CardResult item) {
    final value = item.card.title.characters.first;
    if (isLetter(value)) {
      return value;
    } else if (isDigit(value)) {
      return '#';
    }
    return '...';
  }

  String _groupByCycle(CardResult item) {
    return item.cycle.name;
  }

  String _groupByPack(CardResult item) {
    return item.cycle.name == item.pack.name ? _groupByCycle(item) : '${item.cycle.name} / ${item.pack.name}';
  }

  String _groupBySide(CardResult item) {
    return item.side.name;
  }

  String _groupByFaction(CardResult item) {
    return '${item.side.name} / ${item.faction.name}';
  }

  String _groupByType(CardResult item) {
    return (item.subtype ?? item.type).name;
  }

  String _groupBySubtype(CardResult item) {
    final keywords = item.card.keywords;
    if (keywords == null) return item.type.name;

    return '${item.type.name}: $keywords';
  }

  String Function(CardResult item) get grouped {
    switch (this) {
      case CardGroup.name:
        return _groupByName;
      case CardGroup.cycle:
        return _groupByCycle;
      case CardGroup.pack:
        return _groupByPack;
      case CardGroup.side:
        return _groupBySide;
      case CardGroup.faction:
        return _groupByFaction;
      case CardGroup.type:
        return _groupByType;
      case CardGroup.subtype:
        return _groupBySubtype;
    }
  }

  HeaderList<CardResult> call(List<CardResult> list) {
    return HeaderList(groupBy<CardResult, String>(list, grouped)
        .entries
        .map((e) => HeaderItems(e.key, e.value))
        .sortedByCompare<CardResult>((e) => e.first, sorted));
  }

  String name(BuildContext context) {
    switch (this) {
      case CardGroup.name:
        return 'Name';
      case CardGroup.cycle:
        return 'Cycle';
      case CardGroup.pack:
        return 'Pack';
      case CardGroup.side:
        return 'Side';
      case CardGroup.faction:
        return 'Faction';
      case CardGroup.type:
        return 'Type';
      case CardGroup.subtype:
        return 'Subtype';
    }
  }
}

class CardGroupConverter extends NullAwareTypeConverter<CardGroup, String> {
  const CardGroupConverter(this.defaultValue);

  final CardGroup defaultValue;

  @override
  CardGroup requireMapToDart(String fromDb) =>
      CardGroup.values.firstWhereOrNull((e) => requireMapToSql(e) == fromDb) ?? defaultValue;

  @override
  String requireMapToSql(CardGroup value) => value.toString();
}
