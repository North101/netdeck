import 'package:drift/drift.dart' as drift;
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
  });

  final FieldMap fields;
  final FieldMap extraFields;

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
  }) : super(
          fields: fields,
          extraFields: extraFields,
        );

  final drift.GeneratedColumn<T?> column;
}

class StringQueryBuilder extends ColumnQueryBuilder<String?> {
  const StringQueryBuilder(
    drift.GeneratedColumn<String?> column, {
    FieldMap fields = const {},
    FieldMap extraFields = const {},
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
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
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
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
  }) : super(
          fields: fields,
          extraFields: extraFields,
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
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
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
  }) : super(
          column,
          fields: fields,
          extraFields: extraFields,
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

class CardQueryBuilder extends CodeNameQueryBuilder {
  CardQueryBuilder._(
    Database db,
    Card table, {
    FieldMap extraFields = const {},
  }) : super(
          table.code,
          table.title,
          fields: {
            'code': StringQueryBuilder(table.code),
            'title': ContainsStringQueryBuilder(table.title),
            'body': ContainsStringQueryBuilder(table.body),
            'keyword': ContainsStringQueryBuilder(table.keywords),
            'flavor': ContainsStringQueryBuilder(table.flavor),
            'quantity': IntQueryBuilder(table.quantity),
            'cost': IntQueryBuilder(table.cost),
            'limit': IntQueryBuilder(table.deckLimit),
            'influence': IntQueryBuilder(table.factionCost),
            'unique': BoolQueryBuilder(table.uniqueness),
            'advancement': IntQueryBuilder(table.advancementCost),
            'mu': IntQueryBuilder(table.memoryCost),
            'strength': IntQueryBuilder(table.strength),
            'agenda': IntQueryBuilder(table.agendaPoints),
            'trash': IntQueryBuilder(table.trashCost),
            'link': IntQueryBuilder(table.baseLink),
            'influence_limit': IntQueryBuilder(table.influenceLimit),
            'min_deck': IntQueryBuilder(table.minimumDeckSize),
          },
          extraFields: extraFields,
        );

  factory CardQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'card': CardQueryBuilder._(db, db.card, extraFields: extraFields),
      'cycle': CycleQueryBuilder(db, extraFields: extraFields),
      'pack': PackQueryBuilder(db, extraFields: extraFields),
      'side': SideQueryBuilder(db, extraFields: extraFields),
      'faction': FactionQueryBuilder(db, extraFields: extraFields),
      'type': TypeQueryBuilder(db, extraFields: extraFields),
    });
    return CardQueryBuilder._(db, db.card, extraFields: extraFields);
  }
}

class DeckQueryBuilder extends ContainsStringQueryBuilder {
  DeckQueryBuilder._(
    Database db,
    Deck table, {
    FieldMap extraFields = const {},
  }) : super(
          table.name,
          fields: {
            'name': ContainsStringQueryBuilder(db.deck.name),
            'description': ContainsStringQueryBuilder(db.deck.description),
          },
          extraFields: extraFields,
        );

  factory DeckQueryBuilder(Database db) {
    final FieldMap extraFields = {};
    extraFields.addAll({
      'deck': DeckQueryBuilder._(db, db.deck, extraFields: extraFields),
      //'tag': TagQueryBuilder(db, 'deck tag', extraFields: extraFields),
      'identity': CardQueryBuilder._(db, db.card.createAlias('identity'), extraFields: extraFields),
      'cycle': CycleQueryBuilder(db, extraFields: extraFields),
      'pack': PackQueryBuilder(db, extraFields: extraFields),
      'side': SideQueryBuilder(db, extraFields: extraFields),
      'faction': FactionQueryBuilder(db, extraFields: extraFields),
      'type': TypeQueryBuilder(db, extraFields: extraFields),
    });
    return DeckQueryBuilder._(db, db.deck, extraFields: extraFields);
  }
}

class CycleQueryBuilder extends CodeNameQueryBuilder {
  CycleQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.cycle.code,
          db.cycle.name,
          fields: {
            'code': StringQueryBuilder(db.cycle.code),
            'name': ContainsStringQueryBuilder(db.cycle.name),
            'position': IntQueryBuilder(db.cycle.position),
          },
          extraFields: extraFields,
        );
}

class PackQueryBuilder extends CodeNameQueryBuilder {
  PackQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.pack.code,
          db.pack.name,
          fields: {
            'code': StringQueryBuilder(db.pack.code),
            'name': ContainsStringQueryBuilder(db.pack.name),
            'position': IntQueryBuilder(db.pack.position),
          },
          extraFields: extraFields,
        );
}

class SideQueryBuilder extends CodeNameQueryBuilder {
  SideQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.side.code,
          db.side.name,
          fields: {
            'code': StringQueryBuilder(db.side.code),
            'name': ContainsStringQueryBuilder(db.side.name),
          },
          extraFields: extraFields,
        );
}

class FactionQueryBuilder extends CodeNameQueryBuilder {
  FactionQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.faction.code,
          db.faction.name,
          fields: {
            'code': StringQueryBuilder(db.faction.code),
            'name': ContainsStringQueryBuilder(db.faction.name),
            'mini': BoolQueryBuilder(db.faction.isMini),
          },
          extraFields: extraFields,
        );
}

class TypeQueryBuilder extends CodeNameQueryBuilder {
  TypeQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.type.code,
          db.type.name,
          fields: {
            'code': StringQueryBuilder(db.type.code),
            'name': ContainsStringQueryBuilder(db.type.name),
            'position': IntQueryBuilder(db.type.position),
          },
          extraFields: extraFields,
        );
}

class FormatQueryBuilder extends CodeNameQueryBuilder {
  FormatQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.format.code,
          db.format.name,
          fields: {
            'code': StringQueryBuilder(db.format.code),
            'name': ContainsStringQueryBuilder(db.format.name),
          },
          extraFields: extraFields,
        );
}

class RotationQueryBuilder extends CodeNameQueryBuilder {
  RotationQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.rotation.code,
          db.rotation.name,
          fields: {
            'code': StringQueryBuilder(db.rotation.code),
            'name': ContainsStringQueryBuilder(db.rotation.name),
          },
          extraFields: extraFields,
        );
}

class MwlQueryBuilder extends CodeNameQueryBuilder {
  MwlQueryBuilder(
    Database db, {
    FieldMap extraFields = const {},
  }) : super(
          db.mwl.code,
          db.mwl.name,
          fields: {
            'code': StringQueryBuilder(db.mwl.code),
            'name': ContainsStringQueryBuilder(db.mwl.name),
          },
          extraFields: extraFields,
        );
}
