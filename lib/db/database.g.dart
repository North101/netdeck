// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TypeData extends DataClass implements Insertable<TypeData> {
  final String code;
  final String? sideCode;
  final int position;
  final String name;
  final bool isSubtype;
  TypeData(
      {required this.code,
      this.sideCode,
      required this.position,
      required this.name,
      required this.isSubtype});
  factory TypeData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TypeData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      sideCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}side_code']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isSubtype: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_subtype'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || sideCode != null) {
      map['side_code'] = Variable<String?>(sideCode);
    }
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    map['is_subtype'] = Variable<bool>(isSubtype);
    return map;
  }

  TypeCompanion toCompanion(bool nullToAbsent) {
    return TypeCompanion(
      code: Value(code),
      sideCode: sideCode == null && nullToAbsent
          ? const Value.absent()
          : Value(sideCode),
      position: Value(position),
      name: Value(name),
      isSubtype: Value(isSubtype),
    );
  }

  factory TypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TypeData(
      code: serializer.fromJson<String>(json['code']),
      sideCode: serializer.fromJson<String?>(json['side_code']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      isSubtype: serializer.fromJson<bool>(json['is_subtype']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'side_code': serializer.toJson<String?>(sideCode),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'is_subtype': serializer.toJson<bool>(isSubtype),
    };
  }

  TypeData copyWith(
          {String? code,
          Value<String?> sideCode = const Value.absent(),
          int? position,
          String? name,
          bool? isSubtype}) =>
      TypeData(
        code: code ?? this.code,
        sideCode: sideCode.present ? sideCode.value : this.sideCode,
        position: position ?? this.position,
        name: name ?? this.name,
        isSubtype: isSubtype ?? this.isSubtype,
      );
  @override
  String toString() {
    return (StringBuffer('TypeData(')
          ..write('code: $code, ')
          ..write('sideCode: $sideCode, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('isSubtype: $isSubtype')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, sideCode, position, name, isSubtype);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TypeData &&
          other.code == this.code &&
          other.sideCode == this.sideCode &&
          other.position == this.position &&
          other.name == this.name &&
          other.isSubtype == this.isSubtype);
}

class TypeCompanion extends UpdateCompanion<TypeData> {
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
  static Insertable<TypeData> custom({
    Expression<String>? code,
    Expression<String?>? sideCode,
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
      map['side_code'] = Variable<String?>(sideCode.value);
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

class Type extends Table with TableInfo<Type, TypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Type(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _sideCodeMeta = const VerificationMeta('sideCode');
  late final GeneratedColumn<String?> sideCode = GeneratedColumn<String?>(
      'side_code', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _isSubtypeMeta = const VerificationMeta('isSubtype');
  late final GeneratedColumn<bool?> isSubtype = GeneratedColumn<bool?>(
      'is_subtype', aliasedName, false,
      type: const BoolType(),
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
  VerificationContext validateIntegrity(Insertable<TypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('side_code')) {
      context.handle(_sideCodeMeta,
          sideCode.isAcceptableOrUnknown(data['side_code']!, _sideCodeMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_subtype')) {
      context.handle(_isSubtypeMeta,
          isSubtype.isAcceptableOrUnknown(data['is_subtype']!, _isSubtypeMeta));
    } else if (isInserting) {
      context.missing(_isSubtypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  TypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TypeData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Type createAlias(String alias) {
    return Type(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SideData extends DataClass implements Insertable<SideData> {
  final String code;
  final String name;
  SideData({required this.code, required this.name});
  factory SideData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SideData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  SideCompanion toCompanion(bool nullToAbsent) {
    return SideCompanion(
      code: Value(code),
      name: Value(name),
    );
  }

  factory SideData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SideData(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  SideData copyWith({String? code, String? name}) => SideData(
        code: code ?? this.code,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('SideData(')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SideData && other.code == this.code && other.name == this.name);
}

class SideCompanion extends UpdateCompanion<SideData> {
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
  static Insertable<SideData> custom({
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

class Side extends Table with TableInfo<Side, SideData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Side(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, name];
  @override
  String get aliasedName => _alias ?? 'side';
  @override
  String get actualTableName => 'side';
  @override
  VerificationContext validateIntegrity(Insertable<SideData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  SideData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SideData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Side createAlias(String alias) {
    return Side(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SettingsData extends DataClass implements Insertable<SettingsData> {
  final bool id;
  final String? filterFormatCode;
  final String? filterRotationCode;
  final String? filterMwlCode;
  final bool filterCollection;
  final CardSort? cardSort;
  final CardGroup? cardGroup;
  final DeckSort? deckSort;
  final DeckGroup? deckGroup;
  final CardSort? deckCardSort;
  final CardGroup? deckCardGroup;
  final bool apexResources;
  SettingsData(
      {required this.id,
      this.filterFormatCode,
      this.filterRotationCode,
      this.filterMwlCode,
      required this.filterCollection,
      this.cardSort,
      this.cardGroup,
      this.deckSort,
      this.deckGroup,
      this.deckCardSort,
      this.deckCardGroup,
      required this.apexResources});
  factory SettingsData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SettingsData(
      id: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      filterFormatCode: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}filter_format_code']),
      filterRotationCode: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}filter_rotation_code']),
      filterMwlCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}filter_mwl_code']),
      filterCollection: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}filter_collection'])!,
      cardSort: Settings.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_sort'])),
      cardGroup: Settings.$converter1.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_group'])),
      deckSort: Settings.$converter2.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_sort'])),
      deckGroup: Settings.$converter3.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_group'])),
      deckCardSort: Settings.$converter4.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_card_sort'])),
      deckCardGroup: Settings.$converter5.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_card_group'])),
      apexResources: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}apex_resources'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<bool>(id);
    if (!nullToAbsent || filterFormatCode != null) {
      map['filter_format_code'] = Variable<String?>(filterFormatCode);
    }
    if (!nullToAbsent || filterRotationCode != null) {
      map['filter_rotation_code'] = Variable<String?>(filterRotationCode);
    }
    if (!nullToAbsent || filterMwlCode != null) {
      map['filter_mwl_code'] = Variable<String?>(filterMwlCode);
    }
    map['filter_collection'] = Variable<bool>(filterCollection);
    if (!nullToAbsent || cardSort != null) {
      final converter = Settings.$converter0;
      map['card_sort'] = Variable<String?>(converter.mapToSql(cardSort));
    }
    if (!nullToAbsent || cardGroup != null) {
      final converter = Settings.$converter1;
      map['card_group'] = Variable<String?>(converter.mapToSql(cardGroup));
    }
    if (!nullToAbsent || deckSort != null) {
      final converter = Settings.$converter2;
      map['deck_sort'] = Variable<String?>(converter.mapToSql(deckSort));
    }
    if (!nullToAbsent || deckGroup != null) {
      final converter = Settings.$converter3;
      map['deck_group'] = Variable<String?>(converter.mapToSql(deckGroup));
    }
    if (!nullToAbsent || deckCardSort != null) {
      final converter = Settings.$converter4;
      map['deck_card_sort'] =
          Variable<String?>(converter.mapToSql(deckCardSort));
    }
    if (!nullToAbsent || deckCardGroup != null) {
      final converter = Settings.$converter5;
      map['deck_card_group'] =
          Variable<String?>(converter.mapToSql(deckCardGroup));
    }
    map['apex_resources'] = Variable<bool>(apexResources);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      filterFormatCode: filterFormatCode == null && nullToAbsent
          ? const Value.absent()
          : Value(filterFormatCode),
      filterRotationCode: filterRotationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(filterRotationCode),
      filterMwlCode: filterMwlCode == null && nullToAbsent
          ? const Value.absent()
          : Value(filterMwlCode),
      filterCollection: Value(filterCollection),
      cardSort: cardSort == null && nullToAbsent
          ? const Value.absent()
          : Value(cardSort),
      cardGroup: cardGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(cardGroup),
      deckSort: deckSort == null && nullToAbsent
          ? const Value.absent()
          : Value(deckSort),
      deckGroup: deckGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(deckGroup),
      deckCardSort: deckCardSort == null && nullToAbsent
          ? const Value.absent()
          : Value(deckCardSort),
      deckCardGroup: deckCardGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(deckCardGroup),
      apexResources: Value(apexResources),
    );
  }

  factory SettingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsData(
      id: serializer.fromJson<bool>(json['id']),
      filterFormatCode:
          serializer.fromJson<String?>(json['filter_format_code']),
      filterRotationCode:
          serializer.fromJson<String?>(json['filter_rotation_code']),
      filterMwlCode: serializer.fromJson<String?>(json['filter_mwl_code']),
      filterCollection: serializer.fromJson<bool>(json['filter_collection']),
      cardSort: serializer.fromJson<CardSort?>(json['card_sort']),
      cardGroup: serializer.fromJson<CardGroup?>(json['card_group']),
      deckSort: serializer.fromJson<DeckSort?>(json['deck_sort']),
      deckGroup: serializer.fromJson<DeckGroup?>(json['deck_group']),
      deckCardSort: serializer.fromJson<CardSort?>(json['deck_card_sort']),
      deckCardGroup: serializer.fromJson<CardGroup?>(json['deck_card_group']),
      apexResources: serializer.fromJson<bool>(json['apex_resources']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<bool>(id),
      'filter_format_code': serializer.toJson<String?>(filterFormatCode),
      'filter_rotation_code': serializer.toJson<String?>(filterRotationCode),
      'filter_mwl_code': serializer.toJson<String?>(filterMwlCode),
      'filter_collection': serializer.toJson<bool>(filterCollection),
      'card_sort': serializer.toJson<CardSort?>(cardSort),
      'card_group': serializer.toJson<CardGroup?>(cardGroup),
      'deck_sort': serializer.toJson<DeckSort?>(deckSort),
      'deck_group': serializer.toJson<DeckGroup?>(deckGroup),
      'deck_card_sort': serializer.toJson<CardSort?>(deckCardSort),
      'deck_card_group': serializer.toJson<CardGroup?>(deckCardGroup),
      'apex_resources': serializer.toJson<bool>(apexResources),
    };
  }

  SettingsData copyWith(
          {bool? id,
          Value<String?> filterFormatCode = const Value.absent(),
          Value<String?> filterRotationCode = const Value.absent(),
          Value<String?> filterMwlCode = const Value.absent(),
          bool? filterCollection,
          Value<CardSort?> cardSort = const Value.absent(),
          Value<CardGroup?> cardGroup = const Value.absent(),
          Value<DeckSort?> deckSort = const Value.absent(),
          Value<DeckGroup?> deckGroup = const Value.absent(),
          Value<CardSort?> deckCardSort = const Value.absent(),
          Value<CardGroup?> deckCardGroup = const Value.absent(),
          bool? apexResources}) =>
      SettingsData(
        id: id ?? this.id,
        filterFormatCode: filterFormatCode.present
            ? filterFormatCode.value
            : this.filterFormatCode,
        filterRotationCode: filterRotationCode.present
            ? filterRotationCode.value
            : this.filterRotationCode,
        filterMwlCode:
            filterMwlCode.present ? filterMwlCode.value : this.filterMwlCode,
        filterCollection: filterCollection ?? this.filterCollection,
        cardSort: cardSort.present ? cardSort.value : this.cardSort,
        cardGroup: cardGroup.present ? cardGroup.value : this.cardGroup,
        deckSort: deckSort.present ? deckSort.value : this.deckSort,
        deckGroup: deckGroup.present ? deckGroup.value : this.deckGroup,
        deckCardSort:
            deckCardSort.present ? deckCardSort.value : this.deckCardSort,
        deckCardGroup:
            deckCardGroup.present ? deckCardGroup.value : this.deckCardGroup,
        apexResources: apexResources ?? this.apexResources,
      );
  @override
  String toString() {
    return (StringBuffer('SettingsData(')
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
          ..write('apexResources: $apexResources')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      apexResources);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsData &&
          other.id == this.id &&
          other.filterFormatCode == this.filterFormatCode &&
          other.filterRotationCode == this.filterRotationCode &&
          other.filterMwlCode == this.filterMwlCode &&
          other.filterCollection == this.filterCollection &&
          other.cardSort == this.cardSort &&
          other.cardGroup == this.cardGroup &&
          other.deckSort == this.deckSort &&
          other.deckGroup == this.deckGroup &&
          other.deckCardSort == this.deckCardSort &&
          other.deckCardGroup == this.deckCardGroup &&
          other.apexResources == this.apexResources);
}

class SettingsCompanion extends UpdateCompanion<SettingsData> {
  final Value<bool> id;
  final Value<String?> filterFormatCode;
  final Value<String?> filterRotationCode;
  final Value<String?> filterMwlCode;
  final Value<bool> filterCollection;
  final Value<CardSort?> cardSort;
  final Value<CardGroup?> cardGroup;
  final Value<DeckSort?> deckSort;
  final Value<DeckGroup?> deckGroup;
  final Value<CardSort?> deckCardSort;
  final Value<CardGroup?> deckCardGroup;
  final Value<bool> apexResources;
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
    this.apexResources = const Value.absent(),
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
    this.apexResources = const Value.absent(),
  });
  static Insertable<SettingsData> custom({
    Expression<bool>? id,
    Expression<String?>? filterFormatCode,
    Expression<String?>? filterRotationCode,
    Expression<String?>? filterMwlCode,
    Expression<bool>? filterCollection,
    Expression<CardSort?>? cardSort,
    Expression<CardGroup?>? cardGroup,
    Expression<DeckSort?>? deckSort,
    Expression<DeckGroup?>? deckGroup,
    Expression<CardSort?>? deckCardSort,
    Expression<CardGroup?>? deckCardGroup,
    Expression<bool>? apexResources,
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
      if (apexResources != null) 'apex_resources': apexResources,
    });
  }

  SettingsCompanion copyWith(
      {Value<bool>? id,
      Value<String?>? filterFormatCode,
      Value<String?>? filterRotationCode,
      Value<String?>? filterMwlCode,
      Value<bool>? filterCollection,
      Value<CardSort?>? cardSort,
      Value<CardGroup?>? cardGroup,
      Value<DeckSort?>? deckSort,
      Value<DeckGroup?>? deckGroup,
      Value<CardSort?>? deckCardSort,
      Value<CardGroup?>? deckCardGroup,
      Value<bool>? apexResources}) {
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
      apexResources: apexResources ?? this.apexResources,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<bool>(id.value);
    }
    if (filterFormatCode.present) {
      map['filter_format_code'] = Variable<String?>(filterFormatCode.value);
    }
    if (filterRotationCode.present) {
      map['filter_rotation_code'] = Variable<String?>(filterRotationCode.value);
    }
    if (filterMwlCode.present) {
      map['filter_mwl_code'] = Variable<String?>(filterMwlCode.value);
    }
    if (filterCollection.present) {
      map['filter_collection'] = Variable<bool>(filterCollection.value);
    }
    if (cardSort.present) {
      final converter = Settings.$converter0;
      map['card_sort'] = Variable<String?>(converter.mapToSql(cardSort.value));
    }
    if (cardGroup.present) {
      final converter = Settings.$converter1;
      map['card_group'] =
          Variable<String?>(converter.mapToSql(cardGroup.value));
    }
    if (deckSort.present) {
      final converter = Settings.$converter2;
      map['deck_sort'] = Variable<String?>(converter.mapToSql(deckSort.value));
    }
    if (deckGroup.present) {
      final converter = Settings.$converter3;
      map['deck_group'] =
          Variable<String?>(converter.mapToSql(deckGroup.value));
    }
    if (deckCardSort.present) {
      final converter = Settings.$converter4;
      map['deck_card_sort'] =
          Variable<String?>(converter.mapToSql(deckCardSort.value));
    }
    if (deckCardGroup.present) {
      final converter = Settings.$converter5;
      map['deck_card_group'] =
          Variable<String?>(converter.mapToSql(deckCardGroup.value));
    }
    if (apexResources.present) {
      map['apex_resources'] = Variable<bool>(apexResources.value);
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
          ..write('apexResources: $apexResources')
          ..write(')'))
        .toString();
  }
}

class Settings extends Table with TableInfo<Settings, SettingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<bool?> id = GeneratedColumn<bool?>(
      'id', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression<bool>('TRUE'));
  final VerificationMeta _filterFormatCodeMeta =
      const VerificationMeta('filterFormatCode');
  late final GeneratedColumn<String?> filterFormatCode =
      GeneratedColumn<String?>('filter_format_code', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT NULL',
          defaultValue: const CustomExpression<String>('NULL'));
  final VerificationMeta _filterRotationCodeMeta =
      const VerificationMeta('filterRotationCode');
  late final GeneratedColumn<String?> filterRotationCode =
      GeneratedColumn<String?>('filter_rotation_code', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT NULL',
          defaultValue: const CustomExpression<String>('NULL'));
  final VerificationMeta _filterMwlCodeMeta =
      const VerificationMeta('filterMwlCode');
  late final GeneratedColumn<String?> filterMwlCode = GeneratedColumn<String?>(
      'filter_mwl_code', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT NULL',
      defaultValue: const CustomExpression<String>('NULL'));
  final VerificationMeta _filterCollectionMeta =
      const VerificationMeta('filterCollection');
  late final GeneratedColumn<bool?> filterCollection = GeneratedColumn<bool?>(
      'filter_collection', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression<bool>('FALSE'));
  final VerificationMeta _cardSortMeta = const VerificationMeta('cardSort');
  late final GeneratedColumnWithTypeConverter<CardSort, String?> cardSort =
      GeneratedColumn<String?>('card_sort', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<CardSort>(Settings.$converter0);
  final VerificationMeta _cardGroupMeta = const VerificationMeta('cardGroup');
  late final GeneratedColumnWithTypeConverter<CardGroup, String?> cardGroup =
      GeneratedColumn<String?>('card_group', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<CardGroup>(Settings.$converter1);
  final VerificationMeta _deckSortMeta = const VerificationMeta('deckSort');
  late final GeneratedColumnWithTypeConverter<DeckSort, String?> deckSort =
      GeneratedColumn<String?>('deck_sort', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<DeckSort>(Settings.$converter2);
  final VerificationMeta _deckGroupMeta = const VerificationMeta('deckGroup');
  late final GeneratedColumnWithTypeConverter<DeckGroup, String?> deckGroup =
      GeneratedColumn<String?>('deck_group', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<DeckGroup>(Settings.$converter3);
  final VerificationMeta _deckCardSortMeta =
      const VerificationMeta('deckCardSort');
  late final GeneratedColumnWithTypeConverter<CardSort, String?> deckCardSort =
      GeneratedColumn<String?>('deck_card_sort', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<CardSort>(Settings.$converter4);
  final VerificationMeta _deckCardGroupMeta =
      const VerificationMeta('deckCardGroup');
  late final GeneratedColumnWithTypeConverter<CardGroup, String?>
      deckCardGroup = GeneratedColumn<String?>(
              'deck_card_group', aliasedName, true,
              type: const StringType(),
              requiredDuringInsert: false,
              $customConstraints: 'DEFAULT NULL',
              defaultValue: const CustomExpression<String>('NULL'))
          .withConverter<CardGroup>(Settings.$converter5);
  final VerificationMeta _apexResourcesMeta =
      const VerificationMeta('apexResources');
  late final GeneratedColumn<bool?> apexResources = GeneratedColumn<bool?>(
      'apex_resources', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression<bool>('FALSE'));
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
        apexResources
      ];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('filter_format_code')) {
      context.handle(
          _filterFormatCodeMeta,
          filterFormatCode.isAcceptableOrUnknown(
              data['filter_format_code']!, _filterFormatCodeMeta));
    }
    if (data.containsKey('filter_rotation_code')) {
      context.handle(
          _filterRotationCodeMeta,
          filterRotationCode.isAcceptableOrUnknown(
              data['filter_rotation_code']!, _filterRotationCodeMeta));
    }
    if (data.containsKey('filter_mwl_code')) {
      context.handle(
          _filterMwlCodeMeta,
          filterMwlCode.isAcceptableOrUnknown(
              data['filter_mwl_code']!, _filterMwlCodeMeta));
    }
    if (data.containsKey('filter_collection')) {
      context.handle(
          _filterCollectionMeta,
          filterCollection.isAcceptableOrUnknown(
              data['filter_collection']!, _filterCollectionMeta));
    }
    context.handle(_cardSortMeta, const VerificationResult.success());
    context.handle(_cardGroupMeta, const VerificationResult.success());
    context.handle(_deckSortMeta, const VerificationResult.success());
    context.handle(_deckGroupMeta, const VerificationResult.success());
    context.handle(_deckCardSortMeta, const VerificationResult.success());
    context.handle(_deckCardGroupMeta, const VerificationResult.success());
    if (data.containsKey('apex_resources')) {
      context.handle(
          _apexResourcesMeta,
          apexResources.isAcceptableOrUnknown(
              data['apex_resources']!, _apexResourcesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SettingsData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }

  static TypeConverter<CardSort, String> $converter0 =
      const CardSortConverter(CardSort.set);
  static TypeConverter<CardGroup, String> $converter1 =
      const CardGroupConverter(CardGroup.type);
  static TypeConverter<DeckSort, String> $converter2 =
      const DeckSortConverter(DeckSort.updated);
  static TypeConverter<DeckGroup, String> $converter3 =
      const DeckGroupConverter(DeckGroup.side);
  static TypeConverter<CardSort, String> $converter4 =
      const CardSortConverter(CardSort.set);
  static TypeConverter<CardGroup, String> $converter5 =
      const CardGroupConverter(CardGroup.type);
  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT settings_id CHECK (id = TRUE)'];
  @override
  bool get dontWriteConstraints => true;
}

class RotationData extends DataClass implements Insertable<RotationData> {
  final String code;
  final String formatCode;
  final String name;
  final DateTime dateStart;
  final bool current;
  final bool latest;
  RotationData(
      {required this.code,
      required this.formatCode,
      required this.name,
      required this.dateStart,
      required this.current,
      required this.latest});
  factory RotationData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RotationData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      formatCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}format_code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      dateStart: Rotation.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_start']))!,
      current: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current'])!,
      latest: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latest'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['format_code'] = Variable<String>(formatCode);
    map['name'] = Variable<String>(name);
    {
      final converter = Rotation.$converter0;
      map['date_start'] = Variable<int>(converter.mapToSql(dateStart)!);
    }
    map['current'] = Variable<bool>(current);
    map['latest'] = Variable<bool>(latest);
    return map;
  }

  RotationCompanion toCompanion(bool nullToAbsent) {
    return RotationCompanion(
      code: Value(code),
      formatCode: Value(formatCode),
      name: Value(name),
      dateStart: Value(dateStart),
      current: Value(current),
      latest: Value(latest),
    );
  }

  factory RotationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RotationData(
      code: serializer.fromJson<String>(json['code']),
      formatCode: serializer.fromJson<String>(json['format_code']),
      name: serializer.fromJson<String>(json['name']),
      dateStart: serializer.fromJson<DateTime>(json['date_start']),
      current: serializer.fromJson<bool>(json['current']),
      latest: serializer.fromJson<bool>(json['latest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'format_code': serializer.toJson<String>(formatCode),
      'name': serializer.toJson<String>(name),
      'date_start': serializer.toJson<DateTime>(dateStart),
      'current': serializer.toJson<bool>(current),
      'latest': serializer.toJson<bool>(latest),
    };
  }

  RotationData copyWith(
          {String? code,
          String? formatCode,
          String? name,
          DateTime? dateStart,
          bool? current,
          bool? latest}) =>
      RotationData(
        code: code ?? this.code,
        formatCode: formatCode ?? this.formatCode,
        name: name ?? this.name,
        dateStart: dateStart ?? this.dateStart,
        current: current ?? this.current,
        latest: latest ?? this.latest,
      );
  @override
  String toString() {
    return (StringBuffer('RotationData(')
          ..write('code: $code, ')
          ..write('formatCode: $formatCode, ')
          ..write('name: $name, ')
          ..write('dateStart: $dateStart, ')
          ..write('current: $current, ')
          ..write('latest: $latest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, formatCode, name, dateStart, current, latest);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotationData &&
          other.code == this.code &&
          other.formatCode == this.formatCode &&
          other.name == this.name &&
          other.dateStart == this.dateStart &&
          other.current == this.current &&
          other.latest == this.latest);
}

class RotationCompanion extends UpdateCompanion<RotationData> {
  final Value<String> code;
  final Value<String> formatCode;
  final Value<String> name;
  final Value<DateTime> dateStart;
  final Value<bool> current;
  final Value<bool> latest;
  const RotationCompanion({
    this.code = const Value.absent(),
    this.formatCode = const Value.absent(),
    this.name = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.current = const Value.absent(),
    this.latest = const Value.absent(),
  });
  RotationCompanion.insert({
    required String code,
    required String formatCode,
    required String name,
    required DateTime dateStart,
    required bool current,
    required bool latest,
  })  : code = Value(code),
        formatCode = Value(formatCode),
        name = Value(name),
        dateStart = Value(dateStart),
        current = Value(current),
        latest = Value(latest);
  static Insertable<RotationData> custom({
    Expression<String>? code,
    Expression<String>? formatCode,
    Expression<String>? name,
    Expression<DateTime>? dateStart,
    Expression<bool>? current,
    Expression<bool>? latest,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (formatCode != null) 'format_code': formatCode,
      if (name != null) 'name': name,
      if (dateStart != null) 'date_start': dateStart,
      if (current != null) 'current': current,
      if (latest != null) 'latest': latest,
    });
  }

  RotationCompanion copyWith(
      {Value<String>? code,
      Value<String>? formatCode,
      Value<String>? name,
      Value<DateTime>? dateStart,
      Value<bool>? current,
      Value<bool>? latest}) {
    return RotationCompanion(
      code: code ?? this.code,
      formatCode: formatCode ?? this.formatCode,
      name: name ?? this.name,
      dateStart: dateStart ?? this.dateStart,
      current: current ?? this.current,
      latest: latest ?? this.latest,
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
      final converter = Rotation.$converter0;
      map['date_start'] = Variable<int>(converter.mapToSql(dateStart.value)!);
    }
    if (current.present) {
      map['current'] = Variable<bool>(current.value);
    }
    if (latest.present) {
      map['latest'] = Variable<bool>(latest.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RotationCompanion(')
          ..write('code: $code, ')
          ..write('formatCode: $formatCode, ')
          ..write('name: $name, ')
          ..write('dateStart: $dateStart, ')
          ..write('current: $current, ')
          ..write('latest: $latest')
          ..write(')'))
        .toString();
  }
}

class Rotation extends Table with TableInfo<Rotation, RotationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Rotation(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _formatCodeMeta = const VerificationMeta('formatCode');
  late final GeneratedColumn<String?> formatCode = GeneratedColumn<String?>(
      'format_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _dateStartMeta = const VerificationMeta('dateStart');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> dateStart =
      GeneratedColumn<int?>('date_start', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Rotation.$converter0);
  final VerificationMeta _currentMeta = const VerificationMeta('current');
  late final GeneratedColumn<bool?> current = GeneratedColumn<bool?>(
      'current', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _latestMeta = const VerificationMeta('latest');
  late final GeneratedColumn<bool?> latest = GeneratedColumn<bool?>(
      'latest', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [code, formatCode, name, dateStart, current, latest];
  @override
  String get aliasedName => _alias ?? 'rotation';
  @override
  String get actualTableName => 'rotation';
  @override
  VerificationContext validateIntegrity(Insertable<RotationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('format_code')) {
      context.handle(
          _formatCodeMeta,
          formatCode.isAcceptableOrUnknown(
              data['format_code']!, _formatCodeMeta));
    } else if (isInserting) {
      context.missing(_formatCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_dateStartMeta, const VerificationResult.success());
    if (data.containsKey('current')) {
      context.handle(_currentMeta,
          current.isAcceptableOrUnknown(data['current']!, _currentMeta));
    } else if (isInserting) {
      context.missing(_currentMeta);
    }
    if (data.containsKey('latest')) {
      context.handle(_latestMeta,
          latest.isAcceptableOrUnknown(data['latest']!, _latestMeta));
    } else if (isInserting) {
      context.missing(_latestMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  RotationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RotationData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Rotation createAlias(String alias) {
    return Rotation(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converter0 =
      const DateTimeUtcConverter();
  @override
  bool get dontWriteConstraints => true;
}

class RotationCycleData extends DataClass
    implements Insertable<RotationCycleData> {
  final String rotationCode;
  final String cycleCode;
  RotationCycleData({required this.rotationCode, required this.cycleCode});
  factory RotationCycleData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RotationCycleData(
      rotationCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rotation_code'])!,
      cycleCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cycle_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rotation_code'] = Variable<String>(rotationCode);
    map['cycle_code'] = Variable<String>(cycleCode);
    return map;
  }

  RotationCycleCompanion toCompanion(bool nullToAbsent) {
    return RotationCycleCompanion(
      rotationCode: Value(rotationCode),
      cycleCode: Value(cycleCode),
    );
  }

  factory RotationCycleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RotationCycleData(
      rotationCode: serializer.fromJson<String>(json['rotation_code']),
      cycleCode: serializer.fromJson<String>(json['cycle_code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rotation_code': serializer.toJson<String>(rotationCode),
      'cycle_code': serializer.toJson<String>(cycleCode),
    };
  }

  RotationCycleData copyWith({String? rotationCode, String? cycleCode}) =>
      RotationCycleData(
        rotationCode: rotationCode ?? this.rotationCode,
        cycleCode: cycleCode ?? this.cycleCode,
      );
  @override
  String toString() {
    return (StringBuffer('RotationCycleData(')
          ..write('rotationCode: $rotationCode, ')
          ..write('cycleCode: $cycleCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rotationCode, cycleCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotationCycleData &&
          other.rotationCode == this.rotationCode &&
          other.cycleCode == this.cycleCode);
}

class RotationCycleCompanion extends UpdateCompanion<RotationCycleData> {
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
  static Insertable<RotationCycleData> custom({
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

class RotationCycle extends Table
    with TableInfo<RotationCycle, RotationCycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RotationCycle(this.attachedDatabase, [this._alias]);
  final VerificationMeta _rotationCodeMeta =
      const VerificationMeta('rotationCode');
  late final GeneratedColumn<String?> rotationCode = GeneratedColumn<String?>(
      'rotation_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _cycleCodeMeta = const VerificationMeta('cycleCode');
  late final GeneratedColumn<String?> cycleCode = GeneratedColumn<String?>(
      'cycle_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [rotationCode, cycleCode];
  @override
  String get aliasedName => _alias ?? 'rotation_cycle';
  @override
  String get actualTableName => 'rotation_cycle';
  @override
  VerificationContext validateIntegrity(Insertable<RotationCycleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rotation_code')) {
      context.handle(
          _rotationCodeMeta,
          rotationCode.isAcceptableOrUnknown(
              data['rotation_code']!, _rotationCodeMeta));
    } else if (isInserting) {
      context.missing(_rotationCodeMeta);
    }
    if (data.containsKey('cycle_code')) {
      context.handle(_cycleCodeMeta,
          cycleCode.isAcceptableOrUnknown(data['cycle_code']!, _cycleCodeMeta));
    } else if (isInserting) {
      context.missing(_cycleCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rotationCode, cycleCode};
  @override
  RotationCycleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RotationCycleData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  RotationCycle createAlias(String alias) {
    return RotationCycle(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (rotation_code, cycle_code)'];
  @override
  bool get dontWriteConstraints => true;
}

class PackData extends DataClass implements Insertable<PackData> {
  final String code;
  final String cycleCode;
  final int position;
  final String name;
  final DateTime? dateRelease;
  final int? size;
  PackData(
      {required this.code,
      required this.cycleCode,
      required this.position,
      required this.name,
      this.dateRelease,
      this.size});
  factory PackData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PackData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      cycleCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cycle_code'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      dateRelease: Pack.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_release'])),
      size: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}size']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['cycle_code'] = Variable<String>(cycleCode);
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateRelease != null) {
      final converter = Pack.$converter0;
      map['date_release'] = Variable<int?>(converter.mapToSql(dateRelease));
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int?>(size);
    }
    return map;
  }

  PackCompanion toCompanion(bool nullToAbsent) {
    return PackCompanion(
      code: Value(code),
      cycleCode: Value(cycleCode),
      position: Value(position),
      name: Value(name),
      dateRelease: dateRelease == null && nullToAbsent
          ? const Value.absent()
          : Value(dateRelease),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
    );
  }

  factory PackData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackData(
      code: serializer.fromJson<String>(json['code']),
      cycleCode: serializer.fromJson<String>(json['cycle_code']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      dateRelease: serializer.fromJson<DateTime?>(json['date_release']),
      size: serializer.fromJson<int?>(json['size']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'cycle_code': serializer.toJson<String>(cycleCode),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'date_release': serializer.toJson<DateTime?>(dateRelease),
      'size': serializer.toJson<int?>(size),
    };
  }

  PackData copyWith(
          {String? code,
          String? cycleCode,
          int? position,
          String? name,
          Value<DateTime?> dateRelease = const Value.absent(),
          Value<int?> size = const Value.absent()}) =>
      PackData(
        code: code ?? this.code,
        cycleCode: cycleCode ?? this.cycleCode,
        position: position ?? this.position,
        name: name ?? this.name,
        dateRelease: dateRelease.present ? dateRelease.value : this.dateRelease,
        size: size.present ? size.value : this.size,
      );
  @override
  String toString() {
    return (StringBuffer('PackData(')
          ..write('code: $code, ')
          ..write('cycleCode: $cycleCode, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('dateRelease: $dateRelease, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, cycleCode, position, name, dateRelease, size);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackData &&
          other.code == this.code &&
          other.cycleCode == this.cycleCode &&
          other.position == this.position &&
          other.name == this.name &&
          other.dateRelease == this.dateRelease &&
          other.size == this.size);
}

class PackCompanion extends UpdateCompanion<PackData> {
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
  static Insertable<PackData> custom({
    Expression<String>? code,
    Expression<String>? cycleCode,
    Expression<int>? position,
    Expression<String>? name,
    Expression<DateTime?>? dateRelease,
    Expression<int?>? size,
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
      final converter = Pack.$converter0;
      map['date_release'] =
          Variable<int?>(converter.mapToSql(dateRelease.value));
    }
    if (size.present) {
      map['size'] = Variable<int?>(size.value);
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

class Pack extends Table with TableInfo<Pack, PackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Pack(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _cycleCodeMeta = const VerificationMeta('cycleCode');
  late final GeneratedColumn<String?> cycleCode = GeneratedColumn<String?>(
      'cycle_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _dateReleaseMeta =
      const VerificationMeta('dateRelease');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> dateRelease =
      GeneratedColumn<int?>('date_release', aliasedName, true,
              type: const IntType(),
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime>(Pack.$converter0);
  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  late final GeneratedColumn<int?> size = GeneratedColumn<int?>(
      'size', aliasedName, true,
      type: const IntType(),
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
  VerificationContext validateIntegrity(Insertable<PackData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('cycle_code')) {
      context.handle(_cycleCodeMeta,
          cycleCode.isAcceptableOrUnknown(data['cycle_code']!, _cycleCodeMeta));
    } else if (isInserting) {
      context.missing(_cycleCodeMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_dateReleaseMeta, const VerificationResult.success());
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  PackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PackData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Pack createAlias(String alias) {
    return Pack(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converter0 =
      const DateTimeUtcConverter();
  @override
  bool get dontWriteConstraints => true;
}

class NrdbData extends DataClass implements Insertable<NrdbData> {
  final bool id;
  final DateTime expires;
  final DateTime cycleLastUpdated;
  final DateTime packLastUpdated;
  final DateTime sideLastUpdated;
  final DateTime factionLastUpdated;
  final DateTime typeLastUpdated;
  final DateTime cardLastUpdated;
  final DateTime formatLastUpdated;
  final DateTime rotationLastUpdated;
  final DateTime mwlLastUpdated;
  NrdbData(
      {required this.id,
      required this.expires,
      required this.cycleLastUpdated,
      required this.packLastUpdated,
      required this.sideLastUpdated,
      required this.factionLastUpdated,
      required this.typeLastUpdated,
      required this.cardLastUpdated,
      required this.formatLastUpdated,
      required this.rotationLastUpdated,
      required this.mwlLastUpdated});
  factory NrdbData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NrdbData(
      id: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      expires: Nrdb.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}expires']))!,
      cycleLastUpdated: Nrdb.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}cycle_last_updated']))!,
      packLastUpdated: Nrdb.$converter2.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}pack_last_updated']))!,
      sideLastUpdated: Nrdb.$converter3.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}side_last_updated']))!,
      factionLastUpdated: Nrdb.$converter4.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}faction_last_updated']))!,
      typeLastUpdated: Nrdb.$converter5.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}type_last_updated']))!,
      cardLastUpdated: Nrdb.$converter6.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}card_last_updated']))!,
      formatLastUpdated: Nrdb.$converter7.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}format_last_updated']))!,
      rotationLastUpdated: Nrdb.$converter8.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}rotation_last_updated']))!,
      mwlLastUpdated: Nrdb.$converter9.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}mwl_last_updated']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<bool>(id);
    {
      final converter = Nrdb.$converter0;
      map['expires'] = Variable<int>(converter.mapToSql(expires)!);
    }
    {
      final converter = Nrdb.$converter1;
      map['cycle_last_updated'] =
          Variable<int>(converter.mapToSql(cycleLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter2;
      map['pack_last_updated'] =
          Variable<int>(converter.mapToSql(packLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter3;
      map['side_last_updated'] =
          Variable<int>(converter.mapToSql(sideLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter4;
      map['faction_last_updated'] =
          Variable<int>(converter.mapToSql(factionLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter5;
      map['type_last_updated'] =
          Variable<int>(converter.mapToSql(typeLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter6;
      map['card_last_updated'] =
          Variable<int>(converter.mapToSql(cardLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter7;
      map['format_last_updated'] =
          Variable<int>(converter.mapToSql(formatLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter8;
      map['rotation_last_updated'] =
          Variable<int>(converter.mapToSql(rotationLastUpdated)!);
    }
    {
      final converter = Nrdb.$converter9;
      map['mwl_last_updated'] =
          Variable<int>(converter.mapToSql(mwlLastUpdated)!);
    }
    return map;
  }

  NrdbCompanion toCompanion(bool nullToAbsent) {
    return NrdbCompanion(
      id: Value(id),
      expires: Value(expires),
      cycleLastUpdated: Value(cycleLastUpdated),
      packLastUpdated: Value(packLastUpdated),
      sideLastUpdated: Value(sideLastUpdated),
      factionLastUpdated: Value(factionLastUpdated),
      typeLastUpdated: Value(typeLastUpdated),
      cardLastUpdated: Value(cardLastUpdated),
      formatLastUpdated: Value(formatLastUpdated),
      rotationLastUpdated: Value(rotationLastUpdated),
      mwlLastUpdated: Value(mwlLastUpdated),
    );
  }

  factory NrdbData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NrdbData(
      id: serializer.fromJson<bool>(json['id']),
      expires: serializer.fromJson<DateTime>(json['expires']),
      cycleLastUpdated:
          serializer.fromJson<DateTime>(json['cycle_last_updated']),
      packLastUpdated: serializer.fromJson<DateTime>(json['pack_last_updated']),
      sideLastUpdated: serializer.fromJson<DateTime>(json['side_last_updated']),
      factionLastUpdated:
          serializer.fromJson<DateTime>(json['faction_last_updated']),
      typeLastUpdated: serializer.fromJson<DateTime>(json['type_last_updated']),
      cardLastUpdated: serializer.fromJson<DateTime>(json['card_last_updated']),
      formatLastUpdated:
          serializer.fromJson<DateTime>(json['format_last_updated']),
      rotationLastUpdated:
          serializer.fromJson<DateTime>(json['rotation_last_updated']),
      mwlLastUpdated: serializer.fromJson<DateTime>(json['mwl_last_updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<bool>(id),
      'expires': serializer.toJson<DateTime>(expires),
      'cycle_last_updated': serializer.toJson<DateTime>(cycleLastUpdated),
      'pack_last_updated': serializer.toJson<DateTime>(packLastUpdated),
      'side_last_updated': serializer.toJson<DateTime>(sideLastUpdated),
      'faction_last_updated': serializer.toJson<DateTime>(factionLastUpdated),
      'type_last_updated': serializer.toJson<DateTime>(typeLastUpdated),
      'card_last_updated': serializer.toJson<DateTime>(cardLastUpdated),
      'format_last_updated': serializer.toJson<DateTime>(formatLastUpdated),
      'rotation_last_updated': serializer.toJson<DateTime>(rotationLastUpdated),
      'mwl_last_updated': serializer.toJson<DateTime>(mwlLastUpdated),
    };
  }

  NrdbData copyWith(
          {bool? id,
          DateTime? expires,
          DateTime? cycleLastUpdated,
          DateTime? packLastUpdated,
          DateTime? sideLastUpdated,
          DateTime? factionLastUpdated,
          DateTime? typeLastUpdated,
          DateTime? cardLastUpdated,
          DateTime? formatLastUpdated,
          DateTime? rotationLastUpdated,
          DateTime? mwlLastUpdated}) =>
      NrdbData(
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
  @override
  String toString() {
    return (StringBuffer('NrdbData(')
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

  @override
  int get hashCode => Object.hash(
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
      mwlLastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NrdbData &&
          other.id == this.id &&
          other.expires == this.expires &&
          other.cycleLastUpdated == this.cycleLastUpdated &&
          other.packLastUpdated == this.packLastUpdated &&
          other.sideLastUpdated == this.sideLastUpdated &&
          other.factionLastUpdated == this.factionLastUpdated &&
          other.typeLastUpdated == this.typeLastUpdated &&
          other.cardLastUpdated == this.cardLastUpdated &&
          other.formatLastUpdated == this.formatLastUpdated &&
          other.rotationLastUpdated == this.rotationLastUpdated &&
          other.mwlLastUpdated == this.mwlLastUpdated);
}

class NrdbCompanion extends UpdateCompanion<NrdbData> {
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
  static Insertable<NrdbData> custom({
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
      final converter = Nrdb.$converter0;
      map['expires'] = Variable<int>(converter.mapToSql(expires.value)!);
    }
    if (cycleLastUpdated.present) {
      final converter = Nrdb.$converter1;
      map['cycle_last_updated'] =
          Variable<int>(converter.mapToSql(cycleLastUpdated.value)!);
    }
    if (packLastUpdated.present) {
      final converter = Nrdb.$converter2;
      map['pack_last_updated'] =
          Variable<int>(converter.mapToSql(packLastUpdated.value)!);
    }
    if (sideLastUpdated.present) {
      final converter = Nrdb.$converter3;
      map['side_last_updated'] =
          Variable<int>(converter.mapToSql(sideLastUpdated.value)!);
    }
    if (factionLastUpdated.present) {
      final converter = Nrdb.$converter4;
      map['faction_last_updated'] =
          Variable<int>(converter.mapToSql(factionLastUpdated.value)!);
    }
    if (typeLastUpdated.present) {
      final converter = Nrdb.$converter5;
      map['type_last_updated'] =
          Variable<int>(converter.mapToSql(typeLastUpdated.value)!);
    }
    if (cardLastUpdated.present) {
      final converter = Nrdb.$converter6;
      map['card_last_updated'] =
          Variable<int>(converter.mapToSql(cardLastUpdated.value)!);
    }
    if (formatLastUpdated.present) {
      final converter = Nrdb.$converter7;
      map['format_last_updated'] =
          Variable<int>(converter.mapToSql(formatLastUpdated.value)!);
    }
    if (rotationLastUpdated.present) {
      final converter = Nrdb.$converter8;
      map['rotation_last_updated'] =
          Variable<int>(converter.mapToSql(rotationLastUpdated.value)!);
    }
    if (mwlLastUpdated.present) {
      final converter = Nrdb.$converter9;
      map['mwl_last_updated'] =
          Variable<int>(converter.mapToSql(mwlLastUpdated.value)!);
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

class Nrdb extends Table with TableInfo<Nrdb, NrdbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Nrdb(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<bool?> id = GeneratedColumn<bool?>(
      'id', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression<bool>('TRUE'));
  final VerificationMeta _expiresMeta = const VerificationMeta('expires');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> expires =
      GeneratedColumn<int?>('expires', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter0);
  final VerificationMeta _cycleLastUpdatedMeta =
      const VerificationMeta('cycleLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> cycleLastUpdated =
      GeneratedColumn<int?>('cycle_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter1);
  final VerificationMeta _packLastUpdatedMeta =
      const VerificationMeta('packLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> packLastUpdated =
      GeneratedColumn<int?>('pack_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter2);
  final VerificationMeta _sideLastUpdatedMeta =
      const VerificationMeta('sideLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> sideLastUpdated =
      GeneratedColumn<int?>('side_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter3);
  final VerificationMeta _factionLastUpdatedMeta =
      const VerificationMeta('factionLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?>
      factionLastUpdated = GeneratedColumn<int?>(
              'faction_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter4);
  final VerificationMeta _typeLastUpdatedMeta =
      const VerificationMeta('typeLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> typeLastUpdated =
      GeneratedColumn<int?>('type_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter5);
  final VerificationMeta _cardLastUpdatedMeta =
      const VerificationMeta('cardLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> cardLastUpdated =
      GeneratedColumn<int?>('card_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter6);
  final VerificationMeta _formatLastUpdatedMeta =
      const VerificationMeta('formatLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?>
      formatLastUpdated = GeneratedColumn<int?>(
              'format_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter7);
  final VerificationMeta _rotationLastUpdatedMeta =
      const VerificationMeta('rotationLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?>
      rotationLastUpdated = GeneratedColumn<int?>(
              'rotation_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter8);
  final VerificationMeta _mwlLastUpdatedMeta =
      const VerificationMeta('mwlLastUpdated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> mwlLastUpdated =
      GeneratedColumn<int?>('mwl_last_updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Nrdb.$converter9);
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
  VerificationContext validateIntegrity(Insertable<NrdbData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_expiresMeta, const VerificationResult.success());
    context.handle(_cycleLastUpdatedMeta, const VerificationResult.success());
    context.handle(_packLastUpdatedMeta, const VerificationResult.success());
    context.handle(_sideLastUpdatedMeta, const VerificationResult.success());
    context.handle(_factionLastUpdatedMeta, const VerificationResult.success());
    context.handle(_typeLastUpdatedMeta, const VerificationResult.success());
    context.handle(_cardLastUpdatedMeta, const VerificationResult.success());
    context.handle(_formatLastUpdatedMeta, const VerificationResult.success());
    context.handle(
        _rotationLastUpdatedMeta, const VerificationResult.success());
    context.handle(_mwlLastUpdatedMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NrdbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NrdbData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Nrdb createAlias(String alias) {
    return Nrdb(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converter0 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter1 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter2 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter3 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter4 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter5 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter6 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter7 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter8 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter9 =
      const DateTimeUtcConverter();
  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT settings_id CHECK (id = TRUE)'];
  @override
  bool get dontWriteConstraints => true;
}

class MwlData extends DataClass implements Insertable<MwlData> {
  final String code;
  final String formatCode;
  final String name;
  final DateTime dateStart;
  final bool active;
  final bool latest;
  MwlData(
      {required this.code,
      required this.formatCode,
      required this.name,
      required this.dateStart,
      required this.active,
      required this.latest});
  factory MwlData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MwlData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      formatCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}format_code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      dateStart: Mwl.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_start']))!,
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active'])!,
      latest: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latest'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['format_code'] = Variable<String>(formatCode);
    map['name'] = Variable<String>(name);
    {
      final converter = Mwl.$converter0;
      map['date_start'] = Variable<int>(converter.mapToSql(dateStart)!);
    }
    map['active'] = Variable<bool>(active);
    map['latest'] = Variable<bool>(latest);
    return map;
  }

  MwlCompanion toCompanion(bool nullToAbsent) {
    return MwlCompanion(
      code: Value(code),
      formatCode: Value(formatCode),
      name: Value(name),
      dateStart: Value(dateStart),
      active: Value(active),
      latest: Value(latest),
    );
  }

  factory MwlData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MwlData(
      code: serializer.fromJson<String>(json['code']),
      formatCode: serializer.fromJson<String>(json['format_code']),
      name: serializer.fromJson<String>(json['name']),
      dateStart: serializer.fromJson<DateTime>(json['date_start']),
      active: serializer.fromJson<bool>(json['active']),
      latest: serializer.fromJson<bool>(json['latest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'format_code': serializer.toJson<String>(formatCode),
      'name': serializer.toJson<String>(name),
      'date_start': serializer.toJson<DateTime>(dateStart),
      'active': serializer.toJson<bool>(active),
      'latest': serializer.toJson<bool>(latest),
    };
  }

  MwlData copyWith(
          {String? code,
          String? formatCode,
          String? name,
          DateTime? dateStart,
          bool? active,
          bool? latest}) =>
      MwlData(
        code: code ?? this.code,
        formatCode: formatCode ?? this.formatCode,
        name: name ?? this.name,
        dateStart: dateStart ?? this.dateStart,
        active: active ?? this.active,
        latest: latest ?? this.latest,
      );
  @override
  String toString() {
    return (StringBuffer('MwlData(')
          ..write('code: $code, ')
          ..write('formatCode: $formatCode, ')
          ..write('name: $name, ')
          ..write('dateStart: $dateStart, ')
          ..write('active: $active, ')
          ..write('latest: $latest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, formatCode, name, dateStart, active, latest);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MwlData &&
          other.code == this.code &&
          other.formatCode == this.formatCode &&
          other.name == this.name &&
          other.dateStart == this.dateStart &&
          other.active == this.active &&
          other.latest == this.latest);
}

class MwlCompanion extends UpdateCompanion<MwlData> {
  final Value<String> code;
  final Value<String> formatCode;
  final Value<String> name;
  final Value<DateTime> dateStart;
  final Value<bool> active;
  final Value<bool> latest;
  const MwlCompanion({
    this.code = const Value.absent(),
    this.formatCode = const Value.absent(),
    this.name = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.active = const Value.absent(),
    this.latest = const Value.absent(),
  });
  MwlCompanion.insert({
    required String code,
    required String formatCode,
    required String name,
    required DateTime dateStart,
    required bool active,
    required bool latest,
  })  : code = Value(code),
        formatCode = Value(formatCode),
        name = Value(name),
        dateStart = Value(dateStart),
        active = Value(active),
        latest = Value(latest);
  static Insertable<MwlData> custom({
    Expression<String>? code,
    Expression<String>? formatCode,
    Expression<String>? name,
    Expression<DateTime>? dateStart,
    Expression<bool>? active,
    Expression<bool>? latest,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (formatCode != null) 'format_code': formatCode,
      if (name != null) 'name': name,
      if (dateStart != null) 'date_start': dateStart,
      if (active != null) 'active': active,
      if (latest != null) 'latest': latest,
    });
  }

  MwlCompanion copyWith(
      {Value<String>? code,
      Value<String>? formatCode,
      Value<String>? name,
      Value<DateTime>? dateStart,
      Value<bool>? active,
      Value<bool>? latest}) {
    return MwlCompanion(
      code: code ?? this.code,
      formatCode: formatCode ?? this.formatCode,
      name: name ?? this.name,
      dateStart: dateStart ?? this.dateStart,
      active: active ?? this.active,
      latest: latest ?? this.latest,
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
      final converter = Mwl.$converter0;
      map['date_start'] = Variable<int>(converter.mapToSql(dateStart.value)!);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (latest.present) {
      map['latest'] = Variable<bool>(latest.value);
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
          ..write('active: $active, ')
          ..write('latest: $latest')
          ..write(')'))
        .toString();
  }
}

class Mwl extends Table with TableInfo<Mwl, MwlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mwl(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _formatCodeMeta = const VerificationMeta('formatCode');
  late final GeneratedColumn<String?> formatCode = GeneratedColumn<String?>(
      'format_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _dateStartMeta = const VerificationMeta('dateStart');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> dateStart =
      GeneratedColumn<int?>('date_start', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Mwl.$converter0);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _latestMeta = const VerificationMeta('latest');
  late final GeneratedColumn<bool?> latest = GeneratedColumn<bool?>(
      'latest', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [code, formatCode, name, dateStart, active, latest];
  @override
  String get aliasedName => _alias ?? 'mwl';
  @override
  String get actualTableName => 'mwl';
  @override
  VerificationContext validateIntegrity(Insertable<MwlData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('format_code')) {
      context.handle(
          _formatCodeMeta,
          formatCode.isAcceptableOrUnknown(
              data['format_code']!, _formatCodeMeta));
    } else if (isInserting) {
      context.missing(_formatCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_dateStartMeta, const VerificationResult.success());
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('latest')) {
      context.handle(_latestMeta,
          latest.isAcceptableOrUnknown(data['latest']!, _latestMeta));
    } else if (isInserting) {
      context.missing(_latestMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  MwlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MwlData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Mwl createAlias(String alias) {
    return Mwl(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converter0 =
      const DateTimeUtcConverter();
  @override
  bool get dontWriteConstraints => true;
}

class MwlCardData extends DataClass implements Insertable<MwlCardData> {
  final String mwlCode;
  final String cardCode;
  final bool isRestricted;
  final int? globalPenalty;
  final int? universalFactionCost;
  final int? deckLimit;
  MwlCardData(
      {required this.mwlCode,
      required this.cardCode,
      required this.isRestricted,
      this.globalPenalty,
      this.universalFactionCost,
      this.deckLimit});
  factory MwlCardData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MwlCardData(
      mwlCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mwl_code'])!,
      cardCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_code'])!,
      isRestricted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_restricted'])!,
      globalPenalty: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}global_penalty']),
      universalFactionCost: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}universal_faction_cost']),
      deckLimit: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_limit']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mwl_code'] = Variable<String>(mwlCode);
    map['card_code'] = Variable<String>(cardCode);
    map['is_restricted'] = Variable<bool>(isRestricted);
    if (!nullToAbsent || globalPenalty != null) {
      map['global_penalty'] = Variable<int?>(globalPenalty);
    }
    if (!nullToAbsent || universalFactionCost != null) {
      map['universal_faction_cost'] = Variable<int?>(universalFactionCost);
    }
    if (!nullToAbsent || deckLimit != null) {
      map['deck_limit'] = Variable<int?>(deckLimit);
    }
    return map;
  }

  MwlCardCompanion toCompanion(bool nullToAbsent) {
    return MwlCardCompanion(
      mwlCode: Value(mwlCode),
      cardCode: Value(cardCode),
      isRestricted: Value(isRestricted),
      globalPenalty: globalPenalty == null && nullToAbsent
          ? const Value.absent()
          : Value(globalPenalty),
      universalFactionCost: universalFactionCost == null && nullToAbsent
          ? const Value.absent()
          : Value(universalFactionCost),
      deckLimit: deckLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(deckLimit),
    );
  }

  factory MwlCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MwlCardData(
      mwlCode: serializer.fromJson<String>(json['mwl_code']),
      cardCode: serializer.fromJson<String>(json['card_code']),
      isRestricted: serializer.fromJson<bool>(json['is_restricted']),
      globalPenalty: serializer.fromJson<int?>(json['global_penalty']),
      universalFactionCost:
          serializer.fromJson<int?>(json['universal_faction_cost']),
      deckLimit: serializer.fromJson<int?>(json['deck_limit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mwl_code': serializer.toJson<String>(mwlCode),
      'card_code': serializer.toJson<String>(cardCode),
      'is_restricted': serializer.toJson<bool>(isRestricted),
      'global_penalty': serializer.toJson<int?>(globalPenalty),
      'universal_faction_cost': serializer.toJson<int?>(universalFactionCost),
      'deck_limit': serializer.toJson<int?>(deckLimit),
    };
  }

  MwlCardData copyWith(
          {String? mwlCode,
          String? cardCode,
          bool? isRestricted,
          Value<int?> globalPenalty = const Value.absent(),
          Value<int?> universalFactionCost = const Value.absent(),
          Value<int?> deckLimit = const Value.absent()}) =>
      MwlCardData(
        mwlCode: mwlCode ?? this.mwlCode,
        cardCode: cardCode ?? this.cardCode,
        isRestricted: isRestricted ?? this.isRestricted,
        globalPenalty:
            globalPenalty.present ? globalPenalty.value : this.globalPenalty,
        universalFactionCost: universalFactionCost.present
            ? universalFactionCost.value
            : this.universalFactionCost,
        deckLimit: deckLimit.present ? deckLimit.value : this.deckLimit,
      );
  @override
  String toString() {
    return (StringBuffer('MwlCardData(')
          ..write('mwlCode: $mwlCode, ')
          ..write('cardCode: $cardCode, ')
          ..write('isRestricted: $isRestricted, ')
          ..write('globalPenalty: $globalPenalty, ')
          ..write('universalFactionCost: $universalFactionCost, ')
          ..write('deckLimit: $deckLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mwlCode, cardCode, isRestricted,
      globalPenalty, universalFactionCost, deckLimit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MwlCardData &&
          other.mwlCode == this.mwlCode &&
          other.cardCode == this.cardCode &&
          other.isRestricted == this.isRestricted &&
          other.globalPenalty == this.globalPenalty &&
          other.universalFactionCost == this.universalFactionCost &&
          other.deckLimit == this.deckLimit);
}

class MwlCardCompanion extends UpdateCompanion<MwlCardData> {
  final Value<String> mwlCode;
  final Value<String> cardCode;
  final Value<bool> isRestricted;
  final Value<int?> globalPenalty;
  final Value<int?> universalFactionCost;
  final Value<int?> deckLimit;
  const MwlCardCompanion({
    this.mwlCode = const Value.absent(),
    this.cardCode = const Value.absent(),
    this.isRestricted = const Value.absent(),
    this.globalPenalty = const Value.absent(),
    this.universalFactionCost = const Value.absent(),
    this.deckLimit = const Value.absent(),
  });
  MwlCardCompanion.insert({
    required String mwlCode,
    required String cardCode,
    required bool isRestricted,
    this.globalPenalty = const Value.absent(),
    this.universalFactionCost = const Value.absent(),
    this.deckLimit = const Value.absent(),
  })  : mwlCode = Value(mwlCode),
        cardCode = Value(cardCode),
        isRestricted = Value(isRestricted);
  static Insertable<MwlCardData> custom({
    Expression<String>? mwlCode,
    Expression<String>? cardCode,
    Expression<bool>? isRestricted,
    Expression<int?>? globalPenalty,
    Expression<int?>? universalFactionCost,
    Expression<int?>? deckLimit,
  }) {
    return RawValuesInsertable({
      if (mwlCode != null) 'mwl_code': mwlCode,
      if (cardCode != null) 'card_code': cardCode,
      if (isRestricted != null) 'is_restricted': isRestricted,
      if (globalPenalty != null) 'global_penalty': globalPenalty,
      if (universalFactionCost != null)
        'universal_faction_cost': universalFactionCost,
      if (deckLimit != null) 'deck_limit': deckLimit,
    });
  }

  MwlCardCompanion copyWith(
      {Value<String>? mwlCode,
      Value<String>? cardCode,
      Value<bool>? isRestricted,
      Value<int?>? globalPenalty,
      Value<int?>? universalFactionCost,
      Value<int?>? deckLimit}) {
    return MwlCardCompanion(
      mwlCode: mwlCode ?? this.mwlCode,
      cardCode: cardCode ?? this.cardCode,
      isRestricted: isRestricted ?? this.isRestricted,
      globalPenalty: globalPenalty ?? this.globalPenalty,
      universalFactionCost: universalFactionCost ?? this.universalFactionCost,
      deckLimit: deckLimit ?? this.deckLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mwlCode.present) {
      map['mwl_code'] = Variable<String>(mwlCode.value);
    }
    if (cardCode.present) {
      map['card_code'] = Variable<String>(cardCode.value);
    }
    if (isRestricted.present) {
      map['is_restricted'] = Variable<bool>(isRestricted.value);
    }
    if (globalPenalty.present) {
      map['global_penalty'] = Variable<int?>(globalPenalty.value);
    }
    if (universalFactionCost.present) {
      map['universal_faction_cost'] =
          Variable<int?>(universalFactionCost.value);
    }
    if (deckLimit.present) {
      map['deck_limit'] = Variable<int?>(deckLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MwlCardCompanion(')
          ..write('mwlCode: $mwlCode, ')
          ..write('cardCode: $cardCode, ')
          ..write('isRestricted: $isRestricted, ')
          ..write('globalPenalty: $globalPenalty, ')
          ..write('universalFactionCost: $universalFactionCost, ')
          ..write('deckLimit: $deckLimit')
          ..write(')'))
        .toString();
  }
}

class MwlCard extends Table with TableInfo<MwlCard, MwlCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MwlCard(this.attachedDatabase, [this._alias]);
  final VerificationMeta _mwlCodeMeta = const VerificationMeta('mwlCode');
  late final GeneratedColumn<String?> mwlCode = GeneratedColumn<String?>(
      'mwl_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _cardCodeMeta = const VerificationMeta('cardCode');
  late final GeneratedColumn<String?> cardCode = GeneratedColumn<String?>(
      'card_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _isRestrictedMeta =
      const VerificationMeta('isRestricted');
  late final GeneratedColumn<bool?> isRestricted = GeneratedColumn<bool?>(
      'is_restricted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _globalPenaltyMeta =
      const VerificationMeta('globalPenalty');
  late final GeneratedColumn<int?> globalPenalty = GeneratedColumn<int?>(
      'global_penalty', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _universalFactionCostMeta =
      const VerificationMeta('universalFactionCost');
  late final GeneratedColumn<int?> universalFactionCost = GeneratedColumn<int?>(
      'universal_faction_cost', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _deckLimitMeta = const VerificationMeta('deckLimit');
  late final GeneratedColumn<int?> deckLimit = GeneratedColumn<int?>(
      'deck_limit', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        mwlCode,
        cardCode,
        isRestricted,
        globalPenalty,
        universalFactionCost,
        deckLimit
      ];
  @override
  String get aliasedName => _alias ?? 'mwl_card';
  @override
  String get actualTableName => 'mwl_card';
  @override
  VerificationContext validateIntegrity(Insertable<MwlCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mwl_code')) {
      context.handle(_mwlCodeMeta,
          mwlCode.isAcceptableOrUnknown(data['mwl_code']!, _mwlCodeMeta));
    } else if (isInserting) {
      context.missing(_mwlCodeMeta);
    }
    if (data.containsKey('card_code')) {
      context.handle(_cardCodeMeta,
          cardCode.isAcceptableOrUnknown(data['card_code']!, _cardCodeMeta));
    } else if (isInserting) {
      context.missing(_cardCodeMeta);
    }
    if (data.containsKey('is_restricted')) {
      context.handle(
          _isRestrictedMeta,
          isRestricted.isAcceptableOrUnknown(
              data['is_restricted']!, _isRestrictedMeta));
    } else if (isInserting) {
      context.missing(_isRestrictedMeta);
    }
    if (data.containsKey('global_penalty')) {
      context.handle(
          _globalPenaltyMeta,
          globalPenalty.isAcceptableOrUnknown(
              data['global_penalty']!, _globalPenaltyMeta));
    }
    if (data.containsKey('universal_faction_cost')) {
      context.handle(
          _universalFactionCostMeta,
          universalFactionCost.isAcceptableOrUnknown(
              data['universal_faction_cost']!, _universalFactionCostMeta));
    }
    if (data.containsKey('deck_limit')) {
      context.handle(_deckLimitMeta,
          deckLimit.isAcceptableOrUnknown(data['deck_limit']!, _deckLimitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mwlCode, cardCode};
  @override
  MwlCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MwlCardData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  MwlCard createAlias(String alias) {
    return MwlCard(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (mwl_code, card_code)'];
  @override
  bool get dontWriteConstraints => true;
}

class FormatData extends DataClass implements Insertable<FormatData> {
  final int id;
  final String code;
  final String name;
  FormatData({required this.id, required this.code, required this.name});
  factory FormatData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FormatData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  FormatCompanion toCompanion(bool nullToAbsent) {
    return FormatCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
    );
  }

  factory FormatData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormatData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  FormatData copyWith({int? id, String? code, String? name}) => FormatData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FormatData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormatData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name);
}

class FormatCompanion extends UpdateCompanion<FormatData> {
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
  static Insertable<FormatData> custom({
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

class Format extends Table with TableInfo<Format, FormatData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Format(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? 'format';
  @override
  String get actualTableName => 'format';
  @override
  VerificationContext validateIntegrity(Insertable<FormatData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  FormatData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FormatData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Format createAlias(String alias) {
    return Format(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FactionData extends DataClass implements Insertable<FactionData> {
  final String code;
  final String sideCode;
  final String name;
  final Color color;
  final bool isMini;
  FactionData(
      {required this.code,
      required this.sideCode,
      required this.name,
      required this.color,
      required this.isMini});
  factory FactionData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FactionData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      sideCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}side_code'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      color: Faction.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color']))!,
      isMini: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mini'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['side_code'] = Variable<String>(sideCode);
    map['name'] = Variable<String>(name);
    {
      final converter = Faction.$converter0;
      map['color'] = Variable<int>(converter.mapToSql(color)!);
    }
    map['is_mini'] = Variable<bool>(isMini);
    return map;
  }

  FactionCompanion toCompanion(bool nullToAbsent) {
    return FactionCompanion(
      code: Value(code),
      sideCode: Value(sideCode),
      name: Value(name),
      color: Value(color),
      isMini: Value(isMini),
    );
  }

  factory FactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FactionData(
      code: serializer.fromJson<String>(json['code']),
      sideCode: serializer.fromJson<String>(json['side_code']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<Color>(json['color']),
      isMini: serializer.fromJson<bool>(json['is_mini']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'side_code': serializer.toJson<String>(sideCode),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<Color>(color),
      'is_mini': serializer.toJson<bool>(isMini),
    };
  }

  FactionData copyWith(
          {String? code,
          String? sideCode,
          String? name,
          Color? color,
          bool? isMini}) =>
      FactionData(
        code: code ?? this.code,
        sideCode: sideCode ?? this.sideCode,
        name: name ?? this.name,
        color: color ?? this.color,
        isMini: isMini ?? this.isMini,
      );
  @override
  String toString() {
    return (StringBuffer('FactionData(')
          ..write('code: $code, ')
          ..write('sideCode: $sideCode, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isMini: $isMini')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, sideCode, name, color, isMini);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FactionData &&
          other.code == this.code &&
          other.sideCode == this.sideCode &&
          other.name == this.name &&
          other.color == this.color &&
          other.isMini == this.isMini);
}

class FactionCompanion extends UpdateCompanion<FactionData> {
  final Value<String> code;
  final Value<String> sideCode;
  final Value<String> name;
  final Value<Color> color;
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
    required Color color,
    required bool isMini,
  })  : code = Value(code),
        sideCode = Value(sideCode),
        name = Value(name),
        color = Value(color),
        isMini = Value(isMini);
  static Insertable<FactionData> custom({
    Expression<String>? code,
    Expression<String>? sideCode,
    Expression<String>? name,
    Expression<Color>? color,
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
      Value<Color>? color,
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
      final converter = Faction.$converter0;
      map['color'] = Variable<int>(converter.mapToSql(color.value)!);
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

class Faction extends Table with TableInfo<Faction, FactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Faction(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _sideCodeMeta = const VerificationMeta('sideCode');
  late final GeneratedColumn<String?> sideCode = GeneratedColumn<String?>(
      'side_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumnWithTypeConverter<Color, int?> color =
      GeneratedColumn<int?>('color', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<Color>(Faction.$converter0);
  final VerificationMeta _isMiniMeta = const VerificationMeta('isMini');
  late final GeneratedColumn<bool?> isMini = GeneratedColumn<bool?>(
      'is_mini', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, sideCode, name, color, isMini];
  @override
  String get aliasedName => _alias ?? 'faction';
  @override
  String get actualTableName => 'faction';
  @override
  VerificationContext validateIntegrity(Insertable<FactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('side_code')) {
      context.handle(_sideCodeMeta,
          sideCode.isAcceptableOrUnknown(data['side_code']!, _sideCodeMeta));
    } else if (isInserting) {
      context.missing(_sideCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_colorMeta, const VerificationResult.success());
    if (data.containsKey('is_mini')) {
      context.handle(_isMiniMeta,
          isMini.isAcceptableOrUnknown(data['is_mini']!, _isMiniMeta));
    } else if (isInserting) {
      context.missing(_isMiniMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  FactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FactionData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Faction createAlias(String alias) {
    return Faction(attachedDatabase, alias);
  }

  static TypeConverter<Color, int> $converter0 = const ColorConverter();
  @override
  bool get dontWriteConstraints => true;
}

class DeckData extends DataClass implements Insertable<DeckData> {
  final String id;
  final String identityCode;
  final String? formatCode;
  final String? rotationCode;
  final String? mwlCode;
  final String name;
  final String description;
  final DateTime created;
  final DateTime updated;
  final DeckState state;
  final DateTime? lastSynced;
  DeckData(
      {required this.id,
      required this.identityCode,
      this.formatCode,
      this.rotationCode,
      this.mwlCode,
      required this.name,
      required this.description,
      required this.created,
      required this.updated,
      required this.state,
      this.lastSynced});
  factory DeckData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeckData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      identityCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}identity_code'])!,
      formatCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}format_code']),
      rotationCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rotation_code']),
      mwlCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mwl_code']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      created: Deck.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created']))!,
      updated: Deck.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated']))!,
      state: Deck.$converter2.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']))!,
      lastSynced: Deck.$converter3.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_synced'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['identity_code'] = Variable<String>(identityCode);
    if (!nullToAbsent || formatCode != null) {
      map['format_code'] = Variable<String?>(formatCode);
    }
    if (!nullToAbsent || rotationCode != null) {
      map['rotation_code'] = Variable<String?>(rotationCode);
    }
    if (!nullToAbsent || mwlCode != null) {
      map['mwl_code'] = Variable<String?>(mwlCode);
    }
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    {
      final converter = Deck.$converter0;
      map['created'] = Variable<int>(converter.mapToSql(created)!);
    }
    {
      final converter = Deck.$converter1;
      map['updated'] = Variable<int>(converter.mapToSql(updated)!);
    }
    {
      final converter = Deck.$converter2;
      map['state'] = Variable<String>(converter.mapToSql(state)!);
    }
    if (!nullToAbsent || lastSynced != null) {
      final converter = Deck.$converter3;
      map['last_synced'] = Variable<int?>(converter.mapToSql(lastSynced));
    }
    return map;
  }

  DeckCompanion toCompanion(bool nullToAbsent) {
    return DeckCompanion(
      id: Value(id),
      identityCode: Value(identityCode),
      formatCode: formatCode == null && nullToAbsent
          ? const Value.absent()
          : Value(formatCode),
      rotationCode: rotationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(rotationCode),
      mwlCode: mwlCode == null && nullToAbsent
          ? const Value.absent()
          : Value(mwlCode),
      name: Value(name),
      description: Value(description),
      created: Value(created),
      updated: Value(updated),
      state: Value(state),
      lastSynced: lastSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynced),
    );
  }

  factory DeckData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckData(
      id: serializer.fromJson<String>(json['id']),
      identityCode: serializer.fromJson<String>(json['identity_code']),
      formatCode: serializer.fromJson<String?>(json['format_code']),
      rotationCode: serializer.fromJson<String?>(json['rotation_code']),
      mwlCode: serializer.fromJson<String?>(json['mwl_code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      state: serializer.fromJson<DeckState>(json['state']),
      lastSynced: serializer.fromJson<DateTime?>(json['last_synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'identity_code': serializer.toJson<String>(identityCode),
      'format_code': serializer.toJson<String?>(formatCode),
      'rotation_code': serializer.toJson<String?>(rotationCode),
      'mwl_code': serializer.toJson<String?>(mwlCode),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'state': serializer.toJson<DeckState>(state),
      'last_synced': serializer.toJson<DateTime?>(lastSynced),
    };
  }

  DeckData copyWith(
          {String? id,
          String? identityCode,
          Value<String?> formatCode = const Value.absent(),
          Value<String?> rotationCode = const Value.absent(),
          Value<String?> mwlCode = const Value.absent(),
          String? name,
          String? description,
          DateTime? created,
          DateTime? updated,
          DeckState? state,
          Value<DateTime?> lastSynced = const Value.absent()}) =>
      DeckData(
        id: id ?? this.id,
        identityCode: identityCode ?? this.identityCode,
        formatCode: formatCode.present ? formatCode.value : this.formatCode,
        rotationCode:
            rotationCode.present ? rotationCode.value : this.rotationCode,
        mwlCode: mwlCode.present ? mwlCode.value : this.mwlCode,
        name: name ?? this.name,
        description: description ?? this.description,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        state: state ?? this.state,
        lastSynced: lastSynced.present ? lastSynced.value : this.lastSynced,
      );
  @override
  String toString() {
    return (StringBuffer('DeckData(')
          ..write('id: $id, ')
          ..write('identityCode: $identityCode, ')
          ..write('formatCode: $formatCode, ')
          ..write('rotationCode: $rotationCode, ')
          ..write('mwlCode: $mwlCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('state: $state, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, identityCode, formatCode, rotationCode,
      mwlCode, name, description, created, updated, state, lastSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckData &&
          other.id == this.id &&
          other.identityCode == this.identityCode &&
          other.formatCode == this.formatCode &&
          other.rotationCode == this.rotationCode &&
          other.mwlCode == this.mwlCode &&
          other.name == this.name &&
          other.description == this.description &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.state == this.state &&
          other.lastSynced == this.lastSynced);
}

class DeckCompanion extends UpdateCompanion<DeckData> {
  final Value<String> id;
  final Value<String> identityCode;
  final Value<String?> formatCode;
  final Value<String?> rotationCode;
  final Value<String?> mwlCode;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> created;
  final Value<DateTime> updated;
  final Value<DeckState> state;
  final Value<DateTime?> lastSynced;
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
    this.state = const Value.absent(),
    this.lastSynced = const Value.absent(),
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
    required DeckState state,
    this.lastSynced = const Value.absent(),
  })  : id = Value(id),
        identityCode = Value(identityCode),
        name = Value(name),
        description = Value(description),
        created = Value(created),
        updated = Value(updated),
        state = Value(state);
  static Insertable<DeckData> custom({
    Expression<String>? id,
    Expression<String>? identityCode,
    Expression<String?>? formatCode,
    Expression<String?>? rotationCode,
    Expression<String?>? mwlCode,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<DeckState>? state,
    Expression<DateTime?>? lastSynced,
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
      if (state != null) 'state': state,
      if (lastSynced != null) 'last_synced': lastSynced,
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
      Value<DeckState>? state,
      Value<DateTime?>? lastSynced}) {
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
      state: state ?? this.state,
      lastSynced: lastSynced ?? this.lastSynced,
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
      map['format_code'] = Variable<String?>(formatCode.value);
    }
    if (rotationCode.present) {
      map['rotation_code'] = Variable<String?>(rotationCode.value);
    }
    if (mwlCode.present) {
      map['mwl_code'] = Variable<String?>(mwlCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (created.present) {
      final converter = Deck.$converter0;
      map['created'] = Variable<int>(converter.mapToSql(created.value)!);
    }
    if (updated.present) {
      final converter = Deck.$converter1;
      map['updated'] = Variable<int>(converter.mapToSql(updated.value)!);
    }
    if (state.present) {
      final converter = Deck.$converter2;
      map['state'] = Variable<String>(converter.mapToSql(state.value)!);
    }
    if (lastSynced.present) {
      final converter = Deck.$converter3;
      map['last_synced'] = Variable<int?>(converter.mapToSql(lastSynced.value));
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
          ..write('state: $state, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }
}

class Deck extends Table with TableInfo<Deck, DeckData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Deck(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _identityCodeMeta =
      const VerificationMeta('identityCode');
  late final GeneratedColumn<String?> identityCode = GeneratedColumn<String?>(
      'identity_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _formatCodeMeta = const VerificationMeta('formatCode');
  late final GeneratedColumn<String?> formatCode = GeneratedColumn<String?>(
      'format_code', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _rotationCodeMeta =
      const VerificationMeta('rotationCode');
  late final GeneratedColumn<String?> rotationCode = GeneratedColumn<String?>(
      'rotation_code', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _mwlCodeMeta = const VerificationMeta('mwlCode');
  late final GeneratedColumn<String?> mwlCode = GeneratedColumn<String?>(
      'mwl_code', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> created =
      GeneratedColumn<int?>('created', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Deck.$converter0);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> updated =
      GeneratedColumn<int?>('updated', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DateTime>(Deck.$converter1);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumnWithTypeConverter<DeckState, String?> state =
      GeneratedColumn<String?>('state', aliasedName, false,
              type: const StringType(),
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DeckState>(Deck.$converter2);
  final VerificationMeta _lastSyncedMeta = const VerificationMeta('lastSynced');
  late final GeneratedColumnWithTypeConverter<DateTime, int?> lastSynced =
      GeneratedColumn<int?>('last_synced', aliasedName, true,
              type: const IntType(),
              requiredDuringInsert: false,
              $customConstraints: '')
          .withConverter<DateTime>(Deck.$converter3);
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
        state,
        lastSynced
      ];
  @override
  String get aliasedName => _alias ?? 'deck';
  @override
  String get actualTableName => 'deck';
  @override
  VerificationContext validateIntegrity(Insertable<DeckData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('identity_code')) {
      context.handle(
          _identityCodeMeta,
          identityCode.isAcceptableOrUnknown(
              data['identity_code']!, _identityCodeMeta));
    } else if (isInserting) {
      context.missing(_identityCodeMeta);
    }
    if (data.containsKey('format_code')) {
      context.handle(
          _formatCodeMeta,
          formatCode.isAcceptableOrUnknown(
              data['format_code']!, _formatCodeMeta));
    }
    if (data.containsKey('rotation_code')) {
      context.handle(
          _rotationCodeMeta,
          rotationCode.isAcceptableOrUnknown(
              data['rotation_code']!, _rotationCodeMeta));
    }
    if (data.containsKey('mwl_code')) {
      context.handle(_mwlCodeMeta,
          mwlCode.isAcceptableOrUnknown(data['mwl_code']!, _mwlCodeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_createdMeta, const VerificationResult.success());
    context.handle(_updatedMeta, const VerificationResult.success());
    context.handle(_stateMeta, const VerificationResult.success());
    context.handle(_lastSyncedMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeckData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DeckData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Deck createAlias(String alias) {
    return Deck(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converter0 =
      const DateTimeUtcConverter();
  static TypeConverter<DateTime, int> $converter1 =
      const DateTimeUtcConverter();
  static TypeConverter<DeckState, String> $converter2 =
      const DeckStateConverter(DeckState.local);
  static TypeConverter<DateTime, int> $converter3 =
      const DateTimeUtcConverter();
  @override
  bool get dontWriteConstraints => true;
}

class DeckTagData extends DataClass implements Insertable<DeckTagData> {
  final String deckId;
  final String tag;
  DeckTagData({required this.deckId, required this.tag});
  factory DeckTagData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeckTagData(
      deckId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_id'])!,
      tag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['deck_id'] = Variable<String>(deckId);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  DeckTagCompanion toCompanion(bool nullToAbsent) {
    return DeckTagCompanion(
      deckId: Value(deckId),
      tag: Value(tag),
    );
  }

  factory DeckTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckTagData(
      deckId: serializer.fromJson<String>(json['deck_id']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'deck_id': serializer.toJson<String>(deckId),
      'tag': serializer.toJson<String>(tag),
    };
  }

  DeckTagData copyWith({String? deckId, String? tag}) => DeckTagData(
        deckId: deckId ?? this.deckId,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('DeckTagData(')
          ..write('deckId: $deckId, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(deckId, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckTagData &&
          other.deckId == this.deckId &&
          other.tag == this.tag);
}

class DeckTagCompanion extends UpdateCompanion<DeckTagData> {
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
  static Insertable<DeckTagData> custom({
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

class DeckTag extends Table with TableInfo<DeckTag, DeckTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckTag(this.attachedDatabase, [this._alias]);
  final VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  late final GeneratedColumn<String?> deckId = GeneratedColumn<String?>(
      'deck_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  late final GeneratedColumn<String?> tag = GeneratedColumn<String?>(
      'tag', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [deckId, tag];
  @override
  String get aliasedName => _alias ?? 'deck_tag';
  @override
  String get actualTableName => 'deck_tag';
  @override
  VerificationContext validateIntegrity(Insertable<DeckTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {deckId, tag};
  @override
  DeckTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DeckTagData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  DeckTag createAlias(String alias) {
    return DeckTag(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY (deck_id, tag)'];
  @override
  bool get dontWriteConstraints => true;
}

class DeckCardData extends DataClass implements Insertable<DeckCardData> {
  final String deckId;
  final String cardCode;
  final int quantity;
  DeckCardData(
      {required this.deckId, required this.cardCode, required this.quantity});
  factory DeckCardData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DeckCardData(
      deckId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_id'])!,
      cardCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_code'])!,
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['deck_id'] = Variable<String>(deckId);
    map['card_code'] = Variable<String>(cardCode);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  DeckCardCompanion toCompanion(bool nullToAbsent) {
    return DeckCardCompanion(
      deckId: Value(deckId),
      cardCode: Value(cardCode),
      quantity: Value(quantity),
    );
  }

  factory DeckCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeckCardData(
      deckId: serializer.fromJson<String>(json['deck_id']),
      cardCode: serializer.fromJson<String>(json['card_code']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'deck_id': serializer.toJson<String>(deckId),
      'card_code': serializer.toJson<String>(cardCode),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  DeckCardData copyWith({String? deckId, String? cardCode, int? quantity}) =>
      DeckCardData(
        deckId: deckId ?? this.deckId,
        cardCode: cardCode ?? this.cardCode,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('DeckCardData(')
          ..write('deckId: $deckId, ')
          ..write('cardCode: $cardCode, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(deckId, cardCode, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckCardData &&
          other.deckId == this.deckId &&
          other.cardCode == this.cardCode &&
          other.quantity == this.quantity);
}

class DeckCardCompanion extends UpdateCompanion<DeckCardData> {
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
  static Insertable<DeckCardData> custom({
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

class DeckCard extends Table with TableInfo<DeckCard, DeckCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckCard(this.attachedDatabase, [this._alias]);
  final VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  late final GeneratedColumn<String?> deckId = GeneratedColumn<String?>(
      'deck_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _cardCodeMeta = const VerificationMeta('cardCode');
  late final GeneratedColumn<String?> cardCode = GeneratedColumn<String?>(
      'card_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [deckId, cardCode, quantity];
  @override
  String get aliasedName => _alias ?? 'deck_card';
  @override
  String get actualTableName => 'deck_card';
  @override
  VerificationContext validateIntegrity(Insertable<DeckCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('card_code')) {
      context.handle(_cardCodeMeta,
          cardCode.isAcceptableOrUnknown(data['card_code']!, _cardCodeMeta));
    } else if (isInserting) {
      context.missing(_cardCodeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {deckId, cardCode};
  @override
  DeckCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DeckCardData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  DeckCard createAlias(String alias) {
    return DeckCard(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (deck_id, card_code)'];
  @override
  bool get dontWriteConstraints => true;
}

class CycleData extends DataClass implements Insertable<CycleData> {
  final String code;
  final int position;
  final String name;
  final int size;
  final bool rotated;
  CycleData(
      {required this.code,
      required this.position,
      required this.name,
      required this.size,
      required this.rotated});
  factory CycleData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CycleData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      size: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}size'])!,
      rotated: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rotated'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    map['size'] = Variable<int>(size);
    map['rotated'] = Variable<bool>(rotated);
    return map;
  }

  CycleCompanion toCompanion(bool nullToAbsent) {
    return CycleCompanion(
      code: Value(code),
      position: Value(position),
      name: Value(name),
      size: Value(size),
      rotated: Value(rotated),
    );
  }

  factory CycleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CycleData(
      code: serializer.fromJson<String>(json['code']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<int>(json['size']),
      rotated: serializer.fromJson<bool>(json['rotated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<int>(size),
      'rotated': serializer.toJson<bool>(rotated),
    };
  }

  CycleData copyWith(
          {String? code,
          int? position,
          String? name,
          int? size,
          bool? rotated}) =>
      CycleData(
        code: code ?? this.code,
        position: position ?? this.position,
        name: name ?? this.name,
        size: size ?? this.size,
        rotated: rotated ?? this.rotated,
      );
  @override
  String toString() {
    return (StringBuffer('CycleData(')
          ..write('code: $code, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('rotated: $rotated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, position, name, size, rotated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CycleData &&
          other.code == this.code &&
          other.position == this.position &&
          other.name == this.name &&
          other.size == this.size &&
          other.rotated == this.rotated);
}

class CycleCompanion extends UpdateCompanion<CycleData> {
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
  static Insertable<CycleData> custom({
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

class Cycle extends Table with TableInfo<Cycle, CycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cycle(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  late final GeneratedColumn<int?> size = GeneratedColumn<int?>(
      'size', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _rotatedMeta = const VerificationMeta('rotated');
  late final GeneratedColumn<bool?> rotated = GeneratedColumn<bool?>(
      'rotated', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [code, position, name, size, rotated];
  @override
  String get aliasedName => _alias ?? 'cycle';
  @override
  String get actualTableName => 'cycle';
  @override
  VerificationContext validateIntegrity(Insertable<CycleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('rotated')) {
      context.handle(_rotatedMeta,
          rotated.isAcceptableOrUnknown(data['rotated']!, _rotatedMeta));
    } else if (isInserting) {
      context.missing(_rotatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  CycleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CycleData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Cycle createAlias(String alias) {
    return Cycle(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CollectionData extends DataClass implements Insertable<CollectionData> {
  final String packCode;
  CollectionData({required this.packCode});
  factory CollectionData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CollectionData(
      packCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pack_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pack_code'] = Variable<String>(packCode);
    return map;
  }

  CollectionCompanion toCompanion(bool nullToAbsent) {
    return CollectionCompanion(
      packCode: Value(packCode),
    );
  }

  factory CollectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionData(
      packCode: serializer.fromJson<String>(json['pack_code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pack_code': serializer.toJson<String>(packCode),
    };
  }

  CollectionData copyWith({String? packCode}) => CollectionData(
        packCode: packCode ?? this.packCode,
      );
  @override
  String toString() {
    return (StringBuffer('CollectionData(')
          ..write('packCode: $packCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => packCode.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionData && other.packCode == this.packCode);
}

class CollectionCompanion extends UpdateCompanion<CollectionData> {
  final Value<String> packCode;
  const CollectionCompanion({
    this.packCode = const Value.absent(),
  });
  CollectionCompanion.insert({
    required String packCode,
  }) : packCode = Value(packCode);
  static Insertable<CollectionData> custom({
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

class Collection extends Table with TableInfo<Collection, CollectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Collection(this.attachedDatabase, [this._alias]);
  final VerificationMeta _packCodeMeta = const VerificationMeta('packCode');
  late final GeneratedColumn<String?> packCode = GeneratedColumn<String?>(
      'pack_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<GeneratedColumn> get $columns => [packCode];
  @override
  String get aliasedName => _alias ?? 'collection';
  @override
  String get actualTableName => 'collection';
  @override
  VerificationContext validateIntegrity(Insertable<CollectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pack_code')) {
      context.handle(_packCodeMeta,
          packCode.isAcceptableOrUnknown(data['pack_code']!, _packCodeMeta));
    } else if (isInserting) {
      context.missing(_packCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {packCode};
  @override
  CollectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CollectionData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Collection createAlias(String alias) {
    return Collection(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CardData extends DataClass implements Insertable<CardData> {
  final String code;
  final String packCode;
  final String factionCode;
  final String typeCode;
  final int position;
  final String title;
  final String strippedTitle;
  final String? body;
  final String? strippedBody;
  final String? keywords;
  final int quantity;
  final int? cost;
  final int deckLimit;
  final int factionCost;
  final bool uniqueness;
  final int? strength;
  final int? agendaPoints;
  final int? memoryCost;
  final int? advancementCost;
  final int? trashCost;
  final int? baseLink;
  final int? influenceLimit;
  final int? minimumDeckSize;
  final String? flavor;
  final String? illustrator;
  CardData(
      {required this.code,
      required this.packCode,
      required this.factionCode,
      required this.typeCode,
      required this.position,
      required this.title,
      required this.strippedTitle,
      this.body,
      this.strippedBody,
      this.keywords,
      required this.quantity,
      this.cost,
      required this.deckLimit,
      required this.factionCost,
      required this.uniqueness,
      this.strength,
      this.agendaPoints,
      this.memoryCost,
      this.advancementCost,
      this.trashCost,
      this.baseLink,
      this.influenceLimit,
      this.minimumDeckSize,
      this.flavor,
      this.illustrator});
  factory CardData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CardData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      packCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pack_code'])!,
      factionCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}faction_code'])!,
      typeCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type_code'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      strippedTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stripped_title'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body']),
      strippedBody: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stripped_body']),
      keywords: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}keywords']),
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      cost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cost']),
      deckLimit: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deck_limit'])!,
      factionCost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}faction_cost'])!,
      uniqueness: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uniqueness'])!,
      strength: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}strength']),
      agendaPoints: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}agenda_points']),
      memoryCost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}memory_cost']),
      advancementCost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}advancement_cost']),
      trashCost: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trash_cost']),
      baseLink: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}base_link']),
      influenceLimit: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}influence_limit']),
      minimumDeckSize: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}minimum_deck_size']),
      flavor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}flavor']),
      illustrator: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}illustrator']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['pack_code'] = Variable<String>(packCode);
    map['faction_code'] = Variable<String>(factionCode);
    map['type_code'] = Variable<String>(typeCode);
    map['position'] = Variable<int>(position);
    map['title'] = Variable<String>(title);
    map['stripped_title'] = Variable<String>(strippedTitle);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String?>(body);
    }
    if (!nullToAbsent || strippedBody != null) {
      map['stripped_body'] = Variable<String?>(strippedBody);
    }
    if (!nullToAbsent || keywords != null) {
      map['keywords'] = Variable<String?>(keywords);
    }
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<int?>(cost);
    }
    map['deck_limit'] = Variable<int>(deckLimit);
    map['faction_cost'] = Variable<int>(factionCost);
    map['uniqueness'] = Variable<bool>(uniqueness);
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<int?>(strength);
    }
    if (!nullToAbsent || agendaPoints != null) {
      map['agenda_points'] = Variable<int?>(agendaPoints);
    }
    if (!nullToAbsent || memoryCost != null) {
      map['memory_cost'] = Variable<int?>(memoryCost);
    }
    if (!nullToAbsent || advancementCost != null) {
      map['advancement_cost'] = Variable<int?>(advancementCost);
    }
    if (!nullToAbsent || trashCost != null) {
      map['trash_cost'] = Variable<int?>(trashCost);
    }
    if (!nullToAbsent || baseLink != null) {
      map['base_link'] = Variable<int?>(baseLink);
    }
    if (!nullToAbsent || influenceLimit != null) {
      map['influence_limit'] = Variable<int?>(influenceLimit);
    }
    if (!nullToAbsent || minimumDeckSize != null) {
      map['minimum_deck_size'] = Variable<int?>(minimumDeckSize);
    }
    if (!nullToAbsent || flavor != null) {
      map['flavor'] = Variable<String?>(flavor);
    }
    if (!nullToAbsent || illustrator != null) {
      map['illustrator'] = Variable<String?>(illustrator);
    }
    return map;
  }

  CardCompanion toCompanion(bool nullToAbsent) {
    return CardCompanion(
      code: Value(code),
      packCode: Value(packCode),
      factionCode: Value(factionCode),
      typeCode: Value(typeCode),
      position: Value(position),
      title: Value(title),
      strippedTitle: Value(strippedTitle),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      strippedBody: strippedBody == null && nullToAbsent
          ? const Value.absent()
          : Value(strippedBody),
      keywords: keywords == null && nullToAbsent
          ? const Value.absent()
          : Value(keywords),
      quantity: Value(quantity),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      deckLimit: Value(deckLimit),
      factionCost: Value(factionCost),
      uniqueness: Value(uniqueness),
      strength: strength == null && nullToAbsent
          ? const Value.absent()
          : Value(strength),
      agendaPoints: agendaPoints == null && nullToAbsent
          ? const Value.absent()
          : Value(agendaPoints),
      memoryCost: memoryCost == null && nullToAbsent
          ? const Value.absent()
          : Value(memoryCost),
      advancementCost: advancementCost == null && nullToAbsent
          ? const Value.absent()
          : Value(advancementCost),
      trashCost: trashCost == null && nullToAbsent
          ? const Value.absent()
          : Value(trashCost),
      baseLink: baseLink == null && nullToAbsent
          ? const Value.absent()
          : Value(baseLink),
      influenceLimit: influenceLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(influenceLimit),
      minimumDeckSize: minimumDeckSize == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumDeckSize),
      flavor:
          flavor == null && nullToAbsent ? const Value.absent() : Value(flavor),
      illustrator: illustrator == null && nullToAbsent
          ? const Value.absent()
          : Value(illustrator),
    );
  }

  factory CardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardData(
      code: serializer.fromJson<String>(json['code']),
      packCode: serializer.fromJson<String>(json['pack_code']),
      factionCode: serializer.fromJson<String>(json['faction_code']),
      typeCode: serializer.fromJson<String>(json['type_code']),
      position: serializer.fromJson<int>(json['position']),
      title: serializer.fromJson<String>(json['title']),
      strippedTitle: serializer.fromJson<String>(json['stripped_title']),
      body: serializer.fromJson<String?>(json['body']),
      strippedBody: serializer.fromJson<String?>(json['stripped_body']),
      keywords: serializer.fromJson<String?>(json['keywords']),
      quantity: serializer.fromJson<int>(json['quantity']),
      cost: serializer.fromJson<int?>(json['cost']),
      deckLimit: serializer.fromJson<int>(json['deck_limit']),
      factionCost: serializer.fromJson<int>(json['faction_cost']),
      uniqueness: serializer.fromJson<bool>(json['uniqueness']),
      strength: serializer.fromJson<int?>(json['strength']),
      agendaPoints: serializer.fromJson<int?>(json['agenda_points']),
      memoryCost: serializer.fromJson<int?>(json['memory_cost']),
      advancementCost: serializer.fromJson<int?>(json['advancement_cost']),
      trashCost: serializer.fromJson<int?>(json['trash_cost']),
      baseLink: serializer.fromJson<int?>(json['base_link']),
      influenceLimit: serializer.fromJson<int?>(json['influence_limit']),
      minimumDeckSize: serializer.fromJson<int?>(json['minimum_deck_size']),
      flavor: serializer.fromJson<String?>(json['flavor']),
      illustrator: serializer.fromJson<String?>(json['illustrator']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'pack_code': serializer.toJson<String>(packCode),
      'faction_code': serializer.toJson<String>(factionCode),
      'type_code': serializer.toJson<String>(typeCode),
      'position': serializer.toJson<int>(position),
      'title': serializer.toJson<String>(title),
      'stripped_title': serializer.toJson<String>(strippedTitle),
      'body': serializer.toJson<String?>(body),
      'stripped_body': serializer.toJson<String?>(strippedBody),
      'keywords': serializer.toJson<String?>(keywords),
      'quantity': serializer.toJson<int>(quantity),
      'cost': serializer.toJson<int?>(cost),
      'deck_limit': serializer.toJson<int>(deckLimit),
      'faction_cost': serializer.toJson<int>(factionCost),
      'uniqueness': serializer.toJson<bool>(uniqueness),
      'strength': serializer.toJson<int?>(strength),
      'agenda_points': serializer.toJson<int?>(agendaPoints),
      'memory_cost': serializer.toJson<int?>(memoryCost),
      'advancement_cost': serializer.toJson<int?>(advancementCost),
      'trash_cost': serializer.toJson<int?>(trashCost),
      'base_link': serializer.toJson<int?>(baseLink),
      'influence_limit': serializer.toJson<int?>(influenceLimit),
      'minimum_deck_size': serializer.toJson<int?>(minimumDeckSize),
      'flavor': serializer.toJson<String?>(flavor),
      'illustrator': serializer.toJson<String?>(illustrator),
    };
  }

  CardData copyWith(
          {String? code,
          String? packCode,
          String? factionCode,
          String? typeCode,
          int? position,
          String? title,
          String? strippedTitle,
          Value<String?> body = const Value.absent(),
          Value<String?> strippedBody = const Value.absent(),
          Value<String?> keywords = const Value.absent(),
          int? quantity,
          Value<int?> cost = const Value.absent(),
          int? deckLimit,
          int? factionCost,
          bool? uniqueness,
          Value<int?> strength = const Value.absent(),
          Value<int?> agendaPoints = const Value.absent(),
          Value<int?> memoryCost = const Value.absent(),
          Value<int?> advancementCost = const Value.absent(),
          Value<int?> trashCost = const Value.absent(),
          Value<int?> baseLink = const Value.absent(),
          Value<int?> influenceLimit = const Value.absent(),
          Value<int?> minimumDeckSize = const Value.absent(),
          Value<String?> flavor = const Value.absent(),
          Value<String?> illustrator = const Value.absent()}) =>
      CardData(
        code: code ?? this.code,
        packCode: packCode ?? this.packCode,
        factionCode: factionCode ?? this.factionCode,
        typeCode: typeCode ?? this.typeCode,
        position: position ?? this.position,
        title: title ?? this.title,
        strippedTitle: strippedTitle ?? this.strippedTitle,
        body: body.present ? body.value : this.body,
        strippedBody:
            strippedBody.present ? strippedBody.value : this.strippedBody,
        keywords: keywords.present ? keywords.value : this.keywords,
        quantity: quantity ?? this.quantity,
        cost: cost.present ? cost.value : this.cost,
        deckLimit: deckLimit ?? this.deckLimit,
        factionCost: factionCost ?? this.factionCost,
        uniqueness: uniqueness ?? this.uniqueness,
        strength: strength.present ? strength.value : this.strength,
        agendaPoints:
            agendaPoints.present ? agendaPoints.value : this.agendaPoints,
        memoryCost: memoryCost.present ? memoryCost.value : this.memoryCost,
        advancementCost: advancementCost.present
            ? advancementCost.value
            : this.advancementCost,
        trashCost: trashCost.present ? trashCost.value : this.trashCost,
        baseLink: baseLink.present ? baseLink.value : this.baseLink,
        influenceLimit:
            influenceLimit.present ? influenceLimit.value : this.influenceLimit,
        minimumDeckSize: minimumDeckSize.present
            ? minimumDeckSize.value
            : this.minimumDeckSize,
        flavor: flavor.present ? flavor.value : this.flavor,
        illustrator: illustrator.present ? illustrator.value : this.illustrator,
      );
  @override
  String toString() {
    return (StringBuffer('CardData(')
          ..write('code: $code, ')
          ..write('packCode: $packCode, ')
          ..write('factionCode: $factionCode, ')
          ..write('typeCode: $typeCode, ')
          ..write('position: $position, ')
          ..write('title: $title, ')
          ..write('strippedTitle: $strippedTitle, ')
          ..write('body: $body, ')
          ..write('strippedBody: $strippedBody, ')
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
          ..write('illustrator: $illustrator')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        code,
        packCode,
        factionCode,
        typeCode,
        position,
        title,
        strippedTitle,
        body,
        strippedBody,
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
        illustrator
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardData &&
          other.code == this.code &&
          other.packCode == this.packCode &&
          other.factionCode == this.factionCode &&
          other.typeCode == this.typeCode &&
          other.position == this.position &&
          other.title == this.title &&
          other.strippedTitle == this.strippedTitle &&
          other.body == this.body &&
          other.strippedBody == this.strippedBody &&
          other.keywords == this.keywords &&
          other.quantity == this.quantity &&
          other.cost == this.cost &&
          other.deckLimit == this.deckLimit &&
          other.factionCost == this.factionCost &&
          other.uniqueness == this.uniqueness &&
          other.strength == this.strength &&
          other.agendaPoints == this.agendaPoints &&
          other.memoryCost == this.memoryCost &&
          other.advancementCost == this.advancementCost &&
          other.trashCost == this.trashCost &&
          other.baseLink == this.baseLink &&
          other.influenceLimit == this.influenceLimit &&
          other.minimumDeckSize == this.minimumDeckSize &&
          other.flavor == this.flavor &&
          other.illustrator == this.illustrator);
}

class CardCompanion extends UpdateCompanion<CardData> {
  final Value<String> code;
  final Value<String> packCode;
  final Value<String> factionCode;
  final Value<String> typeCode;
  final Value<int> position;
  final Value<String> title;
  final Value<String> strippedTitle;
  final Value<String?> body;
  final Value<String?> strippedBody;
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
  const CardCompanion({
    this.code = const Value.absent(),
    this.packCode = const Value.absent(),
    this.factionCode = const Value.absent(),
    this.typeCode = const Value.absent(),
    this.position = const Value.absent(),
    this.title = const Value.absent(),
    this.strippedTitle = const Value.absent(),
    this.body = const Value.absent(),
    this.strippedBody = const Value.absent(),
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
  });
  CardCompanion.insert({
    required String code,
    required String packCode,
    required String factionCode,
    required String typeCode,
    required int position,
    required String title,
    required String strippedTitle,
    this.body = const Value.absent(),
    this.strippedBody = const Value.absent(),
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
  })  : code = Value(code),
        packCode = Value(packCode),
        factionCode = Value(factionCode),
        typeCode = Value(typeCode),
        position = Value(position),
        title = Value(title),
        strippedTitle = Value(strippedTitle),
        quantity = Value(quantity),
        deckLimit = Value(deckLimit),
        factionCost = Value(factionCost),
        uniqueness = Value(uniqueness);
  static Insertable<CardData> custom({
    Expression<String>? code,
    Expression<String>? packCode,
    Expression<String>? factionCode,
    Expression<String>? typeCode,
    Expression<int>? position,
    Expression<String>? title,
    Expression<String>? strippedTitle,
    Expression<String?>? body,
    Expression<String?>? strippedBody,
    Expression<String?>? keywords,
    Expression<int>? quantity,
    Expression<int?>? cost,
    Expression<int>? deckLimit,
    Expression<int>? factionCost,
    Expression<bool>? uniqueness,
    Expression<int?>? strength,
    Expression<int?>? agendaPoints,
    Expression<int?>? memoryCost,
    Expression<int?>? advancementCost,
    Expression<int?>? trashCost,
    Expression<int?>? baseLink,
    Expression<int?>? influenceLimit,
    Expression<int?>? minimumDeckSize,
    Expression<String?>? flavor,
    Expression<String?>? illustrator,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (packCode != null) 'pack_code': packCode,
      if (factionCode != null) 'faction_code': factionCode,
      if (typeCode != null) 'type_code': typeCode,
      if (position != null) 'position': position,
      if (title != null) 'title': title,
      if (strippedTitle != null) 'stripped_title': strippedTitle,
      if (body != null) 'body': body,
      if (strippedBody != null) 'stripped_body': strippedBody,
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
    });
  }

  CardCompanion copyWith(
      {Value<String>? code,
      Value<String>? packCode,
      Value<String>? factionCode,
      Value<String>? typeCode,
      Value<int>? position,
      Value<String>? title,
      Value<String>? strippedTitle,
      Value<String?>? body,
      Value<String?>? strippedBody,
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
      Value<String?>? illustrator}) {
    return CardCompanion(
      code: code ?? this.code,
      packCode: packCode ?? this.packCode,
      factionCode: factionCode ?? this.factionCode,
      typeCode: typeCode ?? this.typeCode,
      position: position ?? this.position,
      title: title ?? this.title,
      strippedTitle: strippedTitle ?? this.strippedTitle,
      body: body ?? this.body,
      strippedBody: strippedBody ?? this.strippedBody,
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
    if (strippedTitle.present) {
      map['stripped_title'] = Variable<String>(strippedTitle.value);
    }
    if (body.present) {
      map['body'] = Variable<String?>(body.value);
    }
    if (strippedBody.present) {
      map['stripped_body'] = Variable<String?>(strippedBody.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String?>(keywords.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int?>(cost.value);
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
      map['strength'] = Variable<int?>(strength.value);
    }
    if (agendaPoints.present) {
      map['agenda_points'] = Variable<int?>(agendaPoints.value);
    }
    if (memoryCost.present) {
      map['memory_cost'] = Variable<int?>(memoryCost.value);
    }
    if (advancementCost.present) {
      map['advancement_cost'] = Variable<int?>(advancementCost.value);
    }
    if (trashCost.present) {
      map['trash_cost'] = Variable<int?>(trashCost.value);
    }
    if (baseLink.present) {
      map['base_link'] = Variable<int?>(baseLink.value);
    }
    if (influenceLimit.present) {
      map['influence_limit'] = Variable<int?>(influenceLimit.value);
    }
    if (minimumDeckSize.present) {
      map['minimum_deck_size'] = Variable<int?>(minimumDeckSize.value);
    }
    if (flavor.present) {
      map['flavor'] = Variable<String?>(flavor.value);
    }
    if (illustrator.present) {
      map['illustrator'] = Variable<String?>(illustrator.value);
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
          ..write('strippedTitle: $strippedTitle, ')
          ..write('body: $body, ')
          ..write('strippedBody: $strippedBody, ')
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
          ..write('illustrator: $illustrator')
          ..write(')'))
        .toString();
  }
}

class Card extends Table with TableInfo<Card, CardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Card(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  final VerificationMeta _packCodeMeta = const VerificationMeta('packCode');
  late final GeneratedColumn<String?> packCode = GeneratedColumn<String?>(
      'pack_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _factionCodeMeta =
      const VerificationMeta('factionCode');
  late final GeneratedColumn<String?> factionCode = GeneratedColumn<String?>(
      'faction_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _typeCodeMeta = const VerificationMeta('typeCode');
  late final GeneratedColumn<String?> typeCode = GeneratedColumn<String?>(
      'type_code', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _strippedTitleMeta =
      const VerificationMeta('strippedTitle');
  late final GeneratedColumn<String?> strippedTitle = GeneratedColumn<String?>(
      'stripped_title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _strippedBodyMeta =
      const VerificationMeta('strippedBody');
  late final GeneratedColumn<String?> strippedBody = GeneratedColumn<String?>(
      'stripped_body', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _keywordsMeta = const VerificationMeta('keywords');
  late final GeneratedColumn<String?> keywords = GeneratedColumn<String?>(
      'keywords', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _costMeta = const VerificationMeta('cost');
  late final GeneratedColumn<int?> cost = GeneratedColumn<int?>(
      'cost', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _deckLimitMeta = const VerificationMeta('deckLimit');
  late final GeneratedColumn<int?> deckLimit = GeneratedColumn<int?>(
      'deck_limit', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _factionCostMeta =
      const VerificationMeta('factionCost');
  late final GeneratedColumn<int?> factionCost = GeneratedColumn<int?>(
      'faction_cost', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _uniquenessMeta = const VerificationMeta('uniqueness');
  late final GeneratedColumn<bool?> uniqueness = GeneratedColumn<bool?>(
      'uniqueness', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _strengthMeta = const VerificationMeta('strength');
  late final GeneratedColumn<int?> strength = GeneratedColumn<int?>(
      'strength', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _agendaPointsMeta =
      const VerificationMeta('agendaPoints');
  late final GeneratedColumn<int?> agendaPoints = GeneratedColumn<int?>(
      'agenda_points', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _memoryCostMeta = const VerificationMeta('memoryCost');
  late final GeneratedColumn<int?> memoryCost = GeneratedColumn<int?>(
      'memory_cost', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _advancementCostMeta =
      const VerificationMeta('advancementCost');
  late final GeneratedColumn<int?> advancementCost = GeneratedColumn<int?>(
      'advancement_cost', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _trashCostMeta = const VerificationMeta('trashCost');
  late final GeneratedColumn<int?> trashCost = GeneratedColumn<int?>(
      'trash_cost', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _baseLinkMeta = const VerificationMeta('baseLink');
  late final GeneratedColumn<int?> baseLink = GeneratedColumn<int?>(
      'base_link', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _influenceLimitMeta =
      const VerificationMeta('influenceLimit');
  late final GeneratedColumn<int?> influenceLimit = GeneratedColumn<int?>(
      'influence_limit', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _minimumDeckSizeMeta =
      const VerificationMeta('minimumDeckSize');
  late final GeneratedColumn<int?> minimumDeckSize = GeneratedColumn<int?>(
      'minimum_deck_size', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _flavorMeta = const VerificationMeta('flavor');
  late final GeneratedColumn<String?> flavor = GeneratedColumn<String?>(
      'flavor', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _illustratorMeta =
      const VerificationMeta('illustrator');
  late final GeneratedColumn<String?> illustrator = GeneratedColumn<String?>(
      'illustrator', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        code,
        packCode,
        factionCode,
        typeCode,
        position,
        title,
        strippedTitle,
        body,
        strippedBody,
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
        illustrator
      ];
  @override
  String get aliasedName => _alias ?? 'card';
  @override
  String get actualTableName => 'card';
  @override
  VerificationContext validateIntegrity(Insertable<CardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('pack_code')) {
      context.handle(_packCodeMeta,
          packCode.isAcceptableOrUnknown(data['pack_code']!, _packCodeMeta));
    } else if (isInserting) {
      context.missing(_packCodeMeta);
    }
    if (data.containsKey('faction_code')) {
      context.handle(
          _factionCodeMeta,
          factionCode.isAcceptableOrUnknown(
              data['faction_code']!, _factionCodeMeta));
    } else if (isInserting) {
      context.missing(_factionCodeMeta);
    }
    if (data.containsKey('type_code')) {
      context.handle(_typeCodeMeta,
          typeCode.isAcceptableOrUnknown(data['type_code']!, _typeCodeMeta));
    } else if (isInserting) {
      context.missing(_typeCodeMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('stripped_title')) {
      context.handle(
          _strippedTitleMeta,
          strippedTitle.isAcceptableOrUnknown(
              data['stripped_title']!, _strippedTitleMeta));
    } else if (isInserting) {
      context.missing(_strippedTitleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('stripped_body')) {
      context.handle(
          _strippedBodyMeta,
          strippedBody.isAcceptableOrUnknown(
              data['stripped_body']!, _strippedBodyMeta));
    }
    if (data.containsKey('keywords')) {
      context.handle(_keywordsMeta,
          keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('deck_limit')) {
      context.handle(_deckLimitMeta,
          deckLimit.isAcceptableOrUnknown(data['deck_limit']!, _deckLimitMeta));
    } else if (isInserting) {
      context.missing(_deckLimitMeta);
    }
    if (data.containsKey('faction_cost')) {
      context.handle(
          _factionCostMeta,
          factionCost.isAcceptableOrUnknown(
              data['faction_cost']!, _factionCostMeta));
    } else if (isInserting) {
      context.missing(_factionCostMeta);
    }
    if (data.containsKey('uniqueness')) {
      context.handle(
          _uniquenessMeta,
          uniqueness.isAcceptableOrUnknown(
              data['uniqueness']!, _uniquenessMeta));
    } else if (isInserting) {
      context.missing(_uniquenessMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    }
    if (data.containsKey('agenda_points')) {
      context.handle(
          _agendaPointsMeta,
          agendaPoints.isAcceptableOrUnknown(
              data['agenda_points']!, _agendaPointsMeta));
    }
    if (data.containsKey('memory_cost')) {
      context.handle(
          _memoryCostMeta,
          memoryCost.isAcceptableOrUnknown(
              data['memory_cost']!, _memoryCostMeta));
    }
    if (data.containsKey('advancement_cost')) {
      context.handle(
          _advancementCostMeta,
          advancementCost.isAcceptableOrUnknown(
              data['advancement_cost']!, _advancementCostMeta));
    }
    if (data.containsKey('trash_cost')) {
      context.handle(_trashCostMeta,
          trashCost.isAcceptableOrUnknown(data['trash_cost']!, _trashCostMeta));
    }
    if (data.containsKey('base_link')) {
      context.handle(_baseLinkMeta,
          baseLink.isAcceptableOrUnknown(data['base_link']!, _baseLinkMeta));
    }
    if (data.containsKey('influence_limit')) {
      context.handle(
          _influenceLimitMeta,
          influenceLimit.isAcceptableOrUnknown(
              data['influence_limit']!, _influenceLimitMeta));
    }
    if (data.containsKey('minimum_deck_size')) {
      context.handle(
          _minimumDeckSizeMeta,
          minimumDeckSize.isAcceptableOrUnknown(
              data['minimum_deck_size']!, _minimumDeckSizeMeta));
    }
    if (data.containsKey('flavor')) {
      context.handle(_flavorMeta,
          flavor.isAcceptableOrUnknown(data['flavor']!, _flavorMeta));
    }
    if (data.containsKey('illustrator')) {
      context.handle(
          _illustratorMeta,
          illustrator.isAcceptableOrUnknown(
              data['illustrator']!, _illustratorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  CardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CardData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Card createAlias(String alias) {
    return Card(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Type type = Type(this);
  late final Side side = Side(this);
  late final Settings settings = Settings(this);
  late final Rotation rotation = Rotation(this);
  late final RotationCycle rotationCycle = RotationCycle(this);
  late final Pack pack = Pack(this);
  late final Nrdb nrdb = Nrdb(this);
  late final Mwl mwl = Mwl(this);
  late final MwlCard mwlCard = MwlCard(this);
  late final Format format = Format(this);
  late final Faction faction = Faction(this);
  late final Deck deck = Deck(this);
  late final DeckTag deckTag = DeckTag(this);
  late final DeckCard deckCard = DeckCard(this);
  late final Cycle cycle = Cycle(this);
  late final Collection collection = Collection(this);
  late final Card card = Card(this);
  Selectable<TypeResult> listTypes(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "type"."code" AS "nested_0.code", "type"."side_code" AS "nested_0.side_code", "type"."position" AS "nested_0.position", "type"."name" AS "nested_0.name", "type"."is_subtype" AS "nested_0.is_subtype",\n  "side"."code" AS "nested_1.code", "side"."name" AS "nested_1.name"\nFROM type\n\nLEFT JOIN side\n  ON side.code = type.side_code\n\nWHERE ${generatedwhere.sql}\n  \nORDER BY type.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          type,
          side,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return TypeResult(
        type: type.mapFromRow(row, tablePrefix: 'nested_0'),
        side: side.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
      );
    });
  }

  Selectable<SideData> listSides(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where);
    return customSelect('SELECT *\nFROM side\nWHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          side,
          ...generatedwhere.watchedTables,
        }).map(side.mapFromRow);
  }

  Selectable<SettingResult> getSettings() {
    return customSelect(
        'SELECT\n  "settings"."id" AS "nested_0.id", "settings"."filter_format_code" AS "nested_0.filter_format_code", "settings"."filter_rotation_code" AS "nested_0.filter_rotation_code", "settings"."filter_mwl_code" AS "nested_0.filter_mwl_code", "settings"."filter_collection" AS "nested_0.filter_collection", "settings"."card_sort" AS "nested_0.card_sort", "settings"."card_group" AS "nested_0.card_group", "settings"."deck_sort" AS "nested_0.deck_sort", "settings"."deck_group" AS "nested_0.deck_group", "settings"."deck_card_sort" AS "nested_0.deck_card_sort", "settings"."deck_card_group" AS "nested_0.deck_card_group", "settings"."apex_resources" AS "nested_0.apex_resources",\n  "filter_format"."id" AS "nested_1.id", "filter_format"."code" AS "nested_1.code", "filter_format"."name" AS "nested_1.name",\n  "filter_rotation"."code" AS "nested_2.code", "filter_rotation"."format_code" AS "nested_2.format_code", "filter_rotation"."name" AS "nested_2.name", "filter_rotation"."date_start" AS "nested_2.date_start", "filter_rotation"."current" AS "nested_2.current", "filter_rotation"."latest" AS "nested_2.latest",\n  "filter_mwl"."code" AS "nested_3.code", "filter_mwl"."format_code" AS "nested_3.format_code", "filter_mwl"."name" AS "nested_3.name", "filter_mwl"."date_start" AS "nested_3.date_start", "filter_mwl"."active" AS "nested_3.active", "filter_mwl"."latest" AS "nested_3.latest"\nFROM settings\n\nLEFT JOIN format AS filter_format\n  ON filter_format.code = settings.filter_format_code\n\nLEFT JOIN rotation AS filter_rotation\n  ON filter_rotation.code = settings.filter_rotation_code\n\nLEFT JOIN mwl AS filter_mwl\n  ON filter_mwl.code = settings.filter_mwl_code\n\nLIMIT 1',
        variables: [],
        readsFrom: {
          settings,
          format,
          rotation,
          mwl,
        }).map((QueryRow row) {
      return SettingResult(
        settings: settings.mapFromRow(row, tablePrefix: 'nested_0'),
        filterFormat: format.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
        filterRotation: rotation.mapFromRowOrNull(row, tablePrefix: 'nested_2'),
        filterMwl: mwl.mapFromRowOrNull(row, tablePrefix: 'nested_3'),
      );
    });
  }

  Selectable<RotationData> listRotations(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  rotation.*\n\nFROM rotation\n\nINNER JOIN format\n  ON format.code = rotation.format_code\n\nWHERE ${generatedwhere.sql}\n\nORDER BY\n  format.id,\n  rotation.latest,\n  rotation.current,\n  rotation.date_start DESC',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          rotation,
          format,
          ...generatedwhere.watchedTables,
        }).map(rotation.mapFromRow);
  }

  Selectable<RotationPackResult> listRotationPacks(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name",\n  "rotation"."code" AS "nested_1.code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."current" AS "nested_1.current", "rotation"."latest" AS "nested_1.latest",\n  "pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size",\n  "cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated"\nFROM rotation\n\nINNER JOIN format\n  ON format.code = rotation.format_code\n\nLEFT JOIN rotation_cycle\n  ON rotation_cycle.rotation_code = rotation.code\n\nINNER JOIN cycle\n  ON cycle.code = rotation_cycle.cycle_code\n\nINNER JOIN pack\n  ON pack.cycle_code = cycle.code\n\nWHERE ${generatedwhere.sql}\n\nORDER BY\n  format.id,\n  rotation.latest,\n  rotation.current,\n  rotation.date_start DESC,\n  cycle.position DESC,\n  pack.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          rotation,
          format,
          rotationCycle,
          cycle,
          pack,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return RotationPackResult(
        format: format.mapFromRow(row, tablePrefix: 'nested_0'),
        rotation: rotation.mapFromRow(row, tablePrefix: 'nested_1'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_2'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_3'),
      );
    });
  }

  Selectable<FormatPackResult> listDefaultFormatPacks() {
    return customSelect(
        'SELECT\n  "format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name",\n  "rotation"."code" AS "nested_1.code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."current" AS "nested_1.current", "rotation"."latest" AS "nested_1.latest",\n  "pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size",\n  "cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated"\nFROM settings\n\nINNER JOIN format\n  ON format.code = settings.filter_format_code\n\nINNER JOIN rotation\n  ON rotation.format_code = format.code\n  AND rotation.current\n\nLEFT JOIN rotation_cycle\n  ON rotation_cycle.rotation_code = rotation.code\n\nINNER JOIN cycle\n  ON cycle.code = rotation_cycle.cycle_code\n\nINNER JOIN pack\n  ON pack.cycle_code = cycle.code\n\nORDER BY\n  cycle.position DESC,\n  pack.position',
        variables: [],
        readsFrom: {
          settings,
          format,
          rotation,
          rotationCycle,
          cycle,
          pack,
        }).map((QueryRow row) {
      return FormatPackResult(
        format: format.mapFromRow(row, tablePrefix: 'nested_0'),
        rotation: rotation.mapFromRow(row, tablePrefix: 'nested_1'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_2'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_3'),
      );
    });
  }

  Selectable<RotationCardResult> listRotationCards(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name",\n  "rotation"."code" AS "nested_1.code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."current" AS "nested_1.current", "rotation"."latest" AS "nested_1.latest",\n  "pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size",\n  "cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated",\n  "card"."code" AS "nested_4.code", "card"."pack_code" AS "nested_4.pack_code", "card"."faction_code" AS "nested_4.faction_code", "card"."type_code" AS "nested_4.type_code", "card"."position" AS "nested_4.position", "card"."title" AS "nested_4.title", "card"."stripped_title" AS "nested_4.stripped_title", "card"."body" AS "nested_4.body", "card"."stripped_body" AS "nested_4.stripped_body", "card"."keywords" AS "nested_4.keywords", "card"."quantity" AS "nested_4.quantity", "card"."cost" AS "nested_4.cost", "card"."deck_limit" AS "nested_4.deck_limit", "card"."faction_cost" AS "nested_4.faction_cost", "card"."uniqueness" AS "nested_4.uniqueness", "card"."strength" AS "nested_4.strength", "card"."agenda_points" AS "nested_4.agenda_points", "card"."memory_cost" AS "nested_4.memory_cost", "card"."advancement_cost" AS "nested_4.advancement_cost", "card"."trash_cost" AS "nested_4.trash_cost", "card"."base_link" AS "nested_4.base_link", "card"."influence_limit" AS "nested_4.influence_limit", "card"."minimum_deck_size" AS "nested_4.minimum_deck_size", "card"."flavor" AS "nested_4.flavor", "card"."illustrator" AS "nested_4.illustrator"\nFROM rotation\n\nINNER JOIN format\n  ON format.code = rotation.format_code\n\nLEFT JOIN rotation_cycle\n  ON rotation_cycle.rotation_code = rotation.code\n\nINNER JOIN cycle\n  ON cycle.code = rotation_cycle.cycle_code\n\nINNER JOIN pack\n  ON pack.cycle_code = cycle.code\n\nINNER JOIN card\n  ON card.pack_code = pack.code\n\nWHERE ${generatedwhere.sql}\n\nORDER BY\n  rotation.date_start DESC,\n  cycle.position DESC,\n  pack.position,\n  card.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          rotation,
          format,
          rotationCycle,
          cycle,
          pack,
          card,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return RotationCardResult(
        format: format.mapFromRow(row, tablePrefix: 'nested_0'),
        rotation: rotation.mapFromRow(row, tablePrefix: 'nested_1'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_2'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_3'),
        card: card.mapFromRow(row, tablePrefix: 'nested_4'),
      );
    });
  }

  Selectable<CountStuffResult> countStuff(
      {Expression<bool?> cards = const CustomExpression('(TRUE)'),
      Expression<bool?> cycles = const CustomExpression('(TRUE)'),
      Expression<bool?> packs = const CustomExpression('(TRUE)'),
      Expression<bool?> sides = const CustomExpression('(TRUE)'),
      Expression<bool?> factions = const CustomExpression('(TRUE)'),
      Expression<bool?> types = const CustomExpression('(TRUE)')}) {
    final generatedcards = $write(cards, hasMultipleTables: true);
    final generatedcycles = $write(cycles, hasMultipleTables: true);
    final generatedpacks = $write(packs, hasMultipleTables: true);
    final generatedsides = $write(sides, hasMultipleTables: true);
    final generatedfactions = $write(factions, hasMultipleTables: true);
    final generatedtypes = $write(types, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  (SELECT COUNT(*) FROM card WHERE ${generatedcards.sql}) AS card_count,\n  (SELECT COUNT(*) FROM cycle WHERE ${generatedcycles.sql}) AS cycle_count,\n  (SELECT COUNT(*) FROM pack WHERE ${generatedpacks.sql}) AS pack_count,\n  (SELECT COUNT(*) FROM side WHERE ${generatedsides.sql}) AS side_count,\n  (SELECT COUNT(*) FROM faction INNER JOIN side ON side.code = faction.side_code WHERE ${generatedfactions.sql}) AS faction_count,\n  (SELECT COUNT(*) FROM type INNER JOIN side ON side.code = type.side_code WHERE ${generatedtypes.sql}) AS type_count',
        variables: [
          ...generatedcards.introducedVariables,
          ...generatedcycles.introducedVariables,
          ...generatedpacks.introducedVariables,
          ...generatedsides.introducedVariables,
          ...generatedfactions.introducedVariables,
          ...generatedtypes.introducedVariables
        ],
        readsFrom: {
          card,
          cycle,
          pack,
          side,
          faction,
          type,
          ...generatedcards.watchedTables,
          ...generatedcycles.watchedTables,
          ...generatedpacks.watchedTables,
          ...generatedsides.watchedTables,
          ...generatedfactions.watchedTables,
          ...generatedtypes.watchedTables,
        }).map((QueryRow row) {
      return CountStuffResult(
        cardCount: row.read<int>('card_count'),
        cycleCount: row.read<int>('cycle_count'),
        packCount: row.read<int>('pack_count'),
        sideCount: row.read<int>('side_count'),
        factionCount: row.read<int>('faction_count'),
        typeCount: row.read<int>('type_count'),
      );
    });
  }

  Selectable<PackResult> listPacks(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "pack"."code" AS "nested_0.code", "pack"."cycle_code" AS "nested_0.cycle_code", "pack"."position" AS "nested_0.position", "pack"."name" AS "nested_0.name", "pack"."date_release" AS "nested_0.date_release", "pack"."size" AS "nested_0.size",\n  "cycle"."code" AS "nested_1.code", "cycle"."position" AS "nested_1.position", "cycle"."name" AS "nested_1.name", "cycle"."size" AS "nested_1.size", "cycle"."rotated" AS "nested_1.rotated"\nFROM pack\n\nINNER JOIN cycle\n  ON cycle.code = pack.cycle_code\n\nWHERE ${generatedwhere.sql}\n\nORDER BY cycle.position DESC, pack.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          pack,
          cycle,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return PackResult(
        pack: pack.mapFromRow(row, tablePrefix: 'nested_0'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_1'),
      );
    });
  }

  Selectable<NrdbData> getNrdb() {
    return customSelect('SELECT *\nFROM nrdb', variables: [], readsFrom: {
      nrdb,
    }).map(nrdb.mapFromRow);
  }

  Selectable<MwlData> listMwl(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  mwl.*\nFROM mwl\n\nINNER JOIN format\n  ON format.code = mwl.format_code\n\nWHERE ${generatedwhere.sql}\n\nORDER BY\n  format.id,\n  mwl.latest,\n  mwl.active,\n  mwl.date_start DESC',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          mwl,
          format,
          ...generatedwhere.watchedTables,
        }).map(mwl.mapFromRow);
  }

  Selectable<FormatResult> listFormats(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name",\n  "current_rotation"."code" AS "nested_1.code", "current_rotation"."format_code" AS "nested_1.format_code", "current_rotation"."name" AS "nested_1.name", "current_rotation"."date_start" AS "nested_1.date_start", "current_rotation"."current" AS "nested_1.current", "current_rotation"."latest" AS "nested_1.latest",\n  "latest_rotation"."code" AS "nested_2.code", "latest_rotation"."format_code" AS "nested_2.format_code", "latest_rotation"."name" AS "nested_2.name", "latest_rotation"."date_start" AS "nested_2.date_start", "latest_rotation"."current" AS "nested_2.current", "latest_rotation"."latest" AS "nested_2.latest",\n  "active_mwl"."code" AS "nested_3.code", "active_mwl"."format_code" AS "nested_3.format_code", "active_mwl"."name" AS "nested_3.name", "active_mwl"."date_start" AS "nested_3.date_start", "active_mwl"."active" AS "nested_3.active", "active_mwl"."latest" AS "nested_3.latest",\n  "latest_mwl"."code" AS "nested_4.code", "latest_mwl"."format_code" AS "nested_4.format_code", "latest_mwl"."name" AS "nested_4.name", "latest_mwl"."date_start" AS "nested_4.date_start", "latest_mwl"."active" AS "nested_4.active", "latest_mwl"."latest" AS "nested_4.latest"\nFROM format\n\nLEFT JOIN rotation AS current_rotation\n  ON current_rotation.format_code = format.code\n  AND current_rotation."current"\n\nLEFT JOIN rotation AS latest_rotation\n  ON latest_rotation.format_code = format.code\n  AND latest_rotation.latest\n\nLEFT JOIN mwl AS active_mwl\n  ON active_mwl.format_code = format.code\n  AND active_mwl.active\n\nLEFT JOIN mwl AS latest_mwl\n  ON latest_mwl.format_code = format.code\n  AND latest_mwl.latest\n\nWHERE ${generatedwhere.sql}\n\nORDER BY format.id',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          rotation,
          mwl,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return FormatResult(
        format: format.mapFromRow(row, tablePrefix: 'nested_0'),
        currentRotation:
            rotation.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
        latestRotation: rotation.mapFromRowOrNull(row, tablePrefix: 'nested_2'),
        activeMwl: mwl.mapFromRowOrNull(row, tablePrefix: 'nested_3'),
        latestMwl: mwl.mapFromRowOrNull(row, tablePrefix: 'nested_4'),
      );
    });
  }

  Selectable<FactionResult> listFactions(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "faction"."code" AS "nested_0.code", "faction"."side_code" AS "nested_0.side_code", "faction"."name" AS "nested_0.name", "faction"."color" AS "nested_0.color", "faction"."is_mini" AS "nested_0.is_mini",\n  "side"."code" AS "nested_1.code", "side"."name" AS "nested_1.name"\nFROM faction\n\nINNER JOIN side\n  ON side.code = faction.side_code\n\nWHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          faction,
          side,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return FactionResult(
        faction: faction.mapFromRow(row, tablePrefix: 'nested_0'),
        side: side.mapFromRow(row, tablePrefix: 'nested_1'),
      );
    });
  }

  Selectable<DeckResult> listDecks(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "deck"."id" AS "nested_0.id", "deck"."identity_code" AS "nested_0.identity_code", "deck"."format_code" AS "nested_0.format_code", "deck"."rotation_code" AS "nested_0.rotation_code", "deck"."mwl_code" AS "nested_0.mwl_code", "deck"."name" AS "nested_0.name", "deck"."description" AS "nested_0.description", "deck"."created" AS "nested_0.created", "deck"."updated" AS "nested_0.updated", "deck"."state" AS "nested_0.state", "deck"."last_synced" AS "nested_0.last_synced",\n  "identity"."code" AS "nested_1.code", "identity"."pack_code" AS "nested_1.pack_code", "identity"."faction_code" AS "nested_1.faction_code", "identity"."type_code" AS "nested_1.type_code", "identity"."position" AS "nested_1.position", "identity"."title" AS "nested_1.title", "identity"."stripped_title" AS "nested_1.stripped_title", "identity"."body" AS "nested_1.body", "identity"."stripped_body" AS "nested_1.stripped_body", "identity"."keywords" AS "nested_1.keywords", "identity"."quantity" AS "nested_1.quantity", "identity"."cost" AS "nested_1.cost", "identity"."deck_limit" AS "nested_1.deck_limit", "identity"."faction_cost" AS "nested_1.faction_cost", "identity"."uniqueness" AS "nested_1.uniqueness", "identity"."strength" AS "nested_1.strength", "identity"."agenda_points" AS "nested_1.agenda_points", "identity"."memory_cost" AS "nested_1.memory_cost", "identity"."advancement_cost" AS "nested_1.advancement_cost", "identity"."trash_cost" AS "nested_1.trash_cost", "identity"."base_link" AS "nested_1.base_link", "identity"."influence_limit" AS "nested_1.influence_limit", "identity"."minimum_deck_size" AS "nested_1.minimum_deck_size", "identity"."flavor" AS "nested_1.flavor", "identity"."illustrator" AS "nested_1.illustrator",\n  "pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size",\n  "cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated",\n  "faction"."code" AS "nested_4.code", "faction"."side_code" AS "nested_4.side_code", "faction"."name" AS "nested_4.name", "faction"."color" AS "nested_4.color", "faction"."is_mini" AS "nested_4.is_mini",\n  "side"."code" AS "nested_5.code", "side"."name" AS "nested_5.name",\n  "type"."code" AS "nested_6.code", "type"."side_code" AS "nested_6.side_code", "type"."position" AS "nested_6.position", "type"."name" AS "nested_6.name", "type"."is_subtype" AS "nested_6.is_subtype",\n  "subtype"."code" AS "nested_7.code", "subtype"."side_code" AS "nested_7.side_code", "subtype"."position" AS "nested_7.position", "subtype"."name" AS "nested_7.name", "subtype"."is_subtype" AS "nested_7.is_subtype",\n  "format"."id" AS "nested_8.id", "format"."code" AS "nested_8.code", "format"."name" AS "nested_8.name",\n  "rotation"."code" AS "nested_9.code", "rotation"."format_code" AS "nested_9.format_code", "rotation"."name" AS "nested_9.name", "rotation"."date_start" AS "nested_9.date_start", "rotation"."current" AS "nested_9.current", "rotation"."latest" AS "nested_9.latest",\n  "mwl"."code" AS "nested_10.code", "mwl"."format_code" AS "nested_10.format_code", "mwl"."name" AS "nested_10.name", "mwl"."date_start" AS "nested_10.date_start", "mwl"."active" AS "nested_10.active", "mwl"."latest" AS "nested_10.latest"\nFROM deck\n\nINNER JOIN card AS identity\n  ON identity.code = deck.identity_code\n\nINNER JOIN pack\n  ON pack.code = identity.pack_code\n\nINNER JOIN cycle\n  ON cycle.code = pack.cycle_code\n\nINNER JOIN faction\n  ON faction.code = identity.faction_code\n\nINNER JOIN side\n  ON side.code = faction.side_code\n\nINNER JOIN type\n  ON type.code = identity.type_code\n\nLEFT JOIN type as subtype\n  ON subtype.is_subtype\n  AND (\n    subtype.name = identity.keywords\n    OR identity.keywords LIKE (subtype.name || \' - %\')\n  )\n\nLEFT JOIN format\n  ON format.code = deck.format_code\n\nLEFT JOIN rotation\n  ON rotation.code = deck.rotation_code\n\nLEFT JOIN mwl\n  ON mwl.code = deck.mwl_code\n\nWHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          deck,
          card,
          pack,
          cycle,
          faction,
          side,
          type,
          format,
          rotation,
          mwl,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return DeckResult(
        deck: deck.mapFromRow(row, tablePrefix: 'nested_0'),
        identity: card.mapFromRow(row, tablePrefix: 'nested_1'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_2'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_3'),
        faction: faction.mapFromRow(row, tablePrefix: 'nested_4'),
        side: side.mapFromRow(row, tablePrefix: 'nested_5'),
        type: type.mapFromRow(row, tablePrefix: 'nested_6'),
        subtype: type.mapFromRowOrNull(row, tablePrefix: 'nested_7'),
        format: format.mapFromRowOrNull(row, tablePrefix: 'nested_8'),
        rotation: rotation.mapFromRowOrNull(row, tablePrefix: 'nested_9'),
        mwl: mwl.mapFromRowOrNull(row, tablePrefix: 'nested_10'),
      );
    });
  }

  Selectable<DeckData> getDeckById({required String deckId}) {
    return customSelect('SELECT *\nFROM deck\nWHERE id = :deckId', variables: [
      Variable<String>(deckId)
    ], readsFrom: {
      deck,
    }).map(deck.mapFromRow);
  }

  Future<int> deleteDecks({required List<String> deckIds}) {
    var $arrayStartIndex = 1;
    final expandeddeckIds = $expandVar($arrayStartIndex, deckIds.length);
    $arrayStartIndex += deckIds.length;
    return customUpdate(
      'DELETE FROM deck\nWHERE id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deck},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> setDecksState(
      {required DeckState state,
      Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where);
    return customUpdate(
      'UPDATE deck\nSET\n  state = :state\nWHERE ${generatedwhere.sql}',
      variables: [
        Variable<String>(Deck.$converter2.mapToSql(state)!),
        ...generatedwhere.introducedVariables
      ],
      updates: {deck},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<DeckTagData> listDeckTags(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT deck_tag.*\nFROM deck_tag\n\nINNER JOIN deck\n  ON deck.id = deck_tag.deck_id\n\nWHERE ${generatedwhere.sql}\nAND deck.state != \'deleted\'',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          deckTag,
          deck,
          ...generatedwhere.watchedTables,
        }).map(deckTag.mapFromRow);
  }

  Selectable<String> listDistinctDeckTags(
      {Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT tag\nFROM (\n  SELECT deck_tag.tag, COUNT(*) AS count\n  FROM deck_tag\n\n  INNER JOIN deck\n    ON deck.id = deck_tag.deck_id\n\n  WHERE ${generatedwhere.sql}\n  AND deck.state != \'deleted\'\n\n  GROUP BY deck_tag.tag\n) AS deck_tag\n\nORDER BY count DESC',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          deckTag,
          deck,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) => row.read<String>('tag'));
  }

  Future<int> deleteDeckTags({required List<String> deckIds}) {
    var $arrayStartIndex = 1;
    final expandeddeckIds = $expandVar($arrayStartIndex, deckIds.length);
    $arrayStartIndex += deckIds.length;
    return customUpdate(
      'DELETE FROM deck_tag\nWHERE deck_id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deckTag},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> copyDeckTags(
      {required String newDeckId, required String oldDeckId}) {
    return customInsert(
      'INSERT INTO deck_tag\nSELECT\n  :newDeckId,\n  tag\nFROM deck_tag\nWHERE deck_id = :oldDeckId',
      variables: [Variable<String>(newDeckId), Variable<String>(oldDeckId)],
      updates: {deckTag},
    );
  }

  Selectable<DeckCardResult> listDeckCards(
      {String? mwlCode,
      Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "deck_card"."deck_id" AS "nested_0.deck_id", "deck_card"."card_code" AS "nested_0.card_code", "deck_card"."quantity" AS "nested_0.quantity",\n  "card"."code" AS "nested_1.code", "card"."pack_code" AS "nested_1.pack_code", "card"."faction_code" AS "nested_1.faction_code", "card"."type_code" AS "nested_1.type_code", "card"."position" AS "nested_1.position", "card"."title" AS "nested_1.title", "card"."stripped_title" AS "nested_1.stripped_title", "card"."body" AS "nested_1.body", "card"."stripped_body" AS "nested_1.stripped_body", "card"."keywords" AS "nested_1.keywords", "card"."quantity" AS "nested_1.quantity", "card"."cost" AS "nested_1.cost", "card"."deck_limit" AS "nested_1.deck_limit", "card"."faction_cost" AS "nested_1.faction_cost", "card"."uniqueness" AS "nested_1.uniqueness", "card"."strength" AS "nested_1.strength", "card"."agenda_points" AS "nested_1.agenda_points", "card"."memory_cost" AS "nested_1.memory_cost", "card"."advancement_cost" AS "nested_1.advancement_cost", "card"."trash_cost" AS "nested_1.trash_cost", "card"."base_link" AS "nested_1.base_link", "card"."influence_limit" AS "nested_1.influence_limit", "card"."minimum_deck_size" AS "nested_1.minimum_deck_size", "card"."flavor" AS "nested_1.flavor", "card"."illustrator" AS "nested_1.illustrator",\n  "pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size",\n  "cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated",\n  "faction"."code" AS "nested_4.code", "faction"."side_code" AS "nested_4.side_code", "faction"."name" AS "nested_4.name", "faction"."color" AS "nested_4.color", "faction"."is_mini" AS "nested_4.is_mini",\n  "side"."code" AS "nested_5.code", "side"."name" AS "nested_5.name",\n  "type"."code" AS "nested_6.code", "type"."side_code" AS "nested_6.side_code", "type"."position" AS "nested_6.position", "type"."name" AS "nested_6.name", "type"."is_subtype" AS "nested_6.is_subtype",\n  "subtype"."code" AS "nested_7.code", "subtype"."side_code" AS "nested_7.side_code", "subtype"."position" AS "nested_7.position", "subtype"."name" AS "nested_7.name", "subtype"."is_subtype" AS "nested_7.is_subtype",\n  "mwl_card"."mwl_code" AS "nested_8.mwl_code", "mwl_card"."card_code" AS "nested_8.card_code", "mwl_card"."is_restricted" AS "nested_8.is_restricted", "mwl_card"."global_penalty" AS "nested_8.global_penalty", "mwl_card"."universal_faction_cost" AS "nested_8.universal_faction_cost", "mwl_card"."deck_limit" AS "nested_8.deck_limit"\nFROM deck_card\n\nINNER JOIN card\n  ON card.code = deck_card.card_code\n\nINNER JOIN pack\n  ON pack.code = card.pack_code\n\nINNER JOIN cycle\n  ON cycle.code = pack.cycle_code\n\nINNER JOIN faction\n  ON faction.code = card.faction_code\n\nINNER JOIN side\n  ON side.code = faction.side_code\n\nINNER JOIN type\n  ON type.code = card.type_code\n\nLEFT JOIN type as subtype\n  ON subtype.is_subtype\n  AND (\n    subtype.name = card.keywords\n    OR card.keywords LIKE (subtype.name || \' - %\')\n  )\n\nLEFT JOIN mwl_card\n  ON mwl_card.mwl_code = :mwlCode\n  AND mwl_card.card_code = card.code\n\nWHERE ${generatedwhere.sql}',
        variables: [
          Variable<String?>(mwlCode),
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          deckCard,
          card,
          pack,
          cycle,
          faction,
          side,
          type,
          mwlCard,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return DeckCardResult(
        deckCard: deckCard.mapFromRow(row, tablePrefix: 'nested_0'),
        card: card.mapFromRow(row, tablePrefix: 'nested_1'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_2'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_3'),
        faction: faction.mapFromRow(row, tablePrefix: 'nested_4'),
        side: side.mapFromRow(row, tablePrefix: 'nested_5'),
        type: type.mapFromRow(row, tablePrefix: 'nested_6'),
        subtype: type.mapFromRowOrNull(row, tablePrefix: 'nested_7'),
        mwlCard: mwlCard.mapFromRowOrNull(row, tablePrefix: 'nested_8'),
      );
    });
  }

  Future<int> deleteDeckCards({required List<String> deckIds}) {
    var $arrayStartIndex = 1;
    final expandeddeckIds = $expandVar($arrayStartIndex, deckIds.length);
    $arrayStartIndex += deckIds.length;
    return customUpdate(
      'DELETE FROM deck_card\nWHERE deck_id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deckCard},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> copyDeckCards(
      {required String newDeckId, required String oldDeckId}) {
    return customInsert(
      'INSERT INTO deck_card\nSELECT\n  :newDeckId,\n  card_code,\n  quantity\nFROM deck_card\nWHERE deck_id = :oldDeckId',
      variables: [Variable<String>(newDeckId), Variable<String>(oldDeckId)],
      updates: {deckCard},
    );
  }

  Selectable<CycleData> listCycles() {
    return customSelect('SELECT *\nFROM cycle\nORDER BY position DESC',
        variables: [],
        readsFrom: {
          cycle,
        }).map(cycle.mapFromRow);
  }

  Selectable<CollectionResult> listCollection({required bool inCollection}) {
    return customSelect(
        'SELECT\n  "pack"."code" AS "nested_0.code", "pack"."cycle_code" AS "nested_0.cycle_code", "pack"."position" AS "nested_0.position", "pack"."name" AS "nested_0.name", "pack"."date_release" AS "nested_0.date_release", "pack"."size" AS "nested_0.size",\n  "cycle"."code" AS "nested_1.code", "cycle"."position" AS "nested_1.position", "cycle"."name" AS "nested_1.name", "cycle"."size" AS "nested_1.size", "cycle"."rotated" AS "nested_1.rotated",\n  (collection.pack_code IS NOT NULL) AS in_collection\nFROM pack\n\nINNER JOIN cycle\n  ON cycle.code = pack.cycle_code\n\nLEFT JOIN collection\n  ON collection.pack_code = pack.code\n\nWHERE (\n  NOT :inCollection\n  OR (collection.pack_code IS NOT NULL)\n)\n\nORDER BY cycle.position DESC, pack.position',
        variables: [
          Variable<bool>(inCollection)
        ],
        readsFrom: {
          collection,
          pack,
          cycle,
        }).map((QueryRow row) {
      return CollectionResult(
        inCollection: row.read<bool>('in_collection'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_0'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_1'),
      );
    });
  }

  Future<int> deleteCollection() {
    return customUpdate(
      'DELETE FROM collection',
      variables: [],
      updates: {collection},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<CardResult> listCards(
      {String? mwlCode,
      Expression<bool?> where = const CustomExpression('(TRUE)')}) {
    final generatedwhere = $write(where, hasMultipleTables: true);
    return customSelect(
        'SELECT\n  "card"."code" AS "nested_0.code", "card"."pack_code" AS "nested_0.pack_code", "card"."faction_code" AS "nested_0.faction_code", "card"."type_code" AS "nested_0.type_code", "card"."position" AS "nested_0.position", "card"."title" AS "nested_0.title", "card"."stripped_title" AS "nested_0.stripped_title", "card"."body" AS "nested_0.body", "card"."stripped_body" AS "nested_0.stripped_body", "card"."keywords" AS "nested_0.keywords", "card"."quantity" AS "nested_0.quantity", "card"."cost" AS "nested_0.cost", "card"."deck_limit" AS "nested_0.deck_limit", "card"."faction_cost" AS "nested_0.faction_cost", "card"."uniqueness" AS "nested_0.uniqueness", "card"."strength" AS "nested_0.strength", "card"."agenda_points" AS "nested_0.agenda_points", "card"."memory_cost" AS "nested_0.memory_cost", "card"."advancement_cost" AS "nested_0.advancement_cost", "card"."trash_cost" AS "nested_0.trash_cost", "card"."base_link" AS "nested_0.base_link", "card"."influence_limit" AS "nested_0.influence_limit", "card"."minimum_deck_size" AS "nested_0.minimum_deck_size", "card"."flavor" AS "nested_0.flavor", "card"."illustrator" AS "nested_0.illustrator",\n  "pack"."code" AS "nested_1.code", "pack"."cycle_code" AS "nested_1.cycle_code", "pack"."position" AS "nested_1.position", "pack"."name" AS "nested_1.name", "pack"."date_release" AS "nested_1.date_release", "pack"."size" AS "nested_1.size",\n  "cycle"."code" AS "nested_2.code", "cycle"."position" AS "nested_2.position", "cycle"."name" AS "nested_2.name", "cycle"."size" AS "nested_2.size", "cycle"."rotated" AS "nested_2.rotated",\n  "faction"."code" AS "nested_3.code", "faction"."side_code" AS "nested_3.side_code", "faction"."name" AS "nested_3.name", "faction"."color" AS "nested_3.color", "faction"."is_mini" AS "nested_3.is_mini",\n  "side"."code" AS "nested_4.code", "side"."name" AS "nested_4.name",\n  "type"."code" AS "nested_5.code", "type"."side_code" AS "nested_5.side_code", "type"."position" AS "nested_5.position", "type"."name" AS "nested_5.name", "type"."is_subtype" AS "nested_5.is_subtype",\n  "subtype"."code" AS "nested_6.code", "subtype"."side_code" AS "nested_6.side_code", "subtype"."position" AS "nested_6.position", "subtype"."name" AS "nested_6.name", "subtype"."is_subtype" AS "nested_6.is_subtype",\n  "mwl_card"."mwl_code" AS "nested_7.mwl_code", "mwl_card"."card_code" AS "nested_7.card_code", "mwl_card"."is_restricted" AS "nested_7.is_restricted", "mwl_card"."global_penalty" AS "nested_7.global_penalty", "mwl_card"."universal_faction_cost" AS "nested_7.universal_faction_cost", "mwl_card"."deck_limit" AS "nested_7.deck_limit"\nFROM card\n\nINNER JOIN pack\n  ON pack.code = card.pack_code\n\nINNER JOIN cycle\n  ON cycle.code = pack.cycle_code\n\nINNER JOIN faction\n  ON faction.code = card.faction_code\n\nINNER JOIN side\n  ON side.code = faction.side_code\n\nINNER JOIN type\n  ON type.code = card.type_code\n\nLEFT JOIN type as subtype\n  ON subtype.is_subtype\n  AND (\n    subtype.name = card.keywords\n    OR card.keywords LIKE (subtype.name || \' - %\')\n  )\n\nLEFT JOIN mwl_card\n  ON mwl_card.mwl_code = :mwlCode\n  AND mwl_card.card_code = card.code\n\nWHERE ${generatedwhere.sql}',
        variables: [
          Variable<String?>(mwlCode),
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          card,
          pack,
          cycle,
          faction,
          side,
          type,
          mwlCard,
          ...generatedwhere.watchedTables,
        }).map((QueryRow row) {
      return CardResult(
        card: card.mapFromRow(row, tablePrefix: 'nested_0'),
        pack: pack.mapFromRow(row, tablePrefix: 'nested_1'),
        cycle: cycle.mapFromRow(row, tablePrefix: 'nested_2'),
        faction: faction.mapFromRow(row, tablePrefix: 'nested_3'),
        side: side.mapFromRow(row, tablePrefix: 'nested_4'),
        type: type.mapFromRow(row, tablePrefix: 'nested_5'),
        subtype: type.mapFromRowOrNull(row, tablePrefix: 'nested_6'),
        mwlCard: mwlCard.mapFromRowOrNull(row, tablePrefix: 'nested_7'),
      );
    });
  }

  Selectable<String> listIdentityCards({required List<String> codeList}) {
    var $arrayStartIndex = 1;
    final expandedcodeList = $expandVar($arrayStartIndex, codeList.length);
    $arrayStartIndex += codeList.length;
    return customSelect(
        'SELECT code\nFROM card\n\nWHERE type_code = \'identity\'\nAND code in ($expandedcodeList)',
        variables: [
          for (var $ in codeList) Variable<String>($)
        ],
        readsFrom: {
          card,
        }).map((QueryRow row) => row.read<String>('code'));
  }

  Selectable<String> getIdentityCode({required List<String> codeList}) {
    var $arrayStartIndex = 1;
    final expandedcodeList = $expandVar($arrayStartIndex, codeList.length);
    $arrayStartIndex += codeList.length;
    return customSelect(
        'SELECT code\nFROM card\n\nWHERE type_code = \'identity\'\nAND code in ($expandedcodeList)\n\nLIMIT 1',
        variables: [
          for (var $ in codeList) Variable<String>($)
        ],
        readsFrom: {
          card,
        }).map((QueryRow row) => row.read<String>('code'));
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        type,
        side,
        settings,
        OnCreateQuery('INSERT INTO settings\nDEFAULT VALUES'),
        rotation,
        rotationCycle,
        pack,
        nrdb,
        mwl,
        mwlCard,
        format,
        faction,
        deck,
        deckTag,
        deckCard,
        cycle,
        collection,
        card
      ];
}

class TypeResult {
  final TypeData type;
  final SideData? side;
  TypeResult({
    required this.type,
    this.side,
  });
  @override
  int get hashCode => Object.hash(type, side);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TypeResult &&
          other.type == this.type &&
          other.side == this.side);
  @override
  String toString() {
    return (StringBuffer('TypeResult(')
          ..write('type: $type, ')
          ..write('side: $side')
          ..write(')'))
        .toString();
  }
}

class SettingResult {
  final SettingsData settings;
  final FormatData? filterFormat;
  final RotationData? filterRotation;
  final MwlData? filterMwl;
  SettingResult({
    required this.settings,
    this.filterFormat,
    this.filterRotation,
    this.filterMwl,
  });
  @override
  int get hashCode =>
      Object.hash(settings, filterFormat, filterRotation, filterMwl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingResult &&
          other.settings == this.settings &&
          other.filterFormat == this.filterFormat &&
          other.filterRotation == this.filterRotation &&
          other.filterMwl == this.filterMwl);
  @override
  String toString() {
    return (StringBuffer('SettingResult(')
          ..write('settings: $settings, ')
          ..write('filterFormat: $filterFormat, ')
          ..write('filterRotation: $filterRotation, ')
          ..write('filterMwl: $filterMwl')
          ..write(')'))
        .toString();
  }
}

class RotationPackResult {
  final FormatData format;
  final RotationData rotation;
  final PackData pack;
  final CycleData cycle;
  RotationPackResult({
    required this.format,
    required this.rotation,
    required this.pack,
    required this.cycle,
  });
  @override
  int get hashCode => Object.hash(format, rotation, pack, cycle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotationPackResult &&
          other.format == this.format &&
          other.rotation == this.rotation &&
          other.pack == this.pack &&
          other.cycle == this.cycle);
  @override
  String toString() {
    return (StringBuffer('RotationPackResult(')
          ..write('format: $format, ')
          ..write('rotation: $rotation, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle')
          ..write(')'))
        .toString();
  }
}

class FormatPackResult {
  final FormatData format;
  final RotationData rotation;
  final PackData pack;
  final CycleData cycle;
  FormatPackResult({
    required this.format,
    required this.rotation,
    required this.pack,
    required this.cycle,
  });
  @override
  int get hashCode => Object.hash(format, rotation, pack, cycle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormatPackResult &&
          other.format == this.format &&
          other.rotation == this.rotation &&
          other.pack == this.pack &&
          other.cycle == this.cycle);
  @override
  String toString() {
    return (StringBuffer('FormatPackResult(')
          ..write('format: $format, ')
          ..write('rotation: $rotation, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle')
          ..write(')'))
        .toString();
  }
}

class RotationCardResult {
  final FormatData format;
  final RotationData rotation;
  final PackData pack;
  final CycleData cycle;
  final CardData card;
  RotationCardResult({
    required this.format,
    required this.rotation,
    required this.pack,
    required this.cycle,
    required this.card,
  });
  @override
  int get hashCode => Object.hash(format, rotation, pack, cycle, card);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RotationCardResult &&
          other.format == this.format &&
          other.rotation == this.rotation &&
          other.pack == this.pack &&
          other.cycle == this.cycle &&
          other.card == this.card);
  @override
  String toString() {
    return (StringBuffer('RotationCardResult(')
          ..write('format: $format, ')
          ..write('rotation: $rotation, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }
}

class CountStuffResult {
  final int cardCount;
  final int cycleCount;
  final int packCount;
  final int sideCount;
  final int factionCount;
  final int typeCount;
  CountStuffResult({
    required this.cardCount,
    required this.cycleCount,
    required this.packCount,
    required this.sideCount,
    required this.factionCount,
    required this.typeCount,
  });
  @override
  int get hashCode => Object.hash(
      cardCount, cycleCount, packCount, sideCount, factionCount, typeCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountStuffResult &&
          other.cardCount == this.cardCount &&
          other.cycleCount == this.cycleCount &&
          other.packCount == this.packCount &&
          other.sideCount == this.sideCount &&
          other.factionCount == this.factionCount &&
          other.typeCount == this.typeCount);
  @override
  String toString() {
    return (StringBuffer('CountStuffResult(')
          ..write('cardCount: $cardCount, ')
          ..write('cycleCount: $cycleCount, ')
          ..write('packCount: $packCount, ')
          ..write('sideCount: $sideCount, ')
          ..write('factionCount: $factionCount, ')
          ..write('typeCount: $typeCount')
          ..write(')'))
        .toString();
  }
}

class PackResult {
  final PackData pack;
  final CycleData cycle;
  PackResult({
    required this.pack,
    required this.cycle,
  });
  @override
  int get hashCode => Object.hash(pack, cycle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackResult &&
          other.pack == this.pack &&
          other.cycle == this.cycle);
  @override
  String toString() {
    return (StringBuffer('PackResult(')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle')
          ..write(')'))
        .toString();
  }
}

class FormatResult {
  final FormatData format;
  final RotationData? currentRotation;
  final RotationData? latestRotation;
  final MwlData? activeMwl;
  final MwlData? latestMwl;
  FormatResult({
    required this.format,
    this.currentRotation,
    this.latestRotation,
    this.activeMwl,
    this.latestMwl,
  });
  @override
  int get hashCode => Object.hash(
      format, currentRotation, latestRotation, activeMwl, latestMwl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormatResult &&
          other.format == this.format &&
          other.currentRotation == this.currentRotation &&
          other.latestRotation == this.latestRotation &&
          other.activeMwl == this.activeMwl &&
          other.latestMwl == this.latestMwl);
  @override
  String toString() {
    return (StringBuffer('FormatResult(')
          ..write('format: $format, ')
          ..write('currentRotation: $currentRotation, ')
          ..write('latestRotation: $latestRotation, ')
          ..write('activeMwl: $activeMwl, ')
          ..write('latestMwl: $latestMwl')
          ..write(')'))
        .toString();
  }
}

class FactionResult {
  final FactionData faction;
  final SideData side;
  FactionResult({
    required this.faction,
    required this.side,
  });
  @override
  int get hashCode => Object.hash(faction, side);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FactionResult &&
          other.faction == this.faction &&
          other.side == this.side);
  @override
  String toString() {
    return (StringBuffer('FactionResult(')
          ..write('faction: $faction, ')
          ..write('side: $side')
          ..write(')'))
        .toString();
  }
}

class DeckResult {
  final DeckData deck;
  final CardData identity;
  final PackData pack;
  final CycleData cycle;
  final FactionData faction;
  final SideData side;
  final TypeData type;
  final TypeData? subtype;
  final FormatData? format;
  final RotationData? rotation;
  final MwlData? mwl;
  DeckResult({
    required this.deck,
    required this.identity,
    required this.pack,
    required this.cycle,
    required this.faction,
    required this.side,
    required this.type,
    this.subtype,
    this.format,
    this.rotation,
    this.mwl,
  });
  @override
  int get hashCode => Object.hash(deck, identity, pack, cycle, faction, side,
      type, subtype, format, rotation, mwl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckResult &&
          other.deck == this.deck &&
          other.identity == this.identity &&
          other.pack == this.pack &&
          other.cycle == this.cycle &&
          other.faction == this.faction &&
          other.side == this.side &&
          other.type == this.type &&
          other.subtype == this.subtype &&
          other.format == this.format &&
          other.rotation == this.rotation &&
          other.mwl == this.mwl);
  @override
  String toString() {
    return (StringBuffer('DeckResult(')
          ..write('deck: $deck, ')
          ..write('identity: $identity, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle, ')
          ..write('faction: $faction, ')
          ..write('side: $side, ')
          ..write('type: $type, ')
          ..write('subtype: $subtype, ')
          ..write('format: $format, ')
          ..write('rotation: $rotation, ')
          ..write('mwl: $mwl')
          ..write(')'))
        .toString();
  }
}

class DeckCardResult {
  final DeckCardData deckCard;
  final CardData card;
  final PackData pack;
  final CycleData cycle;
  final FactionData faction;
  final SideData side;
  final TypeData type;
  final TypeData? subtype;
  final MwlCardData? mwlCard;
  DeckCardResult({
    required this.deckCard,
    required this.card,
    required this.pack,
    required this.cycle,
    required this.faction,
    required this.side,
    required this.type,
    this.subtype,
    this.mwlCard,
  });
  @override
  int get hashCode => Object.hash(
      deckCard, card, pack, cycle, faction, side, type, subtype, mwlCard);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeckCardResult &&
          other.deckCard == this.deckCard &&
          other.card == this.card &&
          other.pack == this.pack &&
          other.cycle == this.cycle &&
          other.faction == this.faction &&
          other.side == this.side &&
          other.type == this.type &&
          other.subtype == this.subtype &&
          other.mwlCard == this.mwlCard);
  @override
  String toString() {
    return (StringBuffer('DeckCardResult(')
          ..write('deckCard: $deckCard, ')
          ..write('card: $card, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle, ')
          ..write('faction: $faction, ')
          ..write('side: $side, ')
          ..write('type: $type, ')
          ..write('subtype: $subtype, ')
          ..write('mwlCard: $mwlCard')
          ..write(')'))
        .toString();
  }
}

class CollectionResult {
  final bool inCollection;
  final PackData pack;
  final CycleData cycle;
  CollectionResult({
    required this.inCollection,
    required this.pack,
    required this.cycle,
  });
  @override
  int get hashCode => Object.hash(inCollection, pack, cycle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionResult &&
          other.inCollection == this.inCollection &&
          other.pack == this.pack &&
          other.cycle == this.cycle);
  @override
  String toString() {
    return (StringBuffer('CollectionResult(')
          ..write('inCollection: $inCollection, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle')
          ..write(')'))
        .toString();
  }
}

class CardResult {
  final CardData card;
  final PackData pack;
  final CycleData cycle;
  final FactionData faction;
  final SideData side;
  final TypeData type;
  final TypeData? subtype;
  final MwlCardData? mwlCard;
  CardResult({
    required this.card,
    required this.pack,
    required this.cycle,
    required this.faction,
    required this.side,
    required this.type,
    this.subtype,
    this.mwlCard,
  });
  @override
  int get hashCode =>
      Object.hash(card, pack, cycle, faction, side, type, subtype, mwlCard);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardResult &&
          other.card == this.card &&
          other.pack == this.pack &&
          other.cycle == this.cycle &&
          other.faction == this.faction &&
          other.side == this.side &&
          other.type == this.type &&
          other.subtype == this.subtype &&
          other.mwlCard == this.mwlCard);
  @override
  String toString() {
    return (StringBuffer('CardResult(')
          ..write('card: $card, ')
          ..write('pack: $pack, ')
          ..write('cycle: $cycle, ')
          ..write('faction: $faction, ')
          ..write('side: $side, ')
          ..write('type: $type, ')
          ..write('subtype: $subtype, ')
          ..write('mwlCard: $mwlCard')
          ..write(')'))
        .toString();
  }
}
