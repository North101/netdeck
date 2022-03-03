import 'package:drift/drift.dart' as drift;
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:petitparser/petitparser.dart';
import 'package:query/query.dart';

import '/db/database.dart';

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

abstract class QueryBuilder {
  const QueryBuilder({
    this.fields = const {},
    this.extraFields = const {},
    required this.help,
  });

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
      final field = fields[query.field] ?? extraFields[query.field];
      if (field != null) {
        return field(query.operator, query.text);
      }
      print(fields.keys);
      print('Unknown field: ${query.field}');
      return falseExpression;
      //
    } else if (query is FieldScope) {
      final field = fields[query.field] ?? extraFields[query.field];
      if (field != null) {
        return field.build(query.child);
      }
      print(fields.keys);
      print('Unknown field: ${query.field}');
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
      //
    }

    print('Unknown query: $query');
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

    print('Unknown op: $op');
    return falseExpression;
  }

  drift.Expression<bool?> fallback(TextQuery query) => equal(query);

  drift.Expression<bool?> equal(TextQuery query) => falseExpression;

  drift.Expression<bool?> notEqual(TextQuery query) => equal(query).not();

  drift.Expression<bool?> lessThan(TextQuery query) => falseExpression;

  drift.Expression<bool?> lessThanEqual(TextQuery query) => falseExpression;

  drift.Expression<bool?> moreThan(TextQuery query) => falseExpression;

  drift.Expression<bool?> moreThanEqual(TextQuery query) => falseExpression;
}

abstract class ColumnQueryBuilder<T> extends QueryBuilder {
  const ColumnQueryBuilder(
    this.column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

  final drift.GeneratedColumn<T?> column;
}

class StringQueryBuilder extends ColumnQueryBuilder<String?> {
  const StringQueryBuilder(
    drift.GeneratedColumn<String?> column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return column.lower().equals(query.text.toLowerCase());
  }
}

class ContainsStringQueryBuilder extends ColumnQueryBuilder<String?> {
  const ContainsStringQueryBuilder(
    drift.GeneratedColumn<String?> column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return column.lower().contains(query.text.toLowerCase());
  }
}

class CodeNameQueryBuilder extends QueryBuilder {
  const CodeNameQueryBuilder(
    this.code,
    this.name, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

  final drift.GeneratedColumn<String?> code;
  final drift.GeneratedColumn<String?> name;

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return code.lower().equals(query.text.toLowerCase()) | name.lower().contains(query.text.toLowerCase());
  }
}

class IntQueryBuilder extends ColumnQueryBuilder<int?> {
  const IntQueryBuilder(
    drift.GeneratedColumn<int?> column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

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

class BoolQueryBuilder extends ColumnQueryBuilder<bool?> {
  const BoolQueryBuilder(
    drift.GeneratedColumn<bool?> column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

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

class TagQueryBuilder extends QueryBuilder {
  TagQueryBuilder(
    this.db, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          fields: fields,
          extraFields: extraFields,
          help: help,
        );

  final Database db;

  @override
  drift.Expression<bool?> equal(TextQuery query) {
    return db.deck.id.isInQuery(
      db.selectOnly(db.deckTag).also((e) {
        e.addColumns([db.deckTag.deckId]);
        e.where(db.deckTag.tag.lower().equals(query.text.toLowerCase()));
      }),
    );
  }
}

class CardQueryBuilder extends CodeNameQueryBuilder {
  CardQueryBuilder._(
    Database db,
    Card table, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          table.code,
          table.title,
          fields: {
            'code': StringQueryBuilder(table.code, help: 'card code'),
            'title': ContainsStringQueryBuilder(table.title, help: 'card title'),
            'body': ContainsStringQueryBuilder(table.body, help: 'card body'),
            'keyword': ContainsStringQueryBuilder(table.keywords, help: 'card keyword'),
            'flavor': ContainsStringQueryBuilder(table.flavor, help: 'card flavor'),
            'quantity': IntQueryBuilder(table.quantity, help: 'card quantity'),
            'cost': IntQueryBuilder(table.cost, help: 'card cost'),
            'limit': IntQueryBuilder(table.deckLimit, help: 'card deck limit'),
            'influence': IntQueryBuilder(table.factionCost, help: 'card influence cost'),
            'unique': BoolQueryBuilder(table.uniqueness, help: 'card uniqeness'),
            'advancement': IntQueryBuilder(table.advancementCost, help: 'card advancement cost'),
            'mu': IntQueryBuilder(table.memoryCost, help: 'card mu'),
            'strength': IntQueryBuilder(table.strength, help: 'card strength'),
            'agenda': IntQueryBuilder(table.agendaPoints, help: 'card agenda points'),
            'trash': IntQueryBuilder(table.trashCost, help: 'card trash cost'),
            'link': IntQueryBuilder(table.baseLink, help: 'identity base link'),
            'influence_limit': IntQueryBuilder(table.influenceLimit, help: 'identity influence limit'),
            'min_deck': IntQueryBuilder(table.minimumDeckSize, help: 'identity min deck size'),
          },
          extraFields: extraFields,
          help: help,
        );

  factory CardQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'card': CardQueryBuilder._(db, db.card, extraFields: extraFields, help: 'card title'),
      'cycle': CycleQueryBuilder(db, extraFields: extraFields, help: 'cycle code or name'),
      'pack': PackQueryBuilder(db, extraFields: extraFields, help: 'pack code or name'),
      'side': SideQueryBuilder(db, extraFields: extraFields, help: 'side code or name'),
      'faction': FactionQueryBuilder(db, extraFields: extraFields, help: 'faction code or name'),
      'type': TypeQueryBuilder(db, extraFields: extraFields, help: 'type code or name'),
    });
    return CardQueryBuilder._(db, db.card, extraFields: extraFields, help: 'card title');
  }
}

class DeckQueryBuilder extends ContainsStringQueryBuilder {
  DeckQueryBuilder._(
    Database db,
    Deck table, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          table.name,
          fields: {
            'name': ContainsStringQueryBuilder(db.deck.name, help: 'deck name'),
            'description': ContainsStringQueryBuilder(db.deck.description, help: 'deck description'),
          },
          extraFields: extraFields,
          help: help,
        );

  factory DeckQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'deck': DeckQueryBuilder._(db, db.deck, extraFields: extraFields, help: 'deck name'),
      'tag': TagQueryBuilder(db, extraFields: extraFields, help: 'deck tag'),
      'identity': CardQueryBuilder._(db, db.card.createAlias('identity'), extraFields: extraFields, help: 'identity name'),
      'cycle': CycleQueryBuilder(db, extraFields: extraFields, help: 'cycle code or name'),
      'pack': PackQueryBuilder(db, extraFields: extraFields, help: 'pack code or name'),
      'side': SideQueryBuilder(db, extraFields: extraFields, help: 'side code or name'),
      'faction': FactionQueryBuilder(db, extraFields: extraFields, help: 'faction code or name'),
      'type': TypeQueryBuilder(db, extraFields: extraFields, help: 'type code or name'),
    });
    return DeckQueryBuilder._(db, db.deck, extraFields: extraFields, help: 'deck name');
  }
}

class CycleQueryBuilder extends CodeNameQueryBuilder {
  CycleQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.cycle.code,
          db.cycle.name,
          fields: {
            'code': StringQueryBuilder(db.cycle.code, help: 'cycle code'),
            'name': ContainsStringQueryBuilder(db.cycle.name, help: 'cycle name'),
            'position': IntQueryBuilder(db.cycle.position, help: 'cycle position'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class PackQueryBuilder extends CodeNameQueryBuilder {
  PackQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.pack.code,
          db.pack.name,
          fields: {
            'code': StringQueryBuilder(db.pack.code, help: 'pack code'),
            'name': ContainsStringQueryBuilder(db.pack.name, help: 'pack name'),
            'position': IntQueryBuilder(db.pack.position, help: 'pack position'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class SideQueryBuilder extends CodeNameQueryBuilder {
  SideQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.side.code,
          db.side.name,
          fields: {
            'code': StringQueryBuilder(db.side.code, help: 'side code'),
            'name': ContainsStringQueryBuilder(db.side.name, help: 'side name'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class FactionQueryBuilder extends CodeNameQueryBuilder {
  FactionQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.faction.code,
          db.faction.name,
          fields: {
            'code': StringQueryBuilder(db.faction.code, help: 'faction code'),
            'name': ContainsStringQueryBuilder(db.faction.name, help: 'faction name'),
            'mini': BoolQueryBuilder(db.faction.isMini, help: 'is mini faction'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class TypeQueryBuilder extends CodeNameQueryBuilder {
  TypeQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.type.code,
          db.type.name,
          fields: {
            'code': StringQueryBuilder(db.type.code, help: 'type code'),
            'name': ContainsStringQueryBuilder(db.type.name, help: 'type name'),
            'position': IntQueryBuilder(db.type.position, help: 'type position'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class FormatQueryBuilder extends CodeNameQueryBuilder {
  FormatQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.format.code,
          db.format.name,
          fields: {
            'code': StringQueryBuilder(db.format.code, help: 'format code'),
            'name': ContainsStringQueryBuilder(db.format.name, help: 'format name'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class RotationQueryBuilder extends CodeNameQueryBuilder {
  RotationQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.rotation.code,
          db.rotation.name,
          fields: {
            'code': StringQueryBuilder(db.rotation.code, help: 'rotation code'),
            'name': ContainsStringQueryBuilder(db.rotation.name, help: 'rotation name'),
          },
          extraFields: extraFields,
          help: help,
        );
}

class MwlQueryBuilder extends CodeNameQueryBuilder {
  MwlQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
    required String help,
  }) : super(
          db.mwl.code,
          db.mwl.name,
          fields: {
            'code': StringQueryBuilder(db.mwl.code, help: 'mwl code'),
            'name': ContainsStringQueryBuilder(db.mwl.name, help: 'mwl name'),
          },
          extraFields: extraFields,
          help: help,
        );
}
