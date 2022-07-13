import 'package:drift/drift.dart' as drift;
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:petitparser/petitparser.dart';
import 'package:query/query.dart';

import 'database.dart';

typedef FieldMap = Map<String, QueryBuilder>;

Query? tryParseQuery(String query) {
  if (query.isEmpty) return null;

  try {
    return parseQuery(query.trim());
  } on ParserException catch (e) {
    print(e);
  }

  return null;
}

String wrapQuotes(String text) {
  if (text.contains(' ')) return '"$text"';
  return text;
}

class Option {
  const Option(this.value, this.replacement, [this.help]);

  Option.replace(String text, int start, int end, this.value, [this.help])
      : replacement = text.replaceRange(start, end, wrapQuotes(value));

  final String value;
  final String replacement;
  final String? help;
}

extension on Query {
  bool within(int position) => position >= startIndex && position <= endIndex;
}

abstract class QueryBuilder<T extends drift.TableInfo> {
  const QueryBuilder({
    required this.table,
    this.fields = const {},
    this.extraFields = const {},
    required this.help,
  });

  final T table;
  final FieldMap fields;
  final FieldMap extraFields;
  final String help;

  drift.Expression<bool?> build(Query? query) {
    if (query == null) {
      return falseExpression;
      //
    } else if (query is TextQuery) {
      return call(null, query);
      //
    } else if (query is FieldCompareQuery) {
      final field = fields[query.field.text] ?? extraFields[query.field.text];
      if (field != null) return field(query.operator.text, query.text);

      return falseExpression;
      //
    } else if (query is FieldScope) {
      final field = fields[query.field.text] ?? extraFields[query.field.text];
      if (field != null) return field.build(query.child);

      return falseExpression;
      //
    } else if (query is GroupQuery) {
      return build(query.child);
      //
    } else if (query is NotQuery) {
      return build(query.child).not();
      //
    } else if (query is AndQuery) {
      return buildAnd(query.children.map(build));
      //
    } else if (query is OrQuery) {
      return buildOr(query.children.map(build));
      //
    } else if (query is RangeQuery) {
      return call(query.startInclusive ? '>=' : '>', query.start) & call(query.endInclusive ? '<=' : '<', query.end);
      //
    }

    return falseExpression;
  }

  drift.Expression<bool?> call(String? op, TextQuery query) {
    if (op == null) {
      return fallback(query);
    } else if (op == '=') {
      return equal(query);
    } else if (op == '!=') {
      return notEqual(query);
    } else if (op == '<') {
      return lessThan(query);
    } else if (op == '<=') {
      return lessThanEqual(query);
    } else if (op == '>') {
      return moreThan(query);
    } else if (op == '>=') {
      return moreThanEqual(query);
    }

    return falseExpression;
  }

  drift.Expression<bool?> fallback(TextQuery query) => equal(query);

  drift.Expression<bool?> equal(TextQuery query) => falseExpression;

  drift.Expression<bool?> notEqual(TextQuery query) => equal(query).not();

  drift.Expression<bool?> lessThan(TextQuery query) => falseExpression;

  drift.Expression<bool?> lessThanEqual(TextQuery query) => falseExpression;

  drift.Expression<bool?> moreThan(TextQuery query) => falseExpression;

  drift.Expression<bool?> moreThanEqual(TextQuery query) => falseExpression;

  Future<Iterable<Option>> options(Database db, String text, Query? query, int position, [String? op]) async {
    if (query == null) {
      return listFields(text, position, position, op: ':');
      //
    } else if (!query.within(position)) {
      return const [];
      //
    } else if (query is TextQuery) {
      return [
        ...listFields(text, query.startIndex, query.endIndex, search: query.text, op: ':'),
        ...await listOptions(db, text, query, op ?? '='),
      ];
      //
    } else if (query is FieldCompareQuery) {
      if (query.field.within(position)) {
        return listFields(text, query.field.startIndex, query.field.endIndex, search: query.field.text);
      }

      final field = fields[query.field.text] ?? extraFields[query.field.text];
      if (field == null) return const [];

      return field.options(db, text, query.text, position, query.operator.text);
      //
    } else if (query is FieldScope) {
      if (query.field.within(position)) {
        return listFields(text, query.field.startIndex, query.field.endIndex, search: query.field.text);
      }

      final field = fields[query.field.text] ?? extraFields[query.field.text];
      if (field == null) return const [];

      final child = query.child;
      if (child is TextQuery) return await field.listOptions(db, text, child, '=');

      return field.options(db, text, child, position, '=');
      //
    } else if (query is GroupQuery) {
      return options(db, text, query.child, position, op);
      //
    } else if (query is NotQuery) {
      return options(db, text, query.child, position, op);
      //
    } else if (query is AndQuery) {
      final children = query.children.reversed.where((e) => e.within(position));
      for (final child in children) {
        final result = await options(db, text, child, position, op);
        if (result.isNotEmpty) return result;
      }
      return const [];
      //
    } else if (query is OrQuery) {
      final children = query.children.reversed.where((e) => e.within(position));
      for (final child in children) {
        final result = await options(db, text, child, position, op);
        if (result.isNotEmpty) return result;
      }
      return const [];
      //
    } else if (query is RangeQuery) {
      if (query.start.within(position)) {
        return options(db, text, query.start, position, '=');
      } else if (query.end.within(position)) {
        return options(db, text, query.end, position, '=');
      }

      return const [];
      //
    }

    return const [];
  }

  Iterable<Option> listFields(String text, int start, int stop, {String? search, String op = ''}) {
    var options = fields.entries.followedBy(extraFields.entries);
    if (search != null) {
      options = options.where((e) => e.key.toLowerCase().contains(search.toLowerCase()));
    }

    return options.map((e) => Option.replace(text, start, stop, '${e.key}$op', e.value.help));
  }

  Future<Iterable<Option>> listOptions(Database db, String text, TextQuery query, String op) async {
    final select = await buildOptionsQuery(db, query, op).get();
    return [
      ...await listSpecialOptions(db, text, query, op),
      ...select.map((e) {
        return Option.replace(text, query.startIndex, query.endIndex, e.read(optionColumn).toString());
      }),
    ];
  }

  Future<Iterable<Option>> listSpecialOptions(Database db, String text, TextQuery query, String op) async => const [];

  drift.Selectable<drift.TypedResult> buildOptionsQuery(Database db, TextQuery query, String op) {
    return db.selectOnly(table, distinct: true).also((q) {
      q.addColumns([optionColumn]);
      q.where((query.text.isEmpty ? trueExpression : call(op, query)) & optionColumn.isNotNull());
      q.orderBy(optionOrderBy);
    });
  }

  drift.Expression get optionColumn;

  List<drift.OrderingTerm> get optionOrderBy => [
        drift.OrderingTerm(expression: optionColumn, mode: drift.OrderingMode.asc),
      ];
}

abstract class ColumnQueryBuilder<T extends drift.TableInfo, C extends drift.GeneratedColumn> extends QueryBuilder<T> {
  const ColumnQueryBuilder({
    required super.table,
    required this.column,
    super.fields,
    super.extraFields,
    required super.help,
  });

  final C column;

  @override
  drift.Expression get optionColumn => column;
}

class StringQueryBuilder<T extends drift.TableInfo> extends ColumnQueryBuilder<T, drift.GeneratedColumn<String?>> {
  const StringQueryBuilder({
    required super.table,
    required super.column,
    this.strippedColumn,
    super.fields,
    super.extraFields,
    required super.help,
  });

  final drift.Column<String?>? strippedColumn;

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    final text = query.text.toLowerCase();
    final result = column.lower().equals(text);
    if (strippedColumn == null) return result;

    return result | strippedColumn!.lower().equals(text);
  }
}

class ContainsStringQueryBuilder<T extends drift.TableInfo> extends StringQueryBuilder<T> {
  const ContainsStringQueryBuilder({
    required super.table,
    required super.column,
    super.strippedColumn,
    super.fields,
    super.extraFields,
    required super.help,
  });

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    final text = query.text.toLowerCase();
    final result = column.lower().contains(text);
    if (strippedColumn == null) return result;

    return result | strippedColumn!.lower().contains(text);
  }
}

class CodeNameQueryBuilder<T extends drift.TableInfo> extends QueryBuilder<T> {
  const CodeNameQueryBuilder(
    this.code,
    this.name, {
    this.strippedName,
    required super.table,
    super.fields,
    super.extraFields,
    required super.help,
  });

  final drift.GeneratedColumn<String?> code;
  final drift.GeneratedColumn<String?> name;
  final drift.GeneratedColumn<String?>? strippedName;

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    final text = query.text.toLowerCase();
    final result = code.lower().equals(text) | name.lower().contains(text);
    if (strippedName == null) return result;

    return result | strippedName!.lower().contains(text);
  }

  @override
  drift.Expression get optionColumn => name;
}

class IntQueryBuilder<T extends drift.TableInfo> extends ColumnQueryBuilder<T, drift.GeneratedColumn<int?>> {
  const IntQueryBuilder({
    required super.table,
    required super.column,
    super.fields,
    super.extraFields,
    required super.help,
  });

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return column.equals(parse(query));
  }

  @override
  drift.Expression<bool?> lessThan(TextQuery query) {
    return column.isSmallerThanValue(parse(query));
  }

  @override
  drift.Expression<bool?> lessThanEqual(TextQuery query) {
    return column.isSmallerOrEqualValue(parse(query));
  }

  @override
  drift.Expression<bool?> moreThan(TextQuery query) {
    return column.isBiggerThanValue(parse(query));
  }

  @override
  drift.Expression<bool?> moreThanEqual(TextQuery query) {
    return column.isBiggerOrEqualValue(parse(query));
  }

  int? parse(TextQuery query) => int.tryParse(query.text);
}

class BoolQueryBuilder<T extends drift.TableInfo> extends ColumnQueryBuilder<T, drift.GeneratedColumn<bool?>> {
  const BoolQueryBuilder({
    required super.table,
    required super.column,
    super.fields,
    super.extraFields,
    required super.help,
  });

  static Map<String, bool> lookup = {
    'true': true,
    'yes': true,
    '1': true,
    'false': false,
    'no': false,
    '0': false,
  };

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return column.equals(parse(query));
  }

  bool? parse(TextQuery query) {
    return lookup[query.text];
  }
}

class DateTimeQueryBuilder<T extends drift.TableInfo>
    extends ColumnQueryBuilder<T, drift.GeneratedColumnWithTypeConverter<DateTime?, int?>> {
  const DateTimeQueryBuilder({
    required super.table,
    required super.column,
    super.fields,
    super.extraFields,
    required super.help,
  });

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    if (query.text == 'today') {
      final start = startOfToday;
      final end = endOfToday;
      return column.isBetweenValues(convert(start), convert(end));
    } else if (query.text == 'yesterday') {
      final start = startOfYesterday;
      final end = endOfYesterday;
      return column.isBetweenValues(convert(start), convert(end));
    } else if (query.text == 'month') {
      final start = startOfMonth;
      final end = endOfMonth;
      return column.isBetweenValues(convert(start), convert(end));
    } else if (query.text == 'year') {
      final start = startOfYear;
      final end = endOfYear;
      return column.isBetweenValues(convert(start), convert(end));
    }

    return datetime().like('${query.text}%');
  }

  @override
  drift.Expression<bool?> lessThan(TextQuery query) {
    return datetime().isSmallerThanValue(parseStart(query)?.toIso8601String() ?? query.text);
  }

  @override
  drift.Expression<bool?> lessThanEqual(TextQuery query) {
    return datetime().isSmallerOrEqualValue(parseEnd(query)?.toIso8601String() ?? query.text);
  }

  @override
  drift.Expression<bool?> moreThan(TextQuery query) {
    return datetime().isBiggerThanValue(parseEnd(query)?.toIso8601String() ?? query.text);
  }

  @override
  drift.Expression<bool?> moreThanEqual(TextQuery query) {
    return datetime().isBiggerOrEqualValue(parseStart(query)?.toIso8601String() ?? query.text);
  }

  int? convert(DateTime? value) {
    if (value == null) return null;
    return column.converter.toSql(value);
  }

  DateTime? parseStart(TextQuery query) {
    if (query.text == 'today') {
      return startOfToday;
    } else if (query.text == 'yesterday') {
      return startOfYesterday;
    } else if (query.text == 'month') {
      return startOfMonth;
    } else if (query.text == 'year') {
      return startOfYear;
    }
    return null;
  }

  DateTime? parseEnd(TextQuery query) {
    if (query.text == 'today') {
      return endOfToday;
    } else if (query.text == 'yesterday') {
      return endOfYesterday;
    } else if (query.text == 'month') {
      return endOfMonth;
    } else if (query.text == 'year') {
      return endOfYear;
    }
    return null;
  }

  DateTime get startOfToday {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 1);
  }

  DateTime get endOfToday {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1, 0);
  }

  DateTime get startOfYesterday {
    final today = startOfToday;
    return DateTime(today.year, today.month, today.day - 1, 1);
  }

  DateTime get endOfYesterday {
    final today = endOfToday;
    return DateTime(today.year, today.month, today.day - 1, 0);
  }

  DateTime get startOfMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  DateTime get endOfMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0);
  }

  DateTime get startOfYear {
    final now = DateTime.now();
    return DateTime(now.year, 1);
  }

  DateTime get endOfYear {
    final now = DateTime.now();
    return DateTime(now.year + 1, 0);
  }

  drift.Expression<String?> datetime() => column.dartCast<DateTime?>().datetime;

  @override
  Future<Iterable<Option>> listSpecialOptions(Database db, String text, TextQuery query, String op) async {
    return [
      for (final extra in const ['today', 'yesterday', 'month', 'year'])
        if (extra.startsWith(query.text)) Option.replace(text, query.startIndex, query.endIndex, extra),
    ];
  }

  @override
  drift.Expression<String?> get optionColumn => column.dartCast<DateTime?>().date;

  @override
  List<drift.OrderingTerm> get optionOrderBy => [
        drift.OrderingTerm(expression: optionColumn, mode: drift.OrderingMode.desc),
      ];
}

class DeckTagsQueryBuilder extends QueryBuilder<DeckTag> {
  DeckTagsQueryBuilder(
    this.db, {
    required super.table,
    super.fields,
    super.extraFields,
    required super.help,
  });

  final Database db;

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return db.deck.id.isInQuery(
      db.selectOnly(table).also((e) {
        e.addColumns([table.deckId]);
        e.where(table.tag.lower().equals(query.text.toLowerCase()));
      }),
    );
  }

  @override
  drift.Expression get optionColumn => table.tag;
}

class DeckCardsQueryBuilder extends CodeNameQueryBuilder<DeckCard> {
  DeckCardsQueryBuilder(
    this.db, {
    required super.table,
    super.fields,
    super.extraFields,
    required super.help,
  }) : super(db.card.code, db.card.title, strippedName: db.card.strippedTitle);

  final Database db;

  @override
  drift.Expression<bool?> call(String? op, TextQuery query) {
    return db.deck.id.isInQuery(
      db.selectOnly(table).join([
        drift.innerJoin(db.card, table.cardCode.equalsExp(db.card.code)),
      ]).also((e) {
        e.addColumns([table.deckId]);
        e.where(super.call(op, query));
      }),
    );
  }

  @override
  drift.Selectable<drift.TypedResult> buildOptionsQuery(Database db, TextQuery query, String op) {
    return db.selectOnly(db.deck, distinct: true).join([
      drift.innerJoin(table, table.deckId.equalsExp(db.deck.id)),
      drift.innerJoin(db.card, db.card.code.equalsExp(table.cardCode)),
    ]).also((q) {
      q.addColumns([optionColumn]);
      q.where((query.text.isEmpty ? trueExpression : super.call(op, query)) & optionColumn.isNotNull());
      q.orderBy([drift.OrderingTerm(expression: optionColumn)]);
    });
  }

  @override
  drift.Expression get optionColumn => db.card.title;
}

class CardQueryBuilder extends CodeNameQueryBuilder<Card> {
  CardQueryBuilder._(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.strippedTitle,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'card code'),
            'title': ContainsStringQueryBuilder(
                table: table, column: table.title, strippedColumn: table.strippedTitle, help: 'card title'),
            'body': ContainsStringQueryBuilder(
                table: table, column: table.body, strippedColumn: table.strippedBody, help: 'card body'),
            'keyword': ContainsStringQueryBuilder(table: table, column: table.keywords, help: 'card keyword'),
            'flavor': ContainsStringQueryBuilder(table: table, column: table.flavor, help: 'card flavor'),
            'quantity': IntQueryBuilder(table: table, column: table.quantity, help: 'card quantity'),
            'cost': IntQueryBuilder(table: table, column: table.cost, help: 'card cost'),
            'limit': IntQueryBuilder(table: table, column: table.deckLimit, help: 'card deck limit'),
            'influence': IntQueryBuilder(table: table, column: table.factionCost, help: 'card influence cost'),
            'unique': BoolQueryBuilder(table: table, column: table.uniqueness, help: 'card uniqeness'),
            'advancement': IntQueryBuilder(table: table, column: table.advancementCost, help: 'card advancement cost'),
            'mu': IntQueryBuilder(table: table, column: table.memoryCost, help: 'card mu'),
            'strength': IntQueryBuilder(table: table, column: table.strength, help: 'card strength'),
            'agenda': IntQueryBuilder(table: table, column: table.agendaPoints, help: 'card agenda points'),
            'trash': IntQueryBuilder(table: table, column: table.trashCost, help: 'card trash cost'),
            'link': IntQueryBuilder(table: table, column: table.baseLink, help: 'identity base link'),
            'influence_limit':
                IntQueryBuilder(table: table, column: table.influenceLimit, help: 'identity influence limit'),
            'min_deck': IntQueryBuilder(table: table, column: table.minimumDeckSize, help: 'identity min deck size'),
          },
        );

  factory CardQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'card': CardQueryBuilder._(db, table: db.card, extraFields: extraFields, help: 'card title'),
      'cycle': CycleQueryBuilder(db, table: db.cycle, extraFields: extraFields, help: 'cycle code or name'),
      'pack': PackQueryBuilder(db, table: db.pack, extraFields: extraFields, help: 'pack code or name'),
      'side': SideQueryBuilder(db, table: db.side, extraFields: extraFields, help: 'side code or name'),
      'faction': FactionQueryBuilder(db, table: db.faction, extraFields: extraFields, help: 'faction code or name'),
      'type': TypeQueryBuilder(db, table: db.type, extraFields: extraFields, help: 'type code or name'),
      'rotation': CardRotationQueryBuilder(db, table: db.rotation, extraFields: extraFields, help: 'card rotation'),
      'mwl': CardMwlQueryBuilder(db, table: db.mwl, extraFields: extraFields, help: 'card mwl'),
    });
    return CardQueryBuilder._(db, table: db.card, extraFields: extraFields, help: 'card title');
  }

  @override
  drift.Expression get optionColumn => table.strippedTitle;
}

class DeckQueryBuilder extends ContainsStringQueryBuilder<Deck> {
  DeckQueryBuilder._(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          column: table.name,
          fields: {
            'name': ContainsStringQueryBuilder(table: table, column: db.deck.name, help: 'deck name'),
            'description':
                ContainsStringQueryBuilder(table: table, column: db.deck.description, help: 'deck description'),
            'created': DateTimeQueryBuilder(table: table, column: db.deck.created, help: 'deck created date'),
            'updated': DateTimeQueryBuilder(table: table, column: db.deck.updated, help: 'deck updated date'),
            'synced': DateTimeQueryBuilder(table: table, column: db.deck.synced, help: 'deck synced date'),
            'remote_updated':
                DateTimeQueryBuilder(table: table, column: db.deck.remoteUpdated, help: 'deck remote updated date'),
          },
        );

  factory DeckQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'deck': DeckQueryBuilder._(db, table: db.deck, extraFields: extraFields, help: 'deck name'),
      'identity': CardQueryBuilder._(db,
          table: db.card.createAlias('identity'), extraFields: extraFields, help: 'identity name'),
      'cycle': CycleQueryBuilder(db, table: db.cycle, extraFields: extraFields, help: 'identity cycle code or name'),
      'pack': PackQueryBuilder(db, table: db.pack, extraFields: extraFields, help: 'identity pack code or name'),
      'side': SideQueryBuilder(db, table: db.side, extraFields: extraFields, help: 'identity side code or name'),
      'faction':
          FactionQueryBuilder(db, table: db.faction, extraFields: extraFields, help: 'identity faction code or name'),
      'card': DeckCardsQueryBuilder(db, table: db.deckCard, extraFields: extraFields, help: 'deck card'),
      'tag': DeckTagsQueryBuilder(db, table: db.deckTag, extraFields: extraFields, help: 'deck tag'),
      'format': FormatQueryBuilder(db, table: db.format, extraFields: extraFields, help: 'deck format'),
      'rotation': RotationQueryBuilder(db, table: db.rotation, extraFields: extraFields, help: 'deck rotation'),
      'mwl': MwlQueryBuilder(db, table: db.mwl, extraFields: extraFields, help: 'deck mwl'),
    });
    return DeckQueryBuilder._(db, table: db.deck, extraFields: extraFields, help: 'deck name');
  }
}

class CycleQueryBuilder extends CodeNameQueryBuilder<Cycle> {
  CycleQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'cycle code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'cycle name'),
            'position': IntQueryBuilder(table: table, column: table.position, help: 'cycle position'),
            'rotated': BoolQueryBuilder(table: table, column: table.rotated, help: 'cycle rotated'),
          },
        );
}

class PackQueryBuilder extends CodeNameQueryBuilder<Pack> {
  PackQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'pack code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'pack name'),
            'position': IntQueryBuilder(table: table, column: table.position, help: 'pack position'),
            'release': DateTimeQueryBuilder(table: table, column: table.dateRelease, help: 'pack release date'),
          },
        );
}

class SideQueryBuilder extends CodeNameQueryBuilder<Side> {
  SideQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'side code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'side name'),
          },
        );
}

class FactionQueryBuilder extends CodeNameQueryBuilder<Faction> {
  FactionQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'faction code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'faction name'),
            'mini': BoolQueryBuilder(table: table, column: table.isMini, help: 'is mini faction'),
          },
        );
}

class TypeQueryBuilder extends CodeNameQueryBuilder<Type> {
  TypeQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'type code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'type name'),
            'position': IntQueryBuilder(table: table, column: table.position, help: 'type position'),
            'subtype': BoolQueryBuilder(table: table, column: table.isSubtype, help: 'type is subtype'),
          },
        );
}

class FormatQueryBuilder extends CodeNameQueryBuilder<Format> {
  FormatQueryBuilder(
    Database db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'format code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'format name'),
          },
        );
}

class RotationQueryBuilder extends CodeNameQueryBuilder<Rotation> {
  RotationQueryBuilder(
    this.db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'rotation code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'rotation name'),
            'type': StringQueryBuilder(table: table, column: table.type, help: 'rotation type'),
            'start': DateTimeQueryBuilder(table: table, column: table.dateStart, help: 'rotation start date'),
          },
        );

  final Database db;

  @override
  drift.Selectable<drift.TypedResult> buildOptionsQuery(Database db, TextQuery query, String op) {
    return db.selectOnly(table, distinct: true).join([
      drift.innerJoin(db.format, db.format.code.equalsExp(table.formatCode)),
    ]).also((q) {
      q.addColumns([optionColumn]);
      q.where((query.text.isEmpty ? trueExpression : call(op, query)) & optionColumn.isNotNull());
      q.orderBy(optionOrderBy);
    });
  }

  @override
  List<drift.OrderingTerm> get optionOrderBy => [
        drift.OrderingTerm(expression: db.format.id, mode: drift.OrderingMode.asc),
        drift.OrderingTerm(
            expression: db.rotation.type.equalsValue(RotationType.current), mode: drift.OrderingMode.desc),
        drift.OrderingTerm(
            expression: db.rotation.type.equalsValue(RotationType.latest), mode: drift.OrderingMode.desc),
        drift.OrderingTerm(expression: db.rotation.dateStart, mode: drift.OrderingMode.desc),
      ];
}

class CardRotationQueryBuilder extends RotationQueryBuilder {
  CardRotationQueryBuilder(
    super.db, {
    required super.table,
    super.extraFields,
    required super.help,
  });

  @override
  drift.Expression<bool?> call(String? op, TextQuery query) {
    final inQuery = db.selectOnly(db.rotation).join([
      drift.innerJoin(db.rotationCycle, db.rotationCycle.rotationCode.equalsExp(db.rotation.code)),
      drift.innerJoin(db.pack, db.pack.cycleCode.equalsExp(db.rotationCycle.cycleCode)),
    ]).also((q) {
      q.addColumns([db.pack.code]);
      q.where(super.call(op, query));
    });

    return db.pack.code.isInQuery(inQuery);
  }
}

class MwlQueryBuilder extends CodeNameQueryBuilder<Mwl> {
  MwlQueryBuilder(
    this.db, {
    required super.table,
    super.extraFields,
    required super.help,
  }) : super(
          table.code,
          table.name,
          fields: {
            'code': StringQueryBuilder(table: table, column: table.code, help: 'mwl code'),
            'name': ContainsStringQueryBuilder(table: table, column: table.name, help: 'mwl name'),
            'type': StringQueryBuilder(table: table, column: table.type, help: 'mwl type'),
            'start': DateTimeQueryBuilder(table: table, column: table.dateStart, help: 'mwl start date'),
          },
        );

  final Database db;

  @override
  drift.Selectable<drift.TypedResult> buildOptionsQuery(Database db, TextQuery query, String op) {
    return db.selectOnly(table, distinct: true).join([
      drift.innerJoin(db.format, db.format.code.equalsExp(table.formatCode)),
    ]).also((q) {
      q.addColumns([optionColumn]);
      q.where((query.text.isEmpty ? trueExpression : call(op, query)) & optionColumn.isNotNull());
      q.orderBy(optionOrderBy);
    });
  }

  @override
  List<drift.OrderingTerm> get optionOrderBy => [
        drift.OrderingTerm(expression: db.format.id, mode: drift.OrderingMode.asc),
        drift.OrderingTerm(expression: db.mwl.type.equalsValue(MwlType.active), mode: drift.OrderingMode.desc),
        drift.OrderingTerm(expression: db.mwl.type.equalsValue(MwlType.latest), mode: drift.OrderingMode.asc),
        drift.OrderingTerm(expression: db.mwl.dateStart, mode: drift.OrderingMode.desc),
      ];
}

class CardMwlQueryBuilder extends MwlQueryBuilder {
  CardMwlQueryBuilder(
    super.db, {
    required super.table,
    super.extraFields,
    required super.help,
  });

  @override
  drift.Expression<bool?> call(String? op, TextQuery query) {
    final inQuery = db.selectOnly(db.card).join([
      drift.crossJoin(db.mwl),
      drift.leftOuterJoin(
          db.mwlCard, db.mwlCard.mwlCode.equalsExp(db.mwl.code) & db.mwlCard.cardCode.equalsExp(db.card.code)),
    ]).also((q) {
      q.addColumns([db.card.code]);
      q.where(super.call(op, query) & (db.mwlCard.deckLimit.isNull() | db.mwlCard.deckLimit.isBiggerThanValue(0)));
    });

    return db.card.code.isInQuery(inQuery);
  }
}
