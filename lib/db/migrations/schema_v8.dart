// GENERATED CODE, DO NOT EDIT BY HAND.
//@dart=2.12
import 'package:drift/drift.dart';

class Type extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Type(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> sideCode = GeneratedColumn<String>(
      'side_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> isSubtype = GeneratedColumn<bool>(
      'is_subtype', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [code, sideCode, position, name, isSubtype];
  @override
  String get aliasedName => _alias ?? 'type';
  @override
  String get actualTableName => 'type';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Type createAlias(String alias) {
    return Type(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Side extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Side(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, name];
  @override
  String get aliasedName => _alias ?? 'side';
  @override
  String get actualTableName => 'side';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Side createAlias(String alias) {
    return Side(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Settings extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<bool> id = GeneratedColumn<bool>(
      'id', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  late final GeneratedColumn<String> filterFormatCode = GeneratedColumn<String>(
      'filter_format_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT NULL',
      defaultValue: const CustomExpression('NULL'));
  late final GeneratedColumn<String> filterRotationCode =
      GeneratedColumn<String>('filter_rotation_code', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT NULL',
          defaultValue: const CustomExpression('NULL'));
  late final GeneratedColumn<String> filterMwlCode = GeneratedColumn<String>(
      'filter_mwl_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT NULL',
      defaultValue: const CustomExpression('NULL'));
  late final GeneratedColumn<bool> filterCollection = GeneratedColumn<bool>(
      'filter_collection', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  late final GeneratedColumn<String> cardSort = GeneratedColumn<String>(
      'card_sort', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'set\'',
      defaultValue: const CustomExpression('\'set\''));
  late final GeneratedColumn<String> cardGroup = GeneratedColumn<String>(
      'card_group', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'type\'',
      defaultValue: const CustomExpression('\'type\''));
  late final GeneratedColumn<String> deckSort = GeneratedColumn<String>(
      'deck_sort', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'updated\'',
      defaultValue: const CustomExpression('\'updated\''));
  late final GeneratedColumn<String> deckGroup = GeneratedColumn<String>(
      'deck_group', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'side\'',
      defaultValue: const CustomExpression('\'side\''));
  late final GeneratedColumn<String> deckCardSort = GeneratedColumn<String>(
      'deck_card_sort', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'set\'',
      defaultValue: const CustomExpression('\'set\''));
  late final GeneratedColumn<String> deckCardGroup = GeneratedColumn<String>(
      'deck_card_group', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'type\'',
      defaultValue: const CustomExpression('\'type\''));
  late final GeneratedColumn<String> compareCardSort = GeneratedColumn<String>(
      'compare_card_sort', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'set\'',
      defaultValue: const CustomExpression('\'set\''));
  late final GeneratedColumn<bool> apexResources = GeneratedColumn<bool>(
      'apex_resources', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  late final GeneratedColumn<String> cardGalleryView = GeneratedColumn<String>(
      'card_gallery_view', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'image\'',
      defaultValue: const CustomExpression('\'image\''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        filterFormatCode,
        filterRotationCode,
        filterMwlCode,
        filterCollection,
        cardSort,
        cardGroup,
        deckSort,
        deckGroup,
        deckCardSort,
        deckCardGroup,
        compareCardSort,
        apexResources,
        cardGalleryView
      ];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT settings_id CHECK(id = TRUE)'];
  @override
  bool get dontWriteConstraints => true;
}

class Format extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Format(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? 'format';
  @override
  String get actualTableName => 'format';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Format createAlias(String alias) {
    return Format(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Rotation extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Rotation(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
      'date_start', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [code, formatCode, name, dateStart];
  @override
  String get aliasedName => _alias ?? 'rotation';
  @override
  String get actualTableName => 'rotation';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Rotation createAlias(String alias) {
    return Rotation(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class RotationView extends ViewInfo<RotationView, Never>
    implements HasResultSet {
  final String? _alias;
  @override
  final DatabaseAtV8 attachedDatabase;
  RotationView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns =>
      [code, formatCode, rotationCode, name, dateStart, type, id, code1, name1];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'rotation_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW rotation_view AS\nSELECT *\nFROM (\n  -- current\n  SELECT\n    format.code || \'@current\' AS code,\n    format.code AS format_code,\n    rotation.code AS rotation_code,\n    format.name || \' Current (\' || COALESCE(rotation.name, \'None\') || \')\' AS name,\n    rotation.date_start,\n    \'current\' AS type\n  FROM format\n  LEFT JOIN (\n    SELECT *, MAX(date_start)\n    FROM rotation\n    WHERE DATE(date_start) <= DATE(\'NOW\')\n    GROUP BY rotation.format_code\n  ) AS rotation\n    ON rotation.format_code = format.code\n\n  UNION ALL\n\n  -- latest\n  SELECT\n    format.code || \'@latest\' AS code,\n    format.code AS format_code,\n    rotation.code AS rotation_code,\n    format.name || \' Latest (\' || COALESCE(rotation.name, \'None\') || \')\' AS name,\n    rotation.date_start,\n    \'latest\' AS type\n  FROM format\n  LEFT JOIN (\n    SELECT *, MAX(date_start)\n    FROM rotation\n    GROUP BY rotation.format_code\n  ) AS rotation\n    ON rotation.format_code = format.code\n\n  UNION ALL\n\n  -- rest\n  SELECT\n    rotation.code,\n    rotation.format_code,\n    rotation.code,\n    rotation.name,\n    rotation.date_start,\n    NULL as type\n  FROM rotation\n) AS rotation\n\nINNER JOIN format\n  ON format.code = rotation.format_code\n\nORDER BY\n	format.id,\n  rotation.type DESC NULLS LAST,\n	rotation.date_start DESC;';
  @override
  RotationView get asDslTable => this;
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
      'date_start', aliasedName, true,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<int> id =
      GeneratedColumn<int>('id', aliasedName, false, type: DriftSqlType.int);
  late final GeneratedColumn<String> code1 = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name1 = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  @override
  RotationView createAlias(String alias) {
    return RotationView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {};
}

class Mwl extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mwl(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
      'date_start', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> runnerPoints = GeneratedColumn<int>(
      'runner_points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> corpPoints = GeneratedColumn<int>(
      'corp_points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [code, formatCode, name, dateStart, runnerPoints, corpPoints];
  @override
  String get aliasedName => _alias ?? 'mwl';
  @override
  String get actualTableName => 'mwl';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Mwl createAlias(String alias) {
    return Mwl(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class MwlView extends ViewInfo<MwlView, Never> implements HasResultSet {
  final String? _alias;
  @override
  final DatabaseAtV8 attachedDatabase;
  MwlView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        code,
        formatCode,
        mwlCode,
        name,
        dateStart,
        runnerPoints,
        corpPoints,
        type,
        id,
        code1,
        name1
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'mwl_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW mwl_view AS\nSELECT *\nFROM (\n  -- active\n  SELECT\n    format.code || \'@active\' AS code,\n    format.code AS format_code,\n    mwl.code AS mwl_code,\n    format.name || \' Active (\' || COALESCE(mwl.name, \'None\') || \')\' AS name,\n    mwl.date_start,\n    mwl.runner_points,\n    mwl.corp_points,\n    \'active\' AS type\n  FROM format\n  LEFT JOIN (\n    SELECT *, MAX(date_start)\n    FROM mwl\n    WHERE DATE(date_start) <= DATE(\'NOW\')\n    GROUP BY mwl.format_code\n  ) AS mwl\n    ON mwl.format_code = format.code\n\n  UNION ALL\n\n  -- latest\n  SELECT\n    format.code || \'@latest\' AS code,\n    format.code AS format_code,\n    mwl.code AS mwl_code,\n    format.name || \' Latest (\' || COALESCE(mwl.name, \'None\') || \')\' AS name,\n    mwl.date_start,\n    mwl.runner_points,\n    mwl.corp_points,\n    \'latest\' AS type\n  FROM format\n  LEFT JOIN (\n    SELECT *, MAX(date_start)\n    FROM mwl\n    GROUP BY mwl.format_code\n  ) AS mwl\n    ON mwl.format_code = format.code\n\n  UNION ALL\n\n  -- rest\n  SELECT\n    mwl.code,\n    mwl.format_code,\n    mwl.code,\n    mwl.name,\n    mwl.date_start,\n    mwl.runner_points,\n    mwl.corp_points,\n    NULL as type\n  FROM mwl\n) AS mwl\n\nINNER JOIN format\n  ON format.code = mwl.format_code\n\nORDER BY\n	format.id,\n  mwl.type DESC NULLS LAST,\n	mwl.date_start DESC;';
  @override
  MwlView get asDslTable => this;
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> mwlCode = GeneratedColumn<String>(
      'mwl_code', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
      'date_start', aliasedName, true,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<int> runnerPoints = GeneratedColumn<int>(
      'runner_points', aliasedName, true,
      type: DriftSqlType.int);
  late final GeneratedColumn<int> corpPoints = GeneratedColumn<int>(
      'corp_points', aliasedName, true,
      type: DriftSqlType.int);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<int> id =
      GeneratedColumn<int>('id', aliasedName, false, type: DriftSqlType.int);
  late final GeneratedColumn<String> code1 = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name1 = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string);
  @override
  MwlView createAlias(String alias) {
    return MwlView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {};
}

class RotationCycle extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RotationCycle(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> cycleCode = GeneratedColumn<String>(
      'cycle_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [rotationCode, cycleCode];
  @override
  String get aliasedName => _alias ?? 'rotation_cycle';
  @override
  String get actualTableName => 'rotation_cycle';
  @override
  Set<GeneratedColumn> get $primaryKey => {rotationCode, cycleCode};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  RotationCycle createAlias(String alias) {
    return RotationCycle(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY(rotation_code, cycle_code)'];
  @override
  bool get dontWriteConstraints => true;
}

class Cycle extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cycle(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> rotated = GeneratedColumn<bool>(
      'rotated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, position, name, size, rotated];
  @override
  String get aliasedName => _alias ?? 'cycle';
  @override
  String get actualTableName => 'cycle';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Cycle createAlias(String alias) {
    return Cycle(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Pack extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Pack(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> cycleCode = GeneratedColumn<String>(
      'cycle_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> dateRelease = GeneratedColumn<DateTime>(
      'date_release', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [code, cycleCode, position, name, dateRelease, size];
  @override
  String get aliasedName => _alias ?? 'pack';
  @override
  String get actualTableName => 'pack';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Pack createAlias(String alias) {
    return Pack(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Card extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Card(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> packCode = GeneratedColumn<String>(
      'pack_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> factionCode = GeneratedColumn<String>(
      'faction_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> typeCode = GeneratedColumn<String>(
      'type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> keywords = GeneratedColumn<String>(
      'keywords', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
      'cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> deckLimit = GeneratedColumn<int>(
      'deck_limit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> factionCost = GeneratedColumn<int>(
      'faction_cost', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> uniqueness = GeneratedColumn<bool>(
      'uniqueness', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> agendaPoints = GeneratedColumn<int>(
      'agenda_points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> memoryCost = GeneratedColumn<int>(
      'memory_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> advancementCost = GeneratedColumn<int>(
      'advancement_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> trashCost = GeneratedColumn<int>(
      'trash_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> baseLink = GeneratedColumn<int>(
      'base_link', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> influenceLimit = GeneratedColumn<int>(
      'influence_limit', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> minimumDeckSize = GeneratedColumn<int>(
      'minimum_deck_size', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> flavor = GeneratedColumn<String>(
      'flavor', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> illustrator = GeneratedColumn<String>(
      'illustrator', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        code,
        packCode,
        factionCode,
        typeCode,
        position,
        title,
        body,
        keywords,
        quantity,
        cost,
        deckLimit,
        factionCost,
        uniqueness,
        strength,
        agendaPoints,
        memoryCost,
        advancementCost,
        trashCost,
        baseLink,
        influenceLimit,
        minimumDeckSize,
        flavor,
        illustrator,
        imageUrl
      ];
  @override
  String get aliasedName => _alias ?? 'card';
  @override
  String get actualTableName => 'card';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Card createAlias(String alias) {
    return Card(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Faction extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Faction(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> sideCode = GeneratedColumn<String>(
      'side_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> isMini = GeneratedColumn<bool>(
      'is_mini', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, sideCode, name, color, isMini];
  @override
  String get aliasedName => _alias ?? 'faction';
  @override
  String get actualTableName => 'faction';
  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Faction createAlias(String alias) {
    return Faction(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class Nrdb extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Nrdb(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<bool> id = GeneratedColumn<bool>(
      'id', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  late final GeneratedColumn<DateTime> expires = GeneratedColumn<DateTime>(
      'expires', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> cycleLastUpdated =
      GeneratedColumn<DateTime>('cycle_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> packLastUpdated =
      GeneratedColumn<DateTime>('pack_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> sideLastUpdated =
      GeneratedColumn<DateTime>('side_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> factionLastUpdated =
      GeneratedColumn<DateTime>('faction_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> typeLastUpdated =
      GeneratedColumn<DateTime>('type_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> cardLastUpdated =
      GeneratedColumn<DateTime>('card_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> formatLastUpdated =
      GeneratedColumn<DateTime>('format_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> rotationLastUpdated =
      GeneratedColumn<DateTime>('rotation_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> mwlLastUpdated =
      GeneratedColumn<DateTime>('mwl_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        expires,
        cycleLastUpdated,
        packLastUpdated,
        sideLastUpdated,
        factionLastUpdated,
        typeLastUpdated,
        cardLastUpdated,
        formatLastUpdated,
        rotationLastUpdated,
        mwlLastUpdated
      ];
  @override
  String get aliasedName => _alias ?? 'nrdb';
  @override
  String get actualTableName => 'nrdb';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Nrdb createAlias(String alias) {
    return Nrdb(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT settings_id CHECK(id = TRUE)'];
  @override
  bool get dontWriteConstraints => true;
}

class MwlCard extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MwlCard(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> mwlCode = GeneratedColumn<String>(
      'mwl_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> cardTitle = GeneratedColumn<String>(
      'card_title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> isRestricted = GeneratedColumn<bool>(
      'is_restricted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> globalPenalty = GeneratedColumn<int>(
      'global_penalty', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> universalFactionCost = GeneratedColumn<int>(
      'universal_faction_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> deckLimit = GeneratedColumn<int>(
      'deck_limit', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        mwlCode,
        cardTitle,
        isRestricted,
        globalPenalty,
        universalFactionCost,
        deckLimit,
        points
      ];
  @override
  String get aliasedName => _alias ?? 'mwl_card';
  @override
  String get actualTableName => 'mwl_card';
  @override
  Set<GeneratedColumn> get $primaryKey => {mwlCode, cardTitle};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MwlCard createAlias(String alias) {
    return MwlCard(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY(mwl_code, card_title)'];
  @override
  bool get dontWriteConstraints => true;
}

class Deck extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Deck(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  late final GeneratedColumn<String> identityCode = GeneratedColumn<String>(
      'identity_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> mwlCode = GeneratedColumn<String>(
      'mwl_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> remoteUpdated =
      GeneratedColumn<DateTime>('remote_updated', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  late final GeneratedColumn<DateTime> synced = GeneratedColumn<DateTime>(
      'synced', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        identityCode,
        formatCode,
        rotationCode,
        mwlCode,
        name,
        description,
        created,
        updated,
        deleted,
        remoteUpdated,
        synced
      ];
  @override
  String get aliasedName => _alias ?? 'deck';
  @override
  String get actualTableName => 'deck';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Deck createAlias(String alias) {
    return Deck(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class DeckTag extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckTag(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [deckId, tag];
  @override
  String get aliasedName => _alias ?? 'deck_tag';
  @override
  String get actualTableName => 'deck_tag';
  @override
  Set<GeneratedColumn> get $primaryKey => {deckId, tag};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  DeckTag createAlias(String alias) {
    return DeckTag(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(deck_id, tag)'];
  @override
  bool get dontWriteConstraints => true;
}

class DeckCard extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckCard(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> cardCode = GeneratedColumn<String>(
      'card_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [deckId, cardCode, quantity];
  @override
  String get aliasedName => _alias ?? 'deck_card';
  @override
  String get actualTableName => 'deck_card';
  @override
  Set<GeneratedColumn> get $primaryKey => {deckId, cardCode};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  DeckCard createAlias(String alias) {
    return DeckCard(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY(deck_id, card_code)'];
  @override
  bool get dontWriteConstraints => true;
}

class Collection extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Collection(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> packCode = GeneratedColumn<String>(
      'pack_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<GeneratedColumn> get $columns => [packCode];
  @override
  String get aliasedName => _alias ?? 'collection';
  @override
  String get actualTableName => 'collection';
  @override
  Set<GeneratedColumn> get $primaryKey => {packCode};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Collection createAlias(String alias) {
    return Collection(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [];
  @override
  bool get dontWriteConstraints => true;
}

class DatabaseAtV8 extends GeneratedDatabase {
  DatabaseAtV8(QueryExecutor e) : super(e);
  DatabaseAtV8.connect(DatabaseConnection c) : super.connect(c);
  late final Type type = Type(this);
  late final Side side = Side(this);
  late final Settings settings = Settings(this);
  late final Format format = Format(this);
  late final Rotation rotation = Rotation(this);
  late final RotationView rotationView = RotationView(this);
  late final Mwl mwl = Mwl(this);
  late final MwlView mwlView = MwlView(this);
  late final RotationCycle rotationCycle = RotationCycle(this);
  late final Cycle cycle = Cycle(this);
  late final Pack pack = Pack(this);
  late final Card card = Card(this);
  late final Faction faction = Faction(this);
  late final Nrdb nrdb = Nrdb(this);
  late final MwlCard mwlCard = MwlCard(this);
  late final Deck deck = Deck(this);
  late final DeckTag deckTag = DeckTag(this);
  late final DeckCard deckCard = DeckCard(this);
  late final Collection collection = Collection(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        type,
        side,
        settings,
        format,
        rotation,
        rotationView,
        mwl,
        mwlView,
        rotationCycle,
        cycle,
        pack,
        card,
        faction,
        nrdb,
        mwlCard,
        deck,
        deckTag,
        deckCard,
        collection
      ];
  @override
  int get schemaVersion => 8;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
