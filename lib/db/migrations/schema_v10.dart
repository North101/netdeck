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
  bool get dontWriteConstraints => true;
}

class TypeCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String?> sideCode;
  final Value<int> position;
  final Value<String> name;
  final Value<bool> isSubtype;
  const TypeCompanion({
    this.code = const Value.absent(),
    this.sideCode = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.isSubtype = const Value.absent(),
  });
  TypeCompanion.insert({
    required String code,
    this.sideCode = const Value.absent(),
    required int position,
    required String name,
    required bool isSubtype,
  })  : code = Value(code),
        position = Value(position),
        name = Value(name),
        isSubtype = Value(isSubtype);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? sideCode,
    Expression<int>? position,
    Expression<String>? name,
    Expression<bool>? isSubtype,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (sideCode != null) 'side_code': sideCode,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (isSubtype != null) 'is_subtype': isSubtype,
    });
  }

  TypeCompanion copyWith(
      {Value<String>? code,
      Value<String?>? sideCode,
      Value<int>? position,
      Value<String>? name,
      Value<bool>? isSubtype}) {
    return TypeCompanion(
      code: code ?? this.code,
      sideCode: sideCode ?? this.sideCode,
      position: position ?? this.position,
      name: name ?? this.name,
      isSubtype: isSubtype ?? this.isSubtype,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (sideCode.present) {
      map['side_code'] = Variable<String>(sideCode.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSubtype.present) {
      map['is_subtype'] = Variable<bool>(isSubtype.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypeCompanion(')
          ..write('code: $code, ')
          ..write('sideCode: $sideCode, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('isSubtype: $isSubtype')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class SideCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> name;
  const SideCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  SideCompanion.insert({
    required String code,
    required String name,
  })  : code = Value(code),
        name = Value(name);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  SideCompanion copyWith({Value<String>? code, Value<String>? name}) {
    return SideCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SideCompanion(')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
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

class SettingsCompanion extends UpdateCompanion<dynamic> {
  final Value<bool> id;
  final Value<String?> filterFormatCode;
  final Value<String?> filterRotationCode;
  final Value<String?> filterMwlCode;
  final Value<bool> filterCollection;
  final Value<String> cardSort;
  final Value<String> cardGroup;
  final Value<String> deckSort;
  final Value<String> deckGroup;
  final Value<String> deckCardSort;
  final Value<String> deckCardGroup;
  final Value<String> compareCardSort;
  final Value<bool> apexResources;
  final Value<String> cardGalleryView;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.filterFormatCode = const Value.absent(),
    this.filterRotationCode = const Value.absent(),
    this.filterMwlCode = const Value.absent(),
    this.filterCollection = const Value.absent(),
    this.cardSort = const Value.absent(),
    this.cardGroup = const Value.absent(),
    this.deckSort = const Value.absent(),
    this.deckGroup = const Value.absent(),
    this.deckCardSort = const Value.absent(),
    this.deckCardGroup = const Value.absent(),
    this.compareCardSort = const Value.absent(),
    this.apexResources = const Value.absent(),
    this.cardGalleryView = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.filterFormatCode = const Value.absent(),
    this.filterRotationCode = const Value.absent(),
    this.filterMwlCode = const Value.absent(),
    this.filterCollection = const Value.absent(),
    this.cardSort = const Value.absent(),
    this.cardGroup = const Value.absent(),
    this.deckSort = const Value.absent(),
    this.deckGroup = const Value.absent(),
    this.deckCardSort = const Value.absent(),
    this.deckCardGroup = const Value.absent(),
    this.compareCardSort = const Value.absent(),
    this.apexResources = const Value.absent(),
    this.cardGalleryView = const Value.absent(),
  });
  static Insertable<dynamic> custom({
    Expression<bool>? id,
    Expression<String>? filterFormatCode,
    Expression<String>? filterRotationCode,
    Expression<String>? filterMwlCode,
    Expression<bool>? filterCollection,
    Expression<String>? cardSort,
    Expression<String>? cardGroup,
    Expression<String>? deckSort,
    Expression<String>? deckGroup,
    Expression<String>? deckCardSort,
    Expression<String>? deckCardGroup,
    Expression<String>? compareCardSort,
    Expression<bool>? apexResources,
    Expression<String>? cardGalleryView,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (filterFormatCode != null) 'filter_format_code': filterFormatCode,
      if (filterRotationCode != null)
        'filter_rotation_code': filterRotationCode,
      if (filterMwlCode != null) 'filter_mwl_code': filterMwlCode,
      if (filterCollection != null) 'filter_collection': filterCollection,
      if (cardSort != null) 'card_sort': cardSort,
      if (cardGroup != null) 'card_group': cardGroup,
      if (deckSort != null) 'deck_sort': deckSort,
      if (deckGroup != null) 'deck_group': deckGroup,
      if (deckCardSort != null) 'deck_card_sort': deckCardSort,
      if (deckCardGroup != null) 'deck_card_group': deckCardGroup,
      if (compareCardSort != null) 'compare_card_sort': compareCardSort,
      if (apexResources != null) 'apex_resources': apexResources,
      if (cardGalleryView != null) 'card_gallery_view': cardGalleryView,
    });
  }

  SettingsCompanion copyWith(
      {Value<bool>? id,
      Value<String?>? filterFormatCode,
      Value<String?>? filterRotationCode,
      Value<String?>? filterMwlCode,
      Value<bool>? filterCollection,
      Value<String>? cardSort,
      Value<String>? cardGroup,
      Value<String>? deckSort,
      Value<String>? deckGroup,
      Value<String>? deckCardSort,
      Value<String>? deckCardGroup,
      Value<String>? compareCardSort,
      Value<bool>? apexResources,
      Value<String>? cardGalleryView}) {
    return SettingsCompanion(
      id: id ?? this.id,
      filterFormatCode: filterFormatCode ?? this.filterFormatCode,
      filterRotationCode: filterRotationCode ?? this.filterRotationCode,
      filterMwlCode: filterMwlCode ?? this.filterMwlCode,
      filterCollection: filterCollection ?? this.filterCollection,
      cardSort: cardSort ?? this.cardSort,
      cardGroup: cardGroup ?? this.cardGroup,
      deckSort: deckSort ?? this.deckSort,
      deckGroup: deckGroup ?? this.deckGroup,
      deckCardSort: deckCardSort ?? this.deckCardSort,
      deckCardGroup: deckCardGroup ?? this.deckCardGroup,
      compareCardSort: compareCardSort ?? this.compareCardSort,
      apexResources: apexResources ?? this.apexResources,
      cardGalleryView: cardGalleryView ?? this.cardGalleryView,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<bool>(id.value);
    }
    if (filterFormatCode.present) {
      map['filter_format_code'] = Variable<String>(filterFormatCode.value);
    }
    if (filterRotationCode.present) {
      map['filter_rotation_code'] = Variable<String>(filterRotationCode.value);
    }
    if (filterMwlCode.present) {
      map['filter_mwl_code'] = Variable<String>(filterMwlCode.value);
    }
    if (filterCollection.present) {
      map['filter_collection'] = Variable<bool>(filterCollection.value);
    }
    if (cardSort.present) {
      map['card_sort'] = Variable<String>(cardSort.value);
    }
    if (cardGroup.present) {
      map['card_group'] = Variable<String>(cardGroup.value);
    }
    if (deckSort.present) {
      map['deck_sort'] = Variable<String>(deckSort.value);
    }
    if (deckGroup.present) {
      map['deck_group'] = Variable<String>(deckGroup.value);
    }
    if (deckCardSort.present) {
      map['deck_card_sort'] = Variable<String>(deckCardSort.value);
    }
    if (deckCardGroup.present) {
      map['deck_card_group'] = Variable<String>(deckCardGroup.value);
    }
    if (compareCardSort.present) {
      map['compare_card_sort'] = Variable<String>(compareCardSort.value);
    }
    if (apexResources.present) {
      map['apex_resources'] = Variable<bool>(apexResources.value);
    }
    if (cardGalleryView.present) {
      map['card_gallery_view'] = Variable<String>(cardGalleryView.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('filterFormatCode: $filterFormatCode, ')
          ..write('filterRotationCode: $filterRotationCode, ')
          ..write('filterMwlCode: $filterMwlCode, ')
          ..write('filterCollection: $filterCollection, ')
          ..write('cardSort: $cardSort, ')
          ..write('cardGroup: $cardGroup, ')
          ..write('deckSort: $deckSort, ')
          ..write('deckGroup: $deckGroup, ')
          ..write('deckCardSort: $deckCardSort, ')
          ..write('deckCardGroup: $deckCardGroup, ')
          ..write('compareCardSort: $compareCardSort, ')
          ..write('apexResources: $apexResources, ')
          ..write('cardGalleryView: $cardGalleryView')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class FormatCompanion extends UpdateCompanion<dynamic> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  const FormatCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  FormatCompanion.insert({
    required int id,
    required String code,
    required String name,
  })  : id = Value(id),
        code = Value(code),
        name = Value(name);
  static Insertable<dynamic> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  FormatCompanion copyWith(
      {Value<int>? id, Value<String>? code, Value<String>? name}) {
    return FormatCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormatCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class RotationCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> formatCode;
  final Value<String> name;
  final Value<DateTime?> dateStart;
  const RotationCompanion({
    this.code = const Value.absent(),
    this.formatCode = const Value.absent(),
    this.name = const Value.absent(),
    this.dateStart = const Value.absent(),
  });
  RotationCompanion.insert({
    required String code,
    required String formatCode,
    required String name,
    this.dateStart = const Value.absent(),
  })  : code = Value(code),
        formatCode = Value(formatCode),
        name = Value(name);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? formatCode,
    Expression<String>? name,
    Expression<DateTime>? dateStart,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (formatCode != null) 'format_code': formatCode,
      if (name != null) 'name': name,
      if (dateStart != null) 'date_start': dateStart,
    });
  }

  RotationCompanion copyWith(
      {Value<String>? code,
      Value<String>? formatCode,
      Value<String>? name,
      Value<DateTime?>? dateStart}) {
    return RotationCompanion(
      code: code ?? this.code,
      formatCode: formatCode ?? this.formatCode,
      name: name ?? this.name,
      dateStart: dateStart ?? this.dateStart,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (formatCode.present) {
      map['format_code'] = Variable<String>(formatCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateStart.present) {
      map['date_start'] = Variable<DateTime>(dateStart.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotationCompanion(')
          ..write('code: $code, ')
          ..write('formatCode: $formatCode, ')
          ..write('name: $name, ')
          ..write('dateStart: $dateStart')
          ..write(')'))
        .toString();
  }
}

class RotationView extends ViewInfo<RotationView, Never>
    implements HasResultSet {
  final String? _alias;
  @override
  final DatabaseAtV10 attachedDatabase;
  RotationView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns =>
      [code, rotationCode, formatCode, name, dateStart, type];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'rotation_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW rotation_view (code,rotation_code,format_code,name,date_start,type) AS SELECT rotation.code, rotation.rotation_code, rotation.format_code, rotation.name, rotation.date_start, CAST(rotation.type AS TEXT) AS type FROM (SELECT format.code || \'@current\' AS code, rotation.code AS rotation_code, format.code AS format_code, format.name || \' Current (\' || COALESCE(rotation.name, \'None\') || \')\' AS name, rotation.date_start, \'current\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM rotation WHERE DATE(date_start) <= DATE(\'NOW\') GROUP BY rotation.format_code) AS rotation ON rotation.format_code = format.code UNION ALL SELECT format.code || \'@latest\' AS code, rotation.code AS rotation_code, format.code AS format_code, format.name || \' Latest (\' || COALESCE(rotation.name, \'None\') || \')\' AS name, rotation.date_start, \'latest\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM rotation GROUP BY rotation.format_code) AS rotation ON rotation.format_code = format.code UNION ALL SELECT rotation.code, rotation.code AS rotation_code, rotation.format_code, rotation.name, rotation.date_start, NULL AS type FROM rotation) AS rotation INNER JOIN format ON format.code = rotation.format_code ORDER BY format.id, rotation.type DESC NULLS LAST, rotation.date_start DESC;';
  @override
  RotationView get asDslTable => this;
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
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
  bool get dontWriteConstraints => true;
}

class MwlCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> formatCode;
  final Value<String> name;
  final Value<DateTime?> dateStart;
  final Value<int?> runnerPoints;
  final Value<int?> corpPoints;
  const MwlCompanion({
    this.code = const Value.absent(),
    this.formatCode = const Value.absent(),
    this.name = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.runnerPoints = const Value.absent(),
    this.corpPoints = const Value.absent(),
  });
  MwlCompanion.insert({
    required String code,
    required String formatCode,
    required String name,
    this.dateStart = const Value.absent(),
    this.runnerPoints = const Value.absent(),
    this.corpPoints = const Value.absent(),
  })  : code = Value(code),
        formatCode = Value(formatCode),
        name = Value(name);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? formatCode,
    Expression<String>? name,
    Expression<DateTime>? dateStart,
    Expression<int>? runnerPoints,
    Expression<int>? corpPoints,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (formatCode != null) 'format_code': formatCode,
      if (name != null) 'name': name,
      if (dateStart != null) 'date_start': dateStart,
      if (runnerPoints != null) 'runner_points': runnerPoints,
      if (corpPoints != null) 'corp_points': corpPoints,
    });
  }

  MwlCompanion copyWith(
      {Value<String>? code,
      Value<String>? formatCode,
      Value<String>? name,
      Value<DateTime?>? dateStart,
      Value<int?>? runnerPoints,
      Value<int?>? corpPoints}) {
    return MwlCompanion(
      code: code ?? this.code,
      formatCode: formatCode ?? this.formatCode,
      name: name ?? this.name,
      dateStart: dateStart ?? this.dateStart,
      runnerPoints: runnerPoints ?? this.runnerPoints,
      corpPoints: corpPoints ?? this.corpPoints,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (formatCode.present) {
      map['format_code'] = Variable<String>(formatCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateStart.present) {
      map['date_start'] = Variable<DateTime>(dateStart.value);
    }
    if (runnerPoints.present) {
      map['runner_points'] = Variable<int>(runnerPoints.value);
    }
    if (corpPoints.present) {
      map['corp_points'] = Variable<int>(corpPoints.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MwlCompanion(')
          ..write('code: $code, ')
          ..write('formatCode: $formatCode, ')
          ..write('name: $name, ')
          ..write('dateStart: $dateStart, ')
          ..write('runnerPoints: $runnerPoints, ')
          ..write('corpPoints: $corpPoints')
          ..write(')'))
        .toString();
  }
}

class MwlView extends ViewInfo<MwlView, Never> implements HasResultSet {
  final String? _alias;
  @override
  final DatabaseAtV10 attachedDatabase;
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
        type
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'mwl_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW mwl_view (code,format_code,mwl_code,name,date_start,runner_points,corp_points,type) AS SELECT mwl.code, mwl.format_code, mwl.mwl_code, mwl.name, mwl.date_start, mwl.runner_points, mwl.corp_points, CAST(mwl.type AS TEXT) AS type FROM (SELECT format.code || \'@active\' AS code, format.code AS format_code, mwl.code AS mwl_code, format.name || \' Active (\' || COALESCE(mwl.name, \'None\') || \')\' AS name, mwl.date_start, mwl.runner_points, mwl.corp_points, \'active\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM mwl WHERE DATE(date_start) <= DATE(\'NOW\') GROUP BY mwl.format_code) AS mwl ON mwl.format_code = format.code UNION ALL SELECT format.code || \'@latest\' AS code, format.code AS format_code, mwl.code AS mwl_code, format.name || \' Latest (\' || COALESCE(mwl.name, \'None\') || \')\' AS name, mwl.date_start, mwl.runner_points, mwl.corp_points, \'latest\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM mwl GROUP BY mwl.format_code) AS mwl ON mwl.format_code = format.code UNION ALL SELECT mwl.code, mwl.format_code, mwl.code, mwl.name, mwl.date_start, mwl.runner_points, mwl.corp_points, NULL AS type FROM mwl) AS mwl INNER JOIN format ON format.code = mwl.format_code ORDER BY format.id, mwl.type DESC NULLS LAST, mwl.date_start DESC;';
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

class RotationCycleCompanion extends UpdateCompanion<dynamic> {
  final Value<String> rotationCode;
  final Value<String> cycleCode;
  const RotationCycleCompanion({
    this.rotationCode = const Value.absent(),
    this.cycleCode = const Value.absent(),
  });
  RotationCycleCompanion.insert({
    required String rotationCode,
    required String cycleCode,
  })  : rotationCode = Value(rotationCode),
        cycleCode = Value(cycleCode);
  static Insertable<dynamic> custom({
    Expression<String>? rotationCode,
    Expression<String>? cycleCode,
  }) {
    return RawValuesInsertable({
      if (rotationCode != null) 'rotation_code': rotationCode,
      if (cycleCode != null) 'cycle_code': cycleCode,
    });
  }

  RotationCycleCompanion copyWith(
      {Value<String>? rotationCode, Value<String>? cycleCode}) {
    return RotationCycleCompanion(
      rotationCode: rotationCode ?? this.rotationCode,
      cycleCode: cycleCode ?? this.cycleCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rotationCode.present) {
      map['rotation_code'] = Variable<String>(rotationCode.value);
    }
    if (cycleCode.present) {
      map['cycle_code'] = Variable<String>(cycleCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotationCycleCompanion(')
          ..write('rotationCode: $rotationCode, ')
          ..write('cycleCode: $cycleCode')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class CycleCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<int> position;
  final Value<String> name;
  final Value<int> size;
  final Value<bool> rotated;
  const CycleCompanion({
    this.code = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
    this.rotated = const Value.absent(),
  });
  CycleCompanion.insert({
    required String code,
    required int position,
    required String name,
    required int size,
    required bool rotated,
  })  : code = Value(code),
        position = Value(position),
        name = Value(name),
        size = Value(size),
        rotated = Value(rotated);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<int>? position,
    Expression<String>? name,
    Expression<int>? size,
    Expression<bool>? rotated,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (size != null) 'size': size,
      if (rotated != null) 'rotated': rotated,
    });
  }

  CycleCompanion copyWith(
      {Value<String>? code,
      Value<int>? position,
      Value<String>? name,
      Value<int>? size,
      Value<bool>? rotated}) {
    return CycleCompanion(
      code: code ?? this.code,
      position: position ?? this.position,
      name: name ?? this.name,
      size: size ?? this.size,
      rotated: rotated ?? this.rotated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (rotated.present) {
      map['rotated'] = Variable<bool>(rotated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CycleCompanion(')
          ..write('code: $code, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('rotated: $rotated')
          ..write(')'))
        .toString();
  }
}

class RotationCycleView extends ViewInfo<RotationCycleView, Never>
    implements HasResultSet {
  final String? _alias;
  @override
  final DatabaseAtV10 attachedDatabase;
  RotationCycleView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [rotationCode, cycleCode];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'rotation_cycle_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW rotation_cycle_view (rotation_code,cycle_code) AS SELECT rotation.code, rotation_cycle.cycle_code FROM rotation_view AS rotation INNER JOIN rotation_cycle ON rotation_cycle.rotation_code = rotation.rotation_code UNION ALL SELECT rotation.code, cycle.code FROM rotation_view AS rotation CROSS JOIN cycle WHERE rotation.rotation_code IS NULL;';
  @override
  RotationCycleView get asDslTable => this;
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> cycleCode = GeneratedColumn<String>(
      'cycle_code', aliasedName, false,
      type: DriftSqlType.string);
  @override
  RotationCycleView createAlias(String alias) {
    return RotationCycleView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {};
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
  bool get dontWriteConstraints => true;
}

class PackCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> cycleCode;
  final Value<int> position;
  final Value<String> name;
  final Value<DateTime?> dateRelease;
  final Value<int?> size;
  const PackCompanion({
    this.code = const Value.absent(),
    this.cycleCode = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.dateRelease = const Value.absent(),
    this.size = const Value.absent(),
  });
  PackCompanion.insert({
    required String code,
    required String cycleCode,
    required int position,
    required String name,
    this.dateRelease = const Value.absent(),
    this.size = const Value.absent(),
  })  : code = Value(code),
        cycleCode = Value(cycleCode),
        position = Value(position),
        name = Value(name);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? cycleCode,
    Expression<int>? position,
    Expression<String>? name,
    Expression<DateTime>? dateRelease,
    Expression<int>? size,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (cycleCode != null) 'cycle_code': cycleCode,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (dateRelease != null) 'date_release': dateRelease,
      if (size != null) 'size': size,
    });
  }

  PackCompanion copyWith(
      {Value<String>? code,
      Value<String>? cycleCode,
      Value<int>? position,
      Value<String>? name,
      Value<DateTime?>? dateRelease,
      Value<int?>? size}) {
    return PackCompanion(
      code: code ?? this.code,
      cycleCode: cycleCode ?? this.cycleCode,
      position: position ?? this.position,
      name: name ?? this.name,
      dateRelease: dateRelease ?? this.dateRelease,
      size: size ?? this.size,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (cycleCode.present) {
      map['cycle_code'] = Variable<String>(cycleCode.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateRelease.present) {
      map['date_release'] = Variable<DateTime>(dateRelease.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackCompanion(')
          ..write('code: $code, ')
          ..write('cycleCode: $cycleCode, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('dateRelease: $dateRelease, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class CardCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> packCode;
  final Value<String> factionCode;
  final Value<String> typeCode;
  final Value<int> position;
  final Value<String> title;
  final Value<String?> body;
  final Value<String?> keywords;
  final Value<int> quantity;
  final Value<int?> cost;
  final Value<int> deckLimit;
  final Value<int> factionCost;
  final Value<bool> uniqueness;
  final Value<int?> strength;
  final Value<int?> agendaPoints;
  final Value<int?> memoryCost;
  final Value<int?> advancementCost;
  final Value<int?> trashCost;
  final Value<int?> baseLink;
  final Value<int?> influenceLimit;
  final Value<int?> minimumDeckSize;
  final Value<String?> flavor;
  final Value<String?> illustrator;
  final Value<String> imageUrl;
  const CardCompanion({
    this.code = const Value.absent(),
    this.packCode = const Value.absent(),
    this.factionCode = const Value.absent(),
    this.typeCode = const Value.absent(),
    this.position = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.keywords = const Value.absent(),
    this.quantity = const Value.absent(),
    this.cost = const Value.absent(),
    this.deckLimit = const Value.absent(),
    this.factionCost = const Value.absent(),
    this.uniqueness = const Value.absent(),
    this.strength = const Value.absent(),
    this.agendaPoints = const Value.absent(),
    this.memoryCost = const Value.absent(),
    this.advancementCost = const Value.absent(),
    this.trashCost = const Value.absent(),
    this.baseLink = const Value.absent(),
    this.influenceLimit = const Value.absent(),
    this.minimumDeckSize = const Value.absent(),
    this.flavor = const Value.absent(),
    this.illustrator = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  CardCompanion.insert({
    required String code,
    required String packCode,
    required String factionCode,
    required String typeCode,
    required int position,
    required String title,
    this.body = const Value.absent(),
    this.keywords = const Value.absent(),
    required int quantity,
    this.cost = const Value.absent(),
    required int deckLimit,
    required int factionCost,
    required bool uniqueness,
    this.strength = const Value.absent(),
    this.agendaPoints = const Value.absent(),
    this.memoryCost = const Value.absent(),
    this.advancementCost = const Value.absent(),
    this.trashCost = const Value.absent(),
    this.baseLink = const Value.absent(),
    this.influenceLimit = const Value.absent(),
    this.minimumDeckSize = const Value.absent(),
    this.flavor = const Value.absent(),
    this.illustrator = const Value.absent(),
    required String imageUrl,
  })  : code = Value(code),
        packCode = Value(packCode),
        factionCode = Value(factionCode),
        typeCode = Value(typeCode),
        position = Value(position),
        title = Value(title),
        quantity = Value(quantity),
        deckLimit = Value(deckLimit),
        factionCost = Value(factionCost),
        uniqueness = Value(uniqueness),
        imageUrl = Value(imageUrl);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? packCode,
    Expression<String>? factionCode,
    Expression<String>? typeCode,
    Expression<int>? position,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? keywords,
    Expression<int>? quantity,
    Expression<int>? cost,
    Expression<int>? deckLimit,
    Expression<int>? factionCost,
    Expression<bool>? uniqueness,
    Expression<int>? strength,
    Expression<int>? agendaPoints,
    Expression<int>? memoryCost,
    Expression<int>? advancementCost,
    Expression<int>? trashCost,
    Expression<int>? baseLink,
    Expression<int>? influenceLimit,
    Expression<int>? minimumDeckSize,
    Expression<String>? flavor,
    Expression<String>? illustrator,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (packCode != null) 'pack_code': packCode,
      if (factionCode != null) 'faction_code': factionCode,
      if (typeCode != null) 'type_code': typeCode,
      if (position != null) 'position': position,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (keywords != null) 'keywords': keywords,
      if (quantity != null) 'quantity': quantity,
      if (cost != null) 'cost': cost,
      if (deckLimit != null) 'deck_limit': deckLimit,
      if (factionCost != null) 'faction_cost': factionCost,
      if (uniqueness != null) 'uniqueness': uniqueness,
      if (strength != null) 'strength': strength,
      if (agendaPoints != null) 'agenda_points': agendaPoints,
      if (memoryCost != null) 'memory_cost': memoryCost,
      if (advancementCost != null) 'advancement_cost': advancementCost,
      if (trashCost != null) 'trash_cost': trashCost,
      if (baseLink != null) 'base_link': baseLink,
      if (influenceLimit != null) 'influence_limit': influenceLimit,
      if (minimumDeckSize != null) 'minimum_deck_size': minimumDeckSize,
      if (flavor != null) 'flavor': flavor,
      if (illustrator != null) 'illustrator': illustrator,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  CardCompanion copyWith(
      {Value<String>? code,
      Value<String>? packCode,
      Value<String>? factionCode,
      Value<String>? typeCode,
      Value<int>? position,
      Value<String>? title,
      Value<String?>? body,
      Value<String?>? keywords,
      Value<int>? quantity,
      Value<int?>? cost,
      Value<int>? deckLimit,
      Value<int>? factionCost,
      Value<bool>? uniqueness,
      Value<int?>? strength,
      Value<int?>? agendaPoints,
      Value<int?>? memoryCost,
      Value<int?>? advancementCost,
      Value<int?>? trashCost,
      Value<int?>? baseLink,
      Value<int?>? influenceLimit,
      Value<int?>? minimumDeckSize,
      Value<String?>? flavor,
      Value<String?>? illustrator,
      Value<String>? imageUrl}) {
    return CardCompanion(
      code: code ?? this.code,
      packCode: packCode ?? this.packCode,
      factionCode: factionCode ?? this.factionCode,
      typeCode: typeCode ?? this.typeCode,
      position: position ?? this.position,
      title: title ?? this.title,
      body: body ?? this.body,
      keywords: keywords ?? this.keywords,
      quantity: quantity ?? this.quantity,
      cost: cost ?? this.cost,
      deckLimit: deckLimit ?? this.deckLimit,
      factionCost: factionCost ?? this.factionCost,
      uniqueness: uniqueness ?? this.uniqueness,
      strength: strength ?? this.strength,
      agendaPoints: agendaPoints ?? this.agendaPoints,
      memoryCost: memoryCost ?? this.memoryCost,
      advancementCost: advancementCost ?? this.advancementCost,
      trashCost: trashCost ?? this.trashCost,
      baseLink: baseLink ?? this.baseLink,
      influenceLimit: influenceLimit ?? this.influenceLimit,
      minimumDeckSize: minimumDeckSize ?? this.minimumDeckSize,
      flavor: flavor ?? this.flavor,
      illustrator: illustrator ?? this.illustrator,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (packCode.present) {
      map['pack_code'] = Variable<String>(packCode.value);
    }
    if (factionCode.present) {
      map['faction_code'] = Variable<String>(factionCode.value);
    }
    if (typeCode.present) {
      map['type_code'] = Variable<String>(typeCode.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    if (deckLimit.present) {
      map['deck_limit'] = Variable<int>(deckLimit.value);
    }
    if (factionCost.present) {
      map['faction_cost'] = Variable<int>(factionCost.value);
    }
    if (uniqueness.present) {
      map['uniqueness'] = Variable<bool>(uniqueness.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (agendaPoints.present) {
      map['agenda_points'] = Variable<int>(agendaPoints.value);
    }
    if (memoryCost.present) {
      map['memory_cost'] = Variable<int>(memoryCost.value);
    }
    if (advancementCost.present) {
      map['advancement_cost'] = Variable<int>(advancementCost.value);
    }
    if (trashCost.present) {
      map['trash_cost'] = Variable<int>(trashCost.value);
    }
    if (baseLink.present) {
      map['base_link'] = Variable<int>(baseLink.value);
    }
    if (influenceLimit.present) {
      map['influence_limit'] = Variable<int>(influenceLimit.value);
    }
    if (minimumDeckSize.present) {
      map['minimum_deck_size'] = Variable<int>(minimumDeckSize.value);
    }
    if (flavor.present) {
      map['flavor'] = Variable<String>(flavor.value);
    }
    if (illustrator.present) {
      map['illustrator'] = Variable<String>(illustrator.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardCompanion(')
          ..write('code: $code, ')
          ..write('packCode: $packCode, ')
          ..write('factionCode: $factionCode, ')
          ..write('typeCode: $typeCode, ')
          ..write('position: $position, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('keywords: $keywords, ')
          ..write('quantity: $quantity, ')
          ..write('cost: $cost, ')
          ..write('deckLimit: $deckLimit, ')
          ..write('factionCost: $factionCost, ')
          ..write('uniqueness: $uniqueness, ')
          ..write('strength: $strength, ')
          ..write('agendaPoints: $agendaPoints, ')
          ..write('memoryCost: $memoryCost, ')
          ..write('advancementCost: $advancementCost, ')
          ..write('trashCost: $trashCost, ')
          ..write('baseLink: $baseLink, ')
          ..write('influenceLimit: $influenceLimit, ')
          ..write('minimumDeckSize: $minimumDeckSize, ')
          ..write('flavor: $flavor, ')
          ..write('illustrator: $illustrator, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class FactionCompanion extends UpdateCompanion<dynamic> {
  final Value<String> code;
  final Value<String> sideCode;
  final Value<String> name;
  final Value<int> color;
  final Value<bool> isMini;
  const FactionCompanion({
    this.code = const Value.absent(),
    this.sideCode = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.isMini = const Value.absent(),
  });
  FactionCompanion.insert({
    required String code,
    required String sideCode,
    required String name,
    required int color,
    required bool isMini,
  })  : code = Value(code),
        sideCode = Value(sideCode),
        name = Value(name),
        color = Value(color),
        isMini = Value(isMini);
  static Insertable<dynamic> custom({
    Expression<String>? code,
    Expression<String>? sideCode,
    Expression<String>? name,
    Expression<int>? color,
    Expression<bool>? isMini,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (sideCode != null) 'side_code': sideCode,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (isMini != null) 'is_mini': isMini,
    });
  }

  FactionCompanion copyWith(
      {Value<String>? code,
      Value<String>? sideCode,
      Value<String>? name,
      Value<int>? color,
      Value<bool>? isMini}) {
    return FactionCompanion(
      code: code ?? this.code,
      sideCode: sideCode ?? this.sideCode,
      name: name ?? this.name,
      color: color ?? this.color,
      isMini: isMini ?? this.isMini,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (sideCode.present) {
      map['side_code'] = Variable<String>(sideCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isMini.present) {
      map['is_mini'] = Variable<bool>(isMini.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionCompanion(')
          ..write('code: $code, ')
          ..write('sideCode: $sideCode, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isMini: $isMini')
          ..write(')'))
        .toString();
  }
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

class NrdbCompanion extends UpdateCompanion<dynamic> {
  final Value<bool> id;
  final Value<DateTime> expires;
  final Value<DateTime> cycleLastUpdated;
  final Value<DateTime> packLastUpdated;
  final Value<DateTime> sideLastUpdated;
  final Value<DateTime> factionLastUpdated;
  final Value<DateTime> typeLastUpdated;
  final Value<DateTime> cardLastUpdated;
  final Value<DateTime> formatLastUpdated;
  final Value<DateTime> rotationLastUpdated;
  final Value<DateTime> mwlLastUpdated;
  const NrdbCompanion({
    this.id = const Value.absent(),
    this.expires = const Value.absent(),
    this.cycleLastUpdated = const Value.absent(),
    this.packLastUpdated = const Value.absent(),
    this.sideLastUpdated = const Value.absent(),
    this.factionLastUpdated = const Value.absent(),
    this.typeLastUpdated = const Value.absent(),
    this.cardLastUpdated = const Value.absent(),
    this.formatLastUpdated = const Value.absent(),
    this.rotationLastUpdated = const Value.absent(),
    this.mwlLastUpdated = const Value.absent(),
  });
  NrdbCompanion.insert({
    this.id = const Value.absent(),
    required DateTime expires,
    required DateTime cycleLastUpdated,
    required DateTime packLastUpdated,
    required DateTime sideLastUpdated,
    required DateTime factionLastUpdated,
    required DateTime typeLastUpdated,
    required DateTime cardLastUpdated,
    required DateTime formatLastUpdated,
    required DateTime rotationLastUpdated,
    required DateTime mwlLastUpdated,
  })  : expires = Value(expires),
        cycleLastUpdated = Value(cycleLastUpdated),
        packLastUpdated = Value(packLastUpdated),
        sideLastUpdated = Value(sideLastUpdated),
        factionLastUpdated = Value(factionLastUpdated),
        typeLastUpdated = Value(typeLastUpdated),
        cardLastUpdated = Value(cardLastUpdated),
        formatLastUpdated = Value(formatLastUpdated),
        rotationLastUpdated = Value(rotationLastUpdated),
        mwlLastUpdated = Value(mwlLastUpdated);
  static Insertable<dynamic> custom({
    Expression<bool>? id,
    Expression<DateTime>? expires,
    Expression<DateTime>? cycleLastUpdated,
    Expression<DateTime>? packLastUpdated,
    Expression<DateTime>? sideLastUpdated,
    Expression<DateTime>? factionLastUpdated,
    Expression<DateTime>? typeLastUpdated,
    Expression<DateTime>? cardLastUpdated,
    Expression<DateTime>? formatLastUpdated,
    Expression<DateTime>? rotationLastUpdated,
    Expression<DateTime>? mwlLastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expires != null) 'expires': expires,
      if (cycleLastUpdated != null) 'cycle_last_updated': cycleLastUpdated,
      if (packLastUpdated != null) 'pack_last_updated': packLastUpdated,
      if (sideLastUpdated != null) 'side_last_updated': sideLastUpdated,
      if (factionLastUpdated != null)
        'faction_last_updated': factionLastUpdated,
      if (typeLastUpdated != null) 'type_last_updated': typeLastUpdated,
      if (cardLastUpdated != null) 'card_last_updated': cardLastUpdated,
      if (formatLastUpdated != null) 'format_last_updated': formatLastUpdated,
      if (rotationLastUpdated != null)
        'rotation_last_updated': rotationLastUpdated,
      if (mwlLastUpdated != null) 'mwl_last_updated': mwlLastUpdated,
    });
  }

  NrdbCompanion copyWith(
      {Value<bool>? id,
      Value<DateTime>? expires,
      Value<DateTime>? cycleLastUpdated,
      Value<DateTime>? packLastUpdated,
      Value<DateTime>? sideLastUpdated,
      Value<DateTime>? factionLastUpdated,
      Value<DateTime>? typeLastUpdated,
      Value<DateTime>? cardLastUpdated,
      Value<DateTime>? formatLastUpdated,
      Value<DateTime>? rotationLastUpdated,
      Value<DateTime>? mwlLastUpdated}) {
    return NrdbCompanion(
      id: id ?? this.id,
      expires: expires ?? this.expires,
      cycleLastUpdated: cycleLastUpdated ?? this.cycleLastUpdated,
      packLastUpdated: packLastUpdated ?? this.packLastUpdated,
      sideLastUpdated: sideLastUpdated ?? this.sideLastUpdated,
      factionLastUpdated: factionLastUpdated ?? this.factionLastUpdated,
      typeLastUpdated: typeLastUpdated ?? this.typeLastUpdated,
      cardLastUpdated: cardLastUpdated ?? this.cardLastUpdated,
      formatLastUpdated: formatLastUpdated ?? this.formatLastUpdated,
      rotationLastUpdated: rotationLastUpdated ?? this.rotationLastUpdated,
      mwlLastUpdated: mwlLastUpdated ?? this.mwlLastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<bool>(id.value);
    }
    if (expires.present) {
      map['expires'] = Variable<DateTime>(expires.value);
    }
    if (cycleLastUpdated.present) {
      map['cycle_last_updated'] = Variable<DateTime>(cycleLastUpdated.value);
    }
    if (packLastUpdated.present) {
      map['pack_last_updated'] = Variable<DateTime>(packLastUpdated.value);
    }
    if (sideLastUpdated.present) {
      map['side_last_updated'] = Variable<DateTime>(sideLastUpdated.value);
    }
    if (factionLastUpdated.present) {
      map['faction_last_updated'] =
          Variable<DateTime>(factionLastUpdated.value);
    }
    if (typeLastUpdated.present) {
      map['type_last_updated'] = Variable<DateTime>(typeLastUpdated.value);
    }
    if (cardLastUpdated.present) {
      map['card_last_updated'] = Variable<DateTime>(cardLastUpdated.value);
    }
    if (formatLastUpdated.present) {
      map['format_last_updated'] = Variable<DateTime>(formatLastUpdated.value);
    }
    if (rotationLastUpdated.present) {
      map['rotation_last_updated'] =
          Variable<DateTime>(rotationLastUpdated.value);
    }
    if (mwlLastUpdated.present) {
      map['mwl_last_updated'] = Variable<DateTime>(mwlLastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NrdbCompanion(')
          ..write('id: $id, ')
          ..write('expires: $expires, ')
          ..write('cycleLastUpdated: $cycleLastUpdated, ')
          ..write('packLastUpdated: $packLastUpdated, ')
          ..write('sideLastUpdated: $sideLastUpdated, ')
          ..write('factionLastUpdated: $factionLastUpdated, ')
          ..write('typeLastUpdated: $typeLastUpdated, ')
          ..write('cardLastUpdated: $cardLastUpdated, ')
          ..write('formatLastUpdated: $formatLastUpdated, ')
          ..write('rotationLastUpdated: $rotationLastUpdated, ')
          ..write('mwlLastUpdated: $mwlLastUpdated')
          ..write(')'))
        .toString();
  }
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

class MwlCardCompanion extends UpdateCompanion<dynamic> {
  final Value<String> mwlCode;
  final Value<String> cardTitle;
  final Value<bool> isRestricted;
  final Value<int?> globalPenalty;
  final Value<int?> universalFactionCost;
  final Value<int?> deckLimit;
  final Value<int?> points;
  const MwlCardCompanion({
    this.mwlCode = const Value.absent(),
    this.cardTitle = const Value.absent(),
    this.isRestricted = const Value.absent(),
    this.globalPenalty = const Value.absent(),
    this.universalFactionCost = const Value.absent(),
    this.deckLimit = const Value.absent(),
    this.points = const Value.absent(),
  });
  MwlCardCompanion.insert({
    required String mwlCode,
    required String cardTitle,
    required bool isRestricted,
    this.globalPenalty = const Value.absent(),
    this.universalFactionCost = const Value.absent(),
    this.deckLimit = const Value.absent(),
    this.points = const Value.absent(),
  })  : mwlCode = Value(mwlCode),
        cardTitle = Value(cardTitle),
        isRestricted = Value(isRestricted);
  static Insertable<dynamic> custom({
    Expression<String>? mwlCode,
    Expression<String>? cardTitle,
    Expression<bool>? isRestricted,
    Expression<int>? globalPenalty,
    Expression<int>? universalFactionCost,
    Expression<int>? deckLimit,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (mwlCode != null) 'mwl_code': mwlCode,
      if (cardTitle != null) 'card_title': cardTitle,
      if (isRestricted != null) 'is_restricted': isRestricted,
      if (globalPenalty != null) 'global_penalty': globalPenalty,
      if (universalFactionCost != null)
        'universal_faction_cost': universalFactionCost,
      if (deckLimit != null) 'deck_limit': deckLimit,
      if (points != null) 'points': points,
    });
  }

  MwlCardCompanion copyWith(
      {Value<String>? mwlCode,
      Value<String>? cardTitle,
      Value<bool>? isRestricted,
      Value<int?>? globalPenalty,
      Value<int?>? universalFactionCost,
      Value<int?>? deckLimit,
      Value<int?>? points}) {
    return MwlCardCompanion(
      mwlCode: mwlCode ?? this.mwlCode,
      cardTitle: cardTitle ?? this.cardTitle,
      isRestricted: isRestricted ?? this.isRestricted,
      globalPenalty: globalPenalty ?? this.globalPenalty,
      universalFactionCost: universalFactionCost ?? this.universalFactionCost,
      deckLimit: deckLimit ?? this.deckLimit,
      points: points ?? this.points,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mwlCode.present) {
      map['mwl_code'] = Variable<String>(mwlCode.value);
    }
    if (cardTitle.present) {
      map['card_title'] = Variable<String>(cardTitle.value);
    }
    if (isRestricted.present) {
      map['is_restricted'] = Variable<bool>(isRestricted.value);
    }
    if (globalPenalty.present) {
      map['global_penalty'] = Variable<int>(globalPenalty.value);
    }
    if (universalFactionCost.present) {
      map['universal_faction_cost'] = Variable<int>(universalFactionCost.value);
    }
    if (deckLimit.present) {
      map['deck_limit'] = Variable<int>(deckLimit.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MwlCardCompanion(')
          ..write('mwlCode: $mwlCode, ')
          ..write('cardTitle: $cardTitle, ')
          ..write('isRestricted: $isRestricted, ')
          ..write('globalPenalty: $globalPenalty, ')
          ..write('universalFactionCost: $universalFactionCost, ')
          ..write('deckLimit: $deckLimit, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class DeckCompanion extends UpdateCompanion<dynamic> {
  final Value<String> id;
  final Value<String> identityCode;
  final Value<String?> formatCode;
  final Value<String?> rotationCode;
  final Value<String?> mwlCode;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> created;
  final Value<DateTime> updated;
  final Value<bool> deleted;
  final Value<DateTime?> remoteUpdated;
  final Value<DateTime?> synced;
  const DeckCompanion({
    this.id = const Value.absent(),
    this.identityCode = const Value.absent(),
    this.formatCode = const Value.absent(),
    this.rotationCode = const Value.absent(),
    this.mwlCode = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.remoteUpdated = const Value.absent(),
    this.synced = const Value.absent(),
  });
  DeckCompanion.insert({
    required String id,
    required String identityCode,
    this.formatCode = const Value.absent(),
    this.rotationCode = const Value.absent(),
    this.mwlCode = const Value.absent(),
    required String name,
    required String description,
    required DateTime created,
    required DateTime updated,
    required bool deleted,
    this.remoteUpdated = const Value.absent(),
    this.synced = const Value.absent(),
  })  : id = Value(id),
        identityCode = Value(identityCode),
        name = Value(name),
        description = Value(description),
        created = Value(created),
        updated = Value(updated),
        deleted = Value(deleted);
  static Insertable<dynamic> custom({
    Expression<String>? id,
    Expression<String>? identityCode,
    Expression<String>? formatCode,
    Expression<String>? rotationCode,
    Expression<String>? mwlCode,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<DateTime>? remoteUpdated,
    Expression<DateTime>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (identityCode != null) 'identity_code': identityCode,
      if (formatCode != null) 'format_code': formatCode,
      if (rotationCode != null) 'rotation_code': rotationCode,
      if (mwlCode != null) 'mwl_code': mwlCode,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (remoteUpdated != null) 'remote_updated': remoteUpdated,
      if (synced != null) 'synced': synced,
    });
  }

  DeckCompanion copyWith(
      {Value<String>? id,
      Value<String>? identityCode,
      Value<String?>? formatCode,
      Value<String?>? rotationCode,
      Value<String?>? mwlCode,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<DateTime?>? remoteUpdated,
      Value<DateTime?>? synced}) {
    return DeckCompanion(
      id: id ?? this.id,
      identityCode: identityCode ?? this.identityCode,
      formatCode: formatCode ?? this.formatCode,
      rotationCode: rotationCode ?? this.rotationCode,
      mwlCode: mwlCode ?? this.mwlCode,
      name: name ?? this.name,
      description: description ?? this.description,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      remoteUpdated: remoteUpdated ?? this.remoteUpdated,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (identityCode.present) {
      map['identity_code'] = Variable<String>(identityCode.value);
    }
    if (formatCode.present) {
      map['format_code'] = Variable<String>(formatCode.value);
    }
    if (rotationCode.present) {
      map['rotation_code'] = Variable<String>(rotationCode.value);
    }
    if (mwlCode.present) {
      map['mwl_code'] = Variable<String>(mwlCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (remoteUpdated.present) {
      map['remote_updated'] = Variable<DateTime>(remoteUpdated.value);
    }
    if (synced.present) {
      map['synced'] = Variable<DateTime>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeckCompanion(')
          ..write('id: $id, ')
          ..write('identityCode: $identityCode, ')
          ..write('formatCode: $formatCode, ')
          ..write('rotationCode: $rotationCode, ')
          ..write('mwlCode: $mwlCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('remoteUpdated: $remoteUpdated, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
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

class DeckTagCompanion extends UpdateCompanion<dynamic> {
  final Value<String> deckId;
  final Value<String> tag;
  const DeckTagCompanion({
    this.deckId = const Value.absent(),
    this.tag = const Value.absent(),
  });
  DeckTagCompanion.insert({
    required String deckId,
    required String tag,
  })  : deckId = Value(deckId),
        tag = Value(tag);
  static Insertable<dynamic> custom({
    Expression<String>? deckId,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (deckId != null) 'deck_id': deckId,
      if (tag != null) 'tag': tag,
    });
  }

  DeckTagCompanion copyWith({Value<String>? deckId, Value<String>? tag}) {
    return DeckTagCompanion(
      deckId: deckId ?? this.deckId,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (deckId.present) {
      map['deck_id'] = Variable<String>(deckId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeckTagCompanion(')
          ..write('deckId: $deckId, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
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

class DeckCardCompanion extends UpdateCompanion<dynamic> {
  final Value<String> deckId;
  final Value<String> cardCode;
  final Value<int> quantity;
  const DeckCardCompanion({
    this.deckId = const Value.absent(),
    this.cardCode = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  DeckCardCompanion.insert({
    required String deckId,
    required String cardCode,
    required int quantity,
  })  : deckId = Value(deckId),
        cardCode = Value(cardCode),
        quantity = Value(quantity);
  static Insertable<dynamic> custom({
    Expression<String>? deckId,
    Expression<String>? cardCode,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (deckId != null) 'deck_id': deckId,
      if (cardCode != null) 'card_code': cardCode,
      if (quantity != null) 'quantity': quantity,
    });
  }

  DeckCardCompanion copyWith(
      {Value<String>? deckId, Value<String>? cardCode, Value<int>? quantity}) {
    return DeckCardCompanion(
      deckId: deckId ?? this.deckId,
      cardCode: cardCode ?? this.cardCode,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (deckId.present) {
      map['deck_id'] = Variable<String>(deckId.value);
    }
    if (cardCode.present) {
      map['card_code'] = Variable<String>(cardCode.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeckCardCompanion(')
          ..write('deckId: $deckId, ')
          ..write('cardCode: $cardCode, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
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
  bool get dontWriteConstraints => true;
}

class CollectionCompanion extends UpdateCompanion<dynamic> {
  final Value<String> packCode;
  const CollectionCompanion({
    this.packCode = const Value.absent(),
  });
  CollectionCompanion.insert({
    required String packCode,
  }) : packCode = Value(packCode);
  static Insertable<dynamic> custom({
    Expression<String>? packCode,
  }) {
    return RawValuesInsertable({
      if (packCode != null) 'pack_code': packCode,
    });
  }

  CollectionCompanion copyWith({Value<String>? packCode}) {
    return CollectionCompanion(
      packCode: packCode ?? this.packCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (packCode.present) {
      map['pack_code'] = Variable<String>(packCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionCompanion(')
          ..write('packCode: $packCode')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV10 extends GeneratedDatabase {
  DatabaseAtV10(QueryExecutor e) : super(e);
  DatabaseAtV10.connect(DatabaseConnection c) : super.connect(c);
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
  late final RotationCycleView rotationCycleView = RotationCycleView(this);
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
        rotationCycleView,
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
  int get schemaVersion => 10;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
