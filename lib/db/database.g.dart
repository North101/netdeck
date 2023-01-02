// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin TypeToColumns implements Insertable<TypeData> {
  String get code;
  String? get sideCode;
  int get position;
  String get name;
  bool get isSubtype;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || sideCode != null) {
      map['side_code'] = Variable<String>(sideCode);
    }
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    map['is_subtype'] = Variable<bool>(isSubtype);
    return map;
  }
}

class Type extends Table with TableInfo<Type, TypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Type(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _sideCodeMeta =
      const VerificationMeta('sideCode');
  late final GeneratedColumn<String> sideCode = GeneratedColumn<String>(
      'side_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isSubtypeMeta =
      const VerificationMeta('isSubtype');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TypeData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      sideCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}side_code']),
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isSubtype: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_subtype'])!,
    );
  }

  @override
  Type createAlias(String alias) {
    return Type(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

mixin SideToColumns implements Insertable<SideData> {
  String get code;
  String get name;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }
}

class Side extends Table with TableInfo<Side, SideData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Side(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SideData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Side createAlias(String alias) {
    return Side(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

mixin SettingsToColumns implements Insertable<SettingsData> {
  bool get id;
  String? get filterFormatCode;
  String? get filterRotationCode;
  String? get filterMwlCode;
  bool get filterCollection;
  CardSort get cardSort;
  CardGroup get cardGroup;
  DeckSort get deckSort;
  DeckGroup get deckGroup;
  CardSort get deckCardSort;
  CardGroup get deckCardGroup;
  CardSort get compareCardSort;
  bool get apexResources;
  CardGalleryPageView get cardGalleryView;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<bool>(id);
    if (!nullToAbsent || filterFormatCode != null) {
      map['filter_format_code'] = Variable<String>(filterFormatCode);
    }
    if (!nullToAbsent || filterRotationCode != null) {
      map['filter_rotation_code'] = Variable<String>(filterRotationCode);
    }
    if (!nullToAbsent || filterMwlCode != null) {
      map['filter_mwl_code'] = Variable<String>(filterMwlCode);
    }
    map['filter_collection'] = Variable<bool>(filterCollection);
    {
      final converter = Settings.$convertercardSort;
      map['card_sort'] = Variable<String>(converter.toSql(cardSort));
    }
    {
      final converter = Settings.$convertercardGroup;
      map['card_group'] = Variable<String>(converter.toSql(cardGroup));
    }
    {
      final converter = Settings.$converterdeckSort;
      map['deck_sort'] = Variable<String>(converter.toSql(deckSort));
    }
    {
      final converter = Settings.$converterdeckGroup;
      map['deck_group'] = Variable<String>(converter.toSql(deckGroup));
    }
    {
      final converter = Settings.$converterdeckCardSort;
      map['deck_card_sort'] = Variable<String>(converter.toSql(deckCardSort));
    }
    {
      final converter = Settings.$converterdeckCardGroup;
      map['deck_card_group'] = Variable<String>(converter.toSql(deckCardGroup));
    }
    {
      final converter = Settings.$convertercompareCardSort;
      map['compare_card_sort'] =
          Variable<String>(converter.toSql(compareCardSort));
    }
    map['apex_resources'] = Variable<bool>(apexResources);
    {
      final converter = Settings.$convertercardGalleryView;
      map['card_gallery_view'] =
          Variable<String>(converter.toSql(cardGalleryView));
    }
    return map;
  }
}

class Settings extends Table with TableInfo<Settings, SettingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<bool> id = GeneratedColumn<bool>(
      'id', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _filterFormatCodeMeta =
      const VerificationMeta('filterFormatCode');
  late final GeneratedColumn<String> filterFormatCode = GeneratedColumn<String>(
      'filter_format_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT NULL',
      defaultValue: const CustomExpression('NULL'));
  static const VerificationMeta _filterRotationCodeMeta =
      const VerificationMeta('filterRotationCode');
  late final GeneratedColumn<String> filterRotationCode =
      GeneratedColumn<String>('filter_rotation_code', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: 'DEFAULT NULL',
          defaultValue: const CustomExpression('NULL'));
  static const VerificationMeta _filterMwlCodeMeta =
      const VerificationMeta('filterMwlCode');
  late final GeneratedColumn<String> filterMwlCode = GeneratedColumn<String>(
      'filter_mwl_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT NULL',
      defaultValue: const CustomExpression('NULL'));
  static const VerificationMeta _filterCollectionMeta =
      const VerificationMeta('filterCollection');
  late final GeneratedColumn<bool> filterCollection = GeneratedColumn<bool>(
      'filter_collection', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _cardSortMeta =
      const VerificationMeta('cardSort');
  late final GeneratedColumnWithTypeConverter<CardSort, String> cardSort =
      GeneratedColumn<String>('card_sort', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'set\'',
              defaultValue: const CustomExpression('\'set\''))
          .withConverter<CardSort>(Settings.$convertercardSort);
  static const VerificationMeta _cardGroupMeta =
      const VerificationMeta('cardGroup');
  late final GeneratedColumnWithTypeConverter<CardGroup, String> cardGroup =
      GeneratedColumn<String>('card_group', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'type\'',
              defaultValue: const CustomExpression('\'type\''))
          .withConverter<CardGroup>(Settings.$convertercardGroup);
  static const VerificationMeta _deckSortMeta =
      const VerificationMeta('deckSort');
  late final GeneratedColumnWithTypeConverter<DeckSort, String> deckSort =
      GeneratedColumn<String>('deck_sort', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'updated\'',
              defaultValue: const CustomExpression('\'updated\''))
          .withConverter<DeckSort>(Settings.$converterdeckSort);
  static const VerificationMeta _deckGroupMeta =
      const VerificationMeta('deckGroup');
  late final GeneratedColumnWithTypeConverter<DeckGroup, String> deckGroup =
      GeneratedColumn<String>('deck_group', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'side\'',
              defaultValue: const CustomExpression('\'side\''))
          .withConverter<DeckGroup>(Settings.$converterdeckGroup);
  static const VerificationMeta _deckCardSortMeta =
      const VerificationMeta('deckCardSort');
  late final GeneratedColumnWithTypeConverter<CardSort, String> deckCardSort =
      GeneratedColumn<String>('deck_card_sort', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'set\'',
              defaultValue: const CustomExpression('\'set\''))
          .withConverter<CardSort>(Settings.$converterdeckCardSort);
  static const VerificationMeta _deckCardGroupMeta =
      const VerificationMeta('deckCardGroup');
  late final GeneratedColumnWithTypeConverter<CardGroup, String> deckCardGroup =
      GeneratedColumn<String>('deck_card_group', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'type\'',
              defaultValue: const CustomExpression('\'type\''))
          .withConverter<CardGroup>(Settings.$converterdeckCardGroup);
  static const VerificationMeta _compareCardSortMeta =
      const VerificationMeta('compareCardSort');
  late final GeneratedColumnWithTypeConverter<CardSort, String>
      compareCardSort = GeneratedColumn<String>(
              'compare_card_sort', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'set\'',
              defaultValue: const CustomExpression('\'set\''))
          .withConverter<CardSort>(Settings.$convertercompareCardSort);
  static const VerificationMeta _apexResourcesMeta =
      const VerificationMeta('apexResources');
  late final GeneratedColumn<bool> apexResources = GeneratedColumn<bool>(
      'apex_resources', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _cardGalleryViewMeta =
      const VerificationMeta('cardGalleryView');
  late final GeneratedColumnWithTypeConverter<CardGalleryPageView, String>
      cardGalleryView = GeneratedColumn<String>(
              'card_gallery_view', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              $customConstraints: 'NOT NULL DEFAULT \'image\'',
              defaultValue: const CustomExpression('\'image\''))
          .withConverter<CardGalleryPageView>(
              Settings.$convertercardGalleryView);
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
    context.handle(_compareCardSortMeta, const VerificationResult.success());
    if (data.containsKey('apex_resources')) {
      context.handle(
          _apexResourcesMeta,
          apexResources.isAcceptableOrUnknown(
              data['apex_resources']!, _apexResourcesMeta));
    }
    context.handle(_cardGalleryViewMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}id'])!,
      filterFormatCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}filter_format_code']),
      filterRotationCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}filter_rotation_code']),
      filterMwlCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filter_mwl_code']),
      filterCollection: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}filter_collection'])!,
      cardSort: Settings.$convertercardSort.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_sort'])!),
      cardGroup: Settings.$convertercardGroup.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_group'])!),
      deckSort: Settings.$converterdeckSort.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_sort'])!),
      deckGroup: Settings.$converterdeckGroup.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_group'])!),
      deckCardSort: Settings.$converterdeckCardSort.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}deck_card_sort'])!),
      deckCardGroup: Settings.$converterdeckCardGroup.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}deck_card_group'])!),
      compareCardSort: Settings.$convertercompareCardSort.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}compare_card_sort'])!),
      apexResources: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}apex_resources'])!,
      cardGalleryView: Settings.$convertercardGalleryView.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}card_gallery_view'])!),
    );
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CardSort, String, String> $convertercardSort =
      const EnumNameConverter<CardSort>(CardSort.values);
  static JsonTypeConverter2<CardGroup, String, String> $convertercardGroup =
      const EnumNameConverter<CardGroup>(CardGroup.values);
  static JsonTypeConverter2<DeckSort, String, String> $converterdeckSort =
      const EnumNameConverter<DeckSort>(DeckSort.values);
  static JsonTypeConverter2<DeckGroup, String, String> $converterdeckGroup =
      const EnumNameConverter<DeckGroup>(DeckGroup.values);
  static JsonTypeConverter2<CardSort, String, String> $converterdeckCardSort =
      const EnumNameConverter<CardSort>(CardSort.values);
  static JsonTypeConverter2<CardGroup, String, String> $converterdeckCardGroup =
      const EnumNameConverter<CardGroup>(CardGroup.values);
  static JsonTypeConverter2<CardSort, String, String>
      $convertercompareCardSort =
      const EnumNameConverter<CardSort>(CardSort.values);
  static JsonTypeConverter2<CardGalleryPageView, String, String>
      $convertercardGalleryView =
      const EnumNameConverter<CardGalleryPageView>(CardGalleryPageView.values);
  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT settings_id CHECK(id = TRUE)'];
  @override
  bool get dontWriteConstraints => true;
}

class SettingsCompanion extends UpdateCompanion<SettingsData> {
  final Value<bool> id;
  final Value<String?> filterFormatCode;
  final Value<String?> filterRotationCode;
  final Value<String?> filterMwlCode;
  final Value<bool> filterCollection;
  final Value<CardSort> cardSort;
  final Value<CardGroup> cardGroup;
  final Value<DeckSort> deckSort;
  final Value<DeckGroup> deckGroup;
  final Value<CardSort> deckCardSort;
  final Value<CardGroup> deckCardGroup;
  final Value<CardSort> compareCardSort;
  final Value<bool> apexResources;
  final Value<CardGalleryPageView> cardGalleryView;
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
  static Insertable<SettingsData> custom({
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
      Value<CardSort>? cardSort,
      Value<CardGroup>? cardGroup,
      Value<DeckSort>? deckSort,
      Value<DeckGroup>? deckGroup,
      Value<CardSort>? deckCardSort,
      Value<CardGroup>? deckCardGroup,
      Value<CardSort>? compareCardSort,
      Value<bool>? apexResources,
      Value<CardGalleryPageView>? cardGalleryView}) {
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
      final converter = Settings.$convertercardSort;
      map['card_sort'] = Variable<String>(converter.toSql(cardSort.value));
    }
    if (cardGroup.present) {
      final converter = Settings.$convertercardGroup;
      map['card_group'] = Variable<String>(converter.toSql(cardGroup.value));
    }
    if (deckSort.present) {
      final converter = Settings.$converterdeckSort;
      map['deck_sort'] = Variable<String>(converter.toSql(deckSort.value));
    }
    if (deckGroup.present) {
      final converter = Settings.$converterdeckGroup;
      map['deck_group'] = Variable<String>(converter.toSql(deckGroup.value));
    }
    if (deckCardSort.present) {
      final converter = Settings.$converterdeckCardSort;
      map['deck_card_sort'] =
          Variable<String>(converter.toSql(deckCardSort.value));
    }
    if (deckCardGroup.present) {
      final converter = Settings.$converterdeckCardGroup;
      map['deck_card_group'] =
          Variable<String>(converter.toSql(deckCardGroup.value));
    }
    if (compareCardSort.present) {
      final converter = Settings.$convertercompareCardSort;
      map['compare_card_sort'] =
          Variable<String>(converter.toSql(compareCardSort.value));
    }
    if (apexResources.present) {
      map['apex_resources'] = Variable<bool>(apexResources.value);
    }
    if (cardGalleryView.present) {
      final converter = Settings.$convertercardGalleryView;
      map['card_gallery_view'] =
          Variable<String>(converter.toSql(cardGalleryView.value));
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

mixin FormatToColumns implements Insertable<FormatData> {
  int get id;
  String get code;
  String get name;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }
}

class Format extends Table with TableInfo<Format, FormatData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Format(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormatData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Format createAlias(String alias) {
    return Format(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

mixin RotationToColumns implements Insertable<RotationData> {
  String get code;
  String get formatCode;
  String get name;
  DateTime? get dateStart;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['format_code'] = Variable<String>(formatCode);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateStart != null) {
      map['date_start'] = Variable<DateTime>(dateStart);
    }
    return map;
  }
}

class Rotation extends Table with TableInfo<Rotation, RotationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Rotation(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _formatCodeMeta =
      const VerificationMeta('formatCode');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateStartMeta =
      const VerificationMeta('dateStart');
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
    if (data.containsKey('date_start')) {
      context.handle(_dateStartMeta,
          dateStart.isAcceptableOrUnknown(data['date_start']!, _dateStartMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  RotationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotationData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      formatCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_start']),
    );
  }

  @override
  Rotation createAlias(String alias) {
    return Rotation(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class RotationCompanion extends UpdateCompanion<RotationData> {
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
  static Insertable<RotationData> custom({
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

class RotationView extends ViewInfo<RotationView, RotationViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
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
      'CREATE VIEW rotation_view (code,rotation_code,format_code,name,date_start,type) AS SELECT rotation.* FROM (SELECT format.code || \'@current\' AS code, rotation.code AS rotation_code, format.code AS format_code, format.name || \' Current (\' || COALESCE(rotation.name, \'None\') || \')\' AS name, rotation.date_start, \'current\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM rotation WHERE DATE(date_start) <= DATE(\'NOW\') GROUP BY rotation.format_code) AS rotation ON rotation.format_code = format.code UNION ALL SELECT format.code || \'@latest\' AS code, rotation.code AS rotation_code, format.code AS format_code, format.name || \' Latest (\' || COALESCE(rotation.name, \'None\') || \')\' AS name, rotation.date_start, \'latest\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM rotation GROUP BY rotation.format_code) AS rotation ON rotation.format_code = format.code UNION ALL SELECT rotation.code, rotation.code AS rotation_code, rotation.format_code, rotation.name, rotation.date_start, NULL AS type FROM rotation) AS rotation INNER JOIN format ON format.code = rotation.format_code ORDER BY format.id, rotation.type DESC NULLS LAST, rotation.date_start DESC';
  @override
  RotationView get asDslTable => this;
  @override
  RotationViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotationViewData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      rotationCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotation_code']),
      formatCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_start']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
    );
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
  Set<String> get readTables => const {'format', 'rotation'};
}

mixin MwlToColumns implements Insertable<MwlData> {
  String get code;
  String get formatCode;
  String get name;
  DateTime? get dateStart;
  int? get runnerPoints;
  int? get corpPoints;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['format_code'] = Variable<String>(formatCode);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateStart != null) {
      map['date_start'] = Variable<DateTime>(dateStart);
    }
    if (!nullToAbsent || runnerPoints != null) {
      map['runner_points'] = Variable<int>(runnerPoints);
    }
    if (!nullToAbsent || corpPoints != null) {
      map['corp_points'] = Variable<int>(corpPoints);
    }
    return map;
  }
}

class Mwl extends Table with TableInfo<Mwl, MwlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mwl(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _formatCodeMeta =
      const VerificationMeta('formatCode');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateStartMeta =
      const VerificationMeta('dateStart');
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
      'date_start', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _runnerPointsMeta =
      const VerificationMeta('runnerPoints');
  late final GeneratedColumn<int> runnerPoints = GeneratedColumn<int>(
      'runner_points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _corpPointsMeta =
      const VerificationMeta('corpPoints');
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
    if (data.containsKey('date_start')) {
      context.handle(_dateStartMeta,
          dateStart.isAcceptableOrUnknown(data['date_start']!, _dateStartMeta));
    }
    if (data.containsKey('runner_points')) {
      context.handle(
          _runnerPointsMeta,
          runnerPoints.isAcceptableOrUnknown(
              data['runner_points']!, _runnerPointsMeta));
    }
    if (data.containsKey('corp_points')) {
      context.handle(
          _corpPointsMeta,
          corpPoints.isAcceptableOrUnknown(
              data['corp_points']!, _corpPointsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  MwlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MwlData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      formatCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_start']),
      runnerPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}runner_points']),
      corpPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}corp_points']),
    );
  }

  @override
  Mwl createAlias(String alias) {
    return Mwl(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MwlCompanion extends UpdateCompanion<MwlData> {
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
  static Insertable<MwlData> custom({
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

class MwlView extends ViewInfo<MwlView, MwlViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
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
      'CREATE VIEW mwl_view (code,format_code,mwl_code,name,date_start,runner_points,corp_points,type) AS SELECT mwl.* FROM (SELECT format.code || \'@active\' AS code, format.code AS format_code, mwl.code AS mwl_code, format.name || \' Active (\' || COALESCE(mwl.name, \'None\') || \')\' AS name, mwl.date_start, mwl.runner_points, mwl.corp_points, \'active\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM mwl WHERE DATE(date_start) <= DATE(\'NOW\') GROUP BY mwl.format_code) AS mwl ON mwl.format_code = format.code UNION ALL SELECT format.code || \'@latest\' AS code, format.code AS format_code, mwl.code AS mwl_code, format.name || \' Latest (\' || COALESCE(mwl.name, \'None\') || \')\' AS name, mwl.date_start, mwl.runner_points, mwl.corp_points, \'latest\' AS type FROM format LEFT JOIN (SELECT *, MAX(date_start) FROM mwl GROUP BY mwl.format_code) AS mwl ON mwl.format_code = format.code UNION ALL SELECT mwl.code, mwl.format_code, mwl.code, mwl.name, mwl.date_start, mwl.runner_points, mwl.corp_points, NULL AS type FROM mwl) AS mwl INNER JOIN format ON format.code = mwl.format_code ORDER BY format.id, mwl.type DESC NULLS LAST, mwl.date_start DESC';
  @override
  MwlView get asDslTable => this;
  @override
  MwlViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MwlViewData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      mwlCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mwl_code']),
      formatCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_start']),
      runnerPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}runner_points']),
      corpPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}corp_points']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
    );
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
  Set<String> get readTables => const {'format', 'mwl'};
}

mixin RotationCycleToColumns implements Insertable<RotationCycleData> {
  String get rotationCode;
  String get cycleCode;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rotation_code'] = Variable<String>(rotationCode);
    map['cycle_code'] = Variable<String>(cycleCode);
    return map;
  }
}

class RotationCycle extends Table
    with TableInfo<RotationCycle, RotationCycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RotationCycle(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rotationCodeMeta =
      const VerificationMeta('rotationCode');
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cycleCodeMeta =
      const VerificationMeta('cycleCode');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotationCycleData(
      rotationCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotation_code'])!,
      cycleCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cycle_code'])!,
    );
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

mixin CycleToColumns implements Insertable<CycleData> {
  String get code;
  int get position;
  String get name;
  int get size;
  bool get rotated;
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
}

class Cycle extends Table with TableInfo<Cycle, CycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cycle(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _rotatedMeta =
      const VerificationMeta('rotated');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CycleData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size'])!,
      rotated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}rotated'])!,
    );
  }

  @override
  Cycle createAlias(String alias) {
    return Cycle(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

class RotationCycleView extends ViewInfo<RotationCycleView, RotationCycleData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  RotationCycleView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [rotationCode, cycleCode];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'rotation_cycle_view';
  @override
  String get createViewStmt =>
      'CREATE VIEW rotation_cycle_view (rotation_code,cycle_code) AS SELECT rotation.code, rotation_cycle.cycle_code FROM rotation_view AS rotation INNER JOIN rotation_cycle ON rotation_cycle.rotation_code = rotation.rotation_code UNION ALL SELECT rotation.code, cycle.code FROM rotation_view AS rotation CROSS JOIN cycle WHERE rotation.rotation_code IS NULL';
  @override
  RotationCycleView get asDslTable => this;
  @override
  RotationCycleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RotationCycleData(
      rotationCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotation_code'])!,
      cycleCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cycle_code'])!,
    );
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
  Set<String> get readTables =>
      const {'format', 'rotation', 'rotation_cycle', 'cycle'};
}

mixin PackToColumns implements Insertable<PackData> {
  String get code;
  String get cycleCode;
  int get position;
  String get name;
  DateTime? get dateRelease;
  int? get size;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['cycle_code'] = Variable<String>(cycleCode);
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dateRelease != null) {
      map['date_release'] = Variable<DateTime>(dateRelease);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    return map;
  }
}

class Pack extends Table with TableInfo<Pack, PackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Pack(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _cycleCodeMeta =
      const VerificationMeta('cycleCode');
  late final GeneratedColumn<String> cycleCode = GeneratedColumn<String>(
      'cycle_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateReleaseMeta =
      const VerificationMeta('dateRelease');
  late final GeneratedColumn<DateTime> dateRelease = GeneratedColumn<DateTime>(
      'date_release', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
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
    if (data.containsKey('date_release')) {
      context.handle(
          _dateReleaseMeta,
          dateRelease.isAcceptableOrUnknown(
              data['date_release']!, _dateReleaseMeta));
    }
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      cycleCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cycle_code'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateRelease: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_release']),
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size']),
    );
  }

  @override
  Pack createAlias(String alias) {
    return Pack(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

mixin CardToColumns implements Insertable<CardData> {
  String get code;
  String get packCode;
  String get factionCode;
  String get typeCode;
  int get position;
  String get title;
  String? get body;
  String? get keywords;
  int get quantity;
  int? get cost;
  int get deckLimit;
  int get factionCost;
  bool get uniqueness;
  int? get strength;
  int? get agendaPoints;
  int? get memoryCost;
  int? get advancementCost;
  int? get trashCost;
  int? get baseLink;
  int? get influenceLimit;
  int? get minimumDeckSize;
  String? get flavor;
  String? get illustrator;
  String get imageUrl;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['pack_code'] = Variable<String>(packCode);
    map['faction_code'] = Variable<String>(factionCode);
    map['type_code'] = Variable<String>(typeCode);
    map['position'] = Variable<int>(position);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || keywords != null) {
      map['keywords'] = Variable<String>(keywords);
    }
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<int>(cost);
    }
    map['deck_limit'] = Variable<int>(deckLimit);
    map['faction_cost'] = Variable<int>(factionCost);
    map['uniqueness'] = Variable<bool>(uniqueness);
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<int>(strength);
    }
    if (!nullToAbsent || agendaPoints != null) {
      map['agenda_points'] = Variable<int>(agendaPoints);
    }
    if (!nullToAbsent || memoryCost != null) {
      map['memory_cost'] = Variable<int>(memoryCost);
    }
    if (!nullToAbsent || advancementCost != null) {
      map['advancement_cost'] = Variable<int>(advancementCost);
    }
    if (!nullToAbsent || trashCost != null) {
      map['trash_cost'] = Variable<int>(trashCost);
    }
    if (!nullToAbsent || baseLink != null) {
      map['base_link'] = Variable<int>(baseLink);
    }
    if (!nullToAbsent || influenceLimit != null) {
      map['influence_limit'] = Variable<int>(influenceLimit);
    }
    if (!nullToAbsent || minimumDeckSize != null) {
      map['minimum_deck_size'] = Variable<int>(minimumDeckSize);
    }
    if (!nullToAbsent || flavor != null) {
      map['flavor'] = Variable<String>(flavor);
    }
    if (!nullToAbsent || illustrator != null) {
      map['illustrator'] = Variable<String>(illustrator);
    }
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }
}

class Card extends Table with TableInfo<Card, CardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Card(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _packCodeMeta =
      const VerificationMeta('packCode');
  late final GeneratedColumn<String> packCode = GeneratedColumn<String>(
      'pack_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _factionCodeMeta =
      const VerificationMeta('factionCode');
  late final GeneratedColumn<String> factionCode = GeneratedColumn<String>(
      'faction_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _typeCodeMeta =
      const VerificationMeta('typeCode');
  late final GeneratedColumn<String> typeCode = GeneratedColumn<String>(
      'type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _keywordsMeta =
      const VerificationMeta('keywords');
  late final GeneratedColumn<String> keywords = GeneratedColumn<String>(
      'keywords', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
      'cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _deckLimitMeta =
      const VerificationMeta('deckLimit');
  late final GeneratedColumn<int> deckLimit = GeneratedColumn<int>(
      'deck_limit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _factionCostMeta =
      const VerificationMeta('factionCost');
  late final GeneratedColumn<int> factionCost = GeneratedColumn<int>(
      'faction_cost', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _uniquenessMeta =
      const VerificationMeta('uniqueness');
  late final GeneratedColumn<bool> uniqueness = GeneratedColumn<bool>(
      'uniqueness', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _agendaPointsMeta =
      const VerificationMeta('agendaPoints');
  late final GeneratedColumn<int> agendaPoints = GeneratedColumn<int>(
      'agenda_points', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _memoryCostMeta =
      const VerificationMeta('memoryCost');
  late final GeneratedColumn<int> memoryCost = GeneratedColumn<int>(
      'memory_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _advancementCostMeta =
      const VerificationMeta('advancementCost');
  late final GeneratedColumn<int> advancementCost = GeneratedColumn<int>(
      'advancement_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _trashCostMeta =
      const VerificationMeta('trashCost');
  late final GeneratedColumn<int> trashCost = GeneratedColumn<int>(
      'trash_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _baseLinkMeta =
      const VerificationMeta('baseLink');
  late final GeneratedColumn<int> baseLink = GeneratedColumn<int>(
      'base_link', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _influenceLimitMeta =
      const VerificationMeta('influenceLimit');
  late final GeneratedColumn<int> influenceLimit = GeneratedColumn<int>(
      'influence_limit', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _minimumDeckSizeMeta =
      const VerificationMeta('minimumDeckSize');
  late final GeneratedColumn<int> minimumDeckSize = GeneratedColumn<int>(
      'minimum_deck_size', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _flavorMeta = const VerificationMeta('flavor');
  late final GeneratedColumn<String> flavor = GeneratedColumn<String>(
      'flavor', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _illustratorMeta =
      const VerificationMeta('illustrator');
  late final GeneratedColumn<String> illustrator = GeneratedColumn<String>(
      'illustrator', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
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
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
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
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  CardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      packCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pack_code'])!,
      factionCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faction_code'])!,
      typeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_code'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body']),
      keywords: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keywords']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost']),
      deckLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deck_limit'])!,
      factionCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}faction_cost'])!,
      uniqueness: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}uniqueness'])!,
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength']),
      agendaPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}agenda_points']),
      memoryCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memory_cost']),
      advancementCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}advancement_cost']),
      trashCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trash_cost']),
      baseLink: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_link']),
      influenceLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}influence_limit']),
      minimumDeckSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minimum_deck_size']),
      flavor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flavor']),
      illustrator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}illustrator']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  Card createAlias(String alias) {
    return Card(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CardCompanion extends UpdateCompanion<CardData> {
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
  static Insertable<CardData> custom({
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

mixin FactionToColumns implements Insertable<FactionData> {
  String get code;
  String get sideCode;
  String get name;
  Color get color;
  bool get isMini;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['side_code'] = Variable<String>(sideCode);
    map['name'] = Variable<String>(name);
    {
      final converter = Faction.$convertercolor;
      map['color'] = Variable<int>(converter.toSql(color));
    }
    map['is_mini'] = Variable<bool>(isMini);
    return map;
  }
}

class Faction extends Table with TableInfo<Faction, FactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Faction(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _sideCodeMeta =
      const VerificationMeta('sideCode');
  late final GeneratedColumn<String> sideCode = GeneratedColumn<String>(
      'side_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumnWithTypeConverter<Color, int> color =
      GeneratedColumn<int>('color', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<Color>(Faction.$convertercolor);
  static const VerificationMeta _isMiniMeta = const VerificationMeta('isMini');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FactionData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      sideCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}side_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: Faction.$convertercolor.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!),
      isMini: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_mini'])!,
    );
  }

  @override
  Faction createAlias(String alias) {
    return Faction(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Color, int, int> $convertercolor =
      const ColorConverter();
  @override
  bool get dontWriteConstraints => true;
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
      final converter = Faction.$convertercolor;
      map['color'] = Variable<int>(converter.toSql(color.value));
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

mixin NrdbToColumns implements Insertable<NrdbData> {
  bool get id;
  DateTime get expires;
  DateTime get cycleLastUpdated;
  DateTime get packLastUpdated;
  DateTime get sideLastUpdated;
  DateTime get factionLastUpdated;
  DateTime get typeLastUpdated;
  DateTime get cardLastUpdated;
  DateTime get formatLastUpdated;
  DateTime get rotationLastUpdated;
  DateTime get mwlLastUpdated;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<bool>(id);
    map['expires'] = Variable<DateTime>(expires);
    map['cycle_last_updated'] = Variable<DateTime>(cycleLastUpdated);
    map['pack_last_updated'] = Variable<DateTime>(packLastUpdated);
    map['side_last_updated'] = Variable<DateTime>(sideLastUpdated);
    map['faction_last_updated'] = Variable<DateTime>(factionLastUpdated);
    map['type_last_updated'] = Variable<DateTime>(typeLastUpdated);
    map['card_last_updated'] = Variable<DateTime>(cardLastUpdated);
    map['format_last_updated'] = Variable<DateTime>(formatLastUpdated);
    map['rotation_last_updated'] = Variable<DateTime>(rotationLastUpdated);
    map['mwl_last_updated'] = Variable<DateTime>(mwlLastUpdated);
    return map;
  }
}

class Nrdb extends Table with TableInfo<Nrdb, NrdbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Nrdb(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<bool> id = GeneratedColumn<bool>(
      'id', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _expiresMeta =
      const VerificationMeta('expires');
  late final GeneratedColumn<DateTime> expires = GeneratedColumn<DateTime>(
      'expires', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cycleLastUpdatedMeta =
      const VerificationMeta('cycleLastUpdated');
  late final GeneratedColumn<DateTime> cycleLastUpdated =
      GeneratedColumn<DateTime>('cycle_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _packLastUpdatedMeta =
      const VerificationMeta('packLastUpdated');
  late final GeneratedColumn<DateTime> packLastUpdated =
      GeneratedColumn<DateTime>('pack_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _sideLastUpdatedMeta =
      const VerificationMeta('sideLastUpdated');
  late final GeneratedColumn<DateTime> sideLastUpdated =
      GeneratedColumn<DateTime>('side_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _factionLastUpdatedMeta =
      const VerificationMeta('factionLastUpdated');
  late final GeneratedColumn<DateTime> factionLastUpdated =
      GeneratedColumn<DateTime>('faction_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _typeLastUpdatedMeta =
      const VerificationMeta('typeLastUpdated');
  late final GeneratedColumn<DateTime> typeLastUpdated =
      GeneratedColumn<DateTime>('type_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _cardLastUpdatedMeta =
      const VerificationMeta('cardLastUpdated');
  late final GeneratedColumn<DateTime> cardLastUpdated =
      GeneratedColumn<DateTime>('card_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _formatLastUpdatedMeta =
      const VerificationMeta('formatLastUpdated');
  late final GeneratedColumn<DateTime> formatLastUpdated =
      GeneratedColumn<DateTime>('format_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _rotationLastUpdatedMeta =
      const VerificationMeta('rotationLastUpdated');
  late final GeneratedColumn<DateTime> rotationLastUpdated =
      GeneratedColumn<DateTime>('rotation_last_updated', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _mwlLastUpdatedMeta =
      const VerificationMeta('mwlLastUpdated');
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
  VerificationContext validateIntegrity(Insertable<NrdbData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('expires')) {
      context.handle(_expiresMeta,
          expires.isAcceptableOrUnknown(data['expires']!, _expiresMeta));
    } else if (isInserting) {
      context.missing(_expiresMeta);
    }
    if (data.containsKey('cycle_last_updated')) {
      context.handle(
          _cycleLastUpdatedMeta,
          cycleLastUpdated.isAcceptableOrUnknown(
              data['cycle_last_updated']!, _cycleLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_cycleLastUpdatedMeta);
    }
    if (data.containsKey('pack_last_updated')) {
      context.handle(
          _packLastUpdatedMeta,
          packLastUpdated.isAcceptableOrUnknown(
              data['pack_last_updated']!, _packLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_packLastUpdatedMeta);
    }
    if (data.containsKey('side_last_updated')) {
      context.handle(
          _sideLastUpdatedMeta,
          sideLastUpdated.isAcceptableOrUnknown(
              data['side_last_updated']!, _sideLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_sideLastUpdatedMeta);
    }
    if (data.containsKey('faction_last_updated')) {
      context.handle(
          _factionLastUpdatedMeta,
          factionLastUpdated.isAcceptableOrUnknown(
              data['faction_last_updated']!, _factionLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_factionLastUpdatedMeta);
    }
    if (data.containsKey('type_last_updated')) {
      context.handle(
          _typeLastUpdatedMeta,
          typeLastUpdated.isAcceptableOrUnknown(
              data['type_last_updated']!, _typeLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_typeLastUpdatedMeta);
    }
    if (data.containsKey('card_last_updated')) {
      context.handle(
          _cardLastUpdatedMeta,
          cardLastUpdated.isAcceptableOrUnknown(
              data['card_last_updated']!, _cardLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_cardLastUpdatedMeta);
    }
    if (data.containsKey('format_last_updated')) {
      context.handle(
          _formatLastUpdatedMeta,
          formatLastUpdated.isAcceptableOrUnknown(
              data['format_last_updated']!, _formatLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_formatLastUpdatedMeta);
    }
    if (data.containsKey('rotation_last_updated')) {
      context.handle(
          _rotationLastUpdatedMeta,
          rotationLastUpdated.isAcceptableOrUnknown(
              data['rotation_last_updated']!, _rotationLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_rotationLastUpdatedMeta);
    }
    if (data.containsKey('mwl_last_updated')) {
      context.handle(
          _mwlLastUpdatedMeta,
          mwlLastUpdated.isAcceptableOrUnknown(
              data['mwl_last_updated']!, _mwlLastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_mwlLastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NrdbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NrdbData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}id'])!,
      expires: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires'])!,
      cycleLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cycle_last_updated'])!,
      packLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}pack_last_updated'])!,
      sideLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}side_last_updated'])!,
      factionLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}faction_last_updated'])!,
      typeLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}type_last_updated'])!,
      cardLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}card_last_updated'])!,
      formatLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}format_last_updated'])!,
      rotationLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}rotation_last_updated'])!,
      mwlLastUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}mwl_last_updated'])!,
    );
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

class NrdbData extends DataClass with NrdbToColumns {
  @override
  final bool id;
  @override
  final DateTime expires;
  @override
  final DateTime cycleLastUpdated;
  @override
  final DateTime packLastUpdated;
  @override
  final DateTime sideLastUpdated;
  @override
  final DateTime factionLastUpdated;
  @override
  final DateTime typeLastUpdated;
  @override
  final DateTime cardLastUpdated;
  @override
  final DateTime formatLastUpdated;
  @override
  final DateTime rotationLastUpdated;
  @override
  final DateTime mwlLastUpdated;
  const NrdbData(
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

mixin MwlCardToColumns implements Insertable<MwlCardData> {
  String get mwlCode;
  String get cardTitle;
  bool get isRestricted;
  int? get globalPenalty;
  int? get universalFactionCost;
  int? get deckLimit;
  int? get points;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mwl_code'] = Variable<String>(mwlCode);
    map['card_title'] = Variable<String>(cardTitle);
    map['is_restricted'] = Variable<bool>(isRestricted);
    if (!nullToAbsent || globalPenalty != null) {
      map['global_penalty'] = Variable<int>(globalPenalty);
    }
    if (!nullToAbsent || universalFactionCost != null) {
      map['universal_faction_cost'] = Variable<int>(universalFactionCost);
    }
    if (!nullToAbsent || deckLimit != null) {
      map['deck_limit'] = Variable<int>(deckLimit);
    }
    if (!nullToAbsent || points != null) {
      map['points'] = Variable<int>(points);
    }
    return map;
  }
}

class MwlCard extends Table with TableInfo<MwlCard, MwlCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MwlCard(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mwlCodeMeta =
      const VerificationMeta('mwlCode');
  late final GeneratedColumn<String> mwlCode = GeneratedColumn<String>(
      'mwl_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cardTitleMeta =
      const VerificationMeta('cardTitle');
  late final GeneratedColumn<String> cardTitle = GeneratedColumn<String>(
      'card_title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isRestrictedMeta =
      const VerificationMeta('isRestricted');
  late final GeneratedColumn<bool> isRestricted = GeneratedColumn<bool>(
      'is_restricted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _globalPenaltyMeta =
      const VerificationMeta('globalPenalty');
  late final GeneratedColumn<int> globalPenalty = GeneratedColumn<int>(
      'global_penalty', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _universalFactionCostMeta =
      const VerificationMeta('universalFactionCost');
  late final GeneratedColumn<int> universalFactionCost = GeneratedColumn<int>(
      'universal_faction_cost', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _deckLimitMeta =
      const VerificationMeta('deckLimit');
  late final GeneratedColumn<int> deckLimit = GeneratedColumn<int>(
      'deck_limit', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
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
    if (data.containsKey('card_title')) {
      context.handle(_cardTitleMeta,
          cardTitle.isAcceptableOrUnknown(data['card_title']!, _cardTitleMeta));
    } else if (isInserting) {
      context.missing(_cardTitleMeta);
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
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mwlCode, cardTitle};
  @override
  MwlCardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MwlCardData(
      mwlCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mwl_code'])!,
      cardTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_title'])!,
      isRestricted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_restricted'])!,
      globalPenalty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}global_penalty']),
      universalFactionCost: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}universal_faction_cost']),
      deckLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deck_limit']),
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points']),
    );
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

class MwlCardData extends DataClass with MwlCardToColumns {
  @override
  final String mwlCode;
  @override
  final String cardTitle;
  @override
  final bool isRestricted;
  @override
  final int? globalPenalty;
  @override
  final int? universalFactionCost;
  @override
  final int? deckLimit;
  @override
  final int? points;
  const MwlCardData(
      {required this.mwlCode,
      required this.cardTitle,
      required this.isRestricted,
      this.globalPenalty,
      this.universalFactionCost,
      this.deckLimit,
      this.points});
  MwlCardCompanion toCompanion(bool nullToAbsent) {
    return MwlCardCompanion(
      mwlCode: Value(mwlCode),
      cardTitle: Value(cardTitle),
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
      points:
          points == null && nullToAbsent ? const Value.absent() : Value(points),
    );
  }

  factory MwlCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MwlCardData(
      mwlCode: serializer.fromJson<String>(json['mwl_code']),
      cardTitle: serializer.fromJson<String>(json['card_title']),
      isRestricted: serializer.fromJson<bool>(json['is_restricted']),
      globalPenalty: serializer.fromJson<int?>(json['global_penalty']),
      universalFactionCost:
          serializer.fromJson<int?>(json['universal_faction_cost']),
      deckLimit: serializer.fromJson<int?>(json['deck_limit']),
      points: serializer.fromJson<int?>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mwl_code': serializer.toJson<String>(mwlCode),
      'card_title': serializer.toJson<String>(cardTitle),
      'is_restricted': serializer.toJson<bool>(isRestricted),
      'global_penalty': serializer.toJson<int?>(globalPenalty),
      'universal_faction_cost': serializer.toJson<int?>(universalFactionCost),
      'deck_limit': serializer.toJson<int?>(deckLimit),
      'points': serializer.toJson<int?>(points),
    };
  }

  MwlCardData copyWith(
          {String? mwlCode,
          String? cardTitle,
          bool? isRestricted,
          Value<int?> globalPenalty = const Value.absent(),
          Value<int?> universalFactionCost = const Value.absent(),
          Value<int?> deckLimit = const Value.absent(),
          Value<int?> points = const Value.absent()}) =>
      MwlCardData(
        mwlCode: mwlCode ?? this.mwlCode,
        cardTitle: cardTitle ?? this.cardTitle,
        isRestricted: isRestricted ?? this.isRestricted,
        globalPenalty:
            globalPenalty.present ? globalPenalty.value : this.globalPenalty,
        universalFactionCost: universalFactionCost.present
            ? universalFactionCost.value
            : this.universalFactionCost,
        deckLimit: deckLimit.present ? deckLimit.value : this.deckLimit,
        points: points.present ? points.value : this.points,
      );
  @override
  String toString() {
    return (StringBuffer('MwlCardData(')
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

  @override
  int get hashCode => Object.hash(mwlCode, cardTitle, isRestricted,
      globalPenalty, universalFactionCost, deckLimit, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MwlCardData &&
          other.mwlCode == this.mwlCode &&
          other.cardTitle == this.cardTitle &&
          other.isRestricted == this.isRestricted &&
          other.globalPenalty == this.globalPenalty &&
          other.universalFactionCost == this.universalFactionCost &&
          other.deckLimit == this.deckLimit &&
          other.points == this.points);
}

class MwlCardCompanion extends UpdateCompanion<MwlCardData> {
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
  static Insertable<MwlCardData> custom({
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

mixin DeckToColumns implements Insertable<DeckData> {
  String get id;
  String get identityCode;
  String? get formatCode;
  String? get rotationCode;
  String? get mwlCode;
  String get name;
  String get description;
  DateTime get created;
  DateTime get updated;
  bool get deleted;
  DateTime? get remoteUpdated;
  DateTime? get synced;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['identity_code'] = Variable<String>(identityCode);
    if (!nullToAbsent || formatCode != null) {
      map['format_code'] = Variable<String>(formatCode);
    }
    if (!nullToAbsent || rotationCode != null) {
      map['rotation_code'] = Variable<String>(rotationCode);
    }
    if (!nullToAbsent || mwlCode != null) {
      map['mwl_code'] = Variable<String>(mwlCode);
    }
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    map['deleted'] = Variable<bool>(deleted);
    if (!nullToAbsent || remoteUpdated != null) {
      map['remote_updated'] = Variable<DateTime>(remoteUpdated);
    }
    if (!nullToAbsent || synced != null) {
      map['synced'] = Variable<DateTime>(synced);
    }
    return map;
  }
}

class Deck extends Table with TableInfo<Deck, DeckData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Deck(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _identityCodeMeta =
      const VerificationMeta('identityCode');
  late final GeneratedColumn<String> identityCode = GeneratedColumn<String>(
      'identity_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _formatCodeMeta =
      const VerificationMeta('formatCode');
  late final GeneratedColumn<String> formatCode = GeneratedColumn<String>(
      'format_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _rotationCodeMeta =
      const VerificationMeta('rotationCode');
  late final GeneratedColumn<String> rotationCode = GeneratedColumn<String>(
      'rotation_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _mwlCodeMeta =
      const VerificationMeta('mwlCode');
  late final GeneratedColumn<String> mwlCode = GeneratedColumn<String>(
      'mwl_code', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _remoteUpdatedMeta =
      const VerificationMeta('remoteUpdated');
  late final GeneratedColumn<DateTime> remoteUpdated =
      GeneratedColumn<DateTime>('remote_updated', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
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
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    } else if (isInserting) {
      context.missing(_deletedMeta);
    }
    if (data.containsKey('remote_updated')) {
      context.handle(
          _remoteUpdatedMeta,
          remoteUpdated.isAcceptableOrUnknown(
              data['remote_updated']!, _remoteUpdatedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeckData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeckData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      identityCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identity_code'])!,
      formatCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format_code']),
      rotationCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotation_code']),
      mwlCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mwl_code']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      remoteUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}remote_updated']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}synced']),
    );
  }

  @override
  Deck createAlias(String alias) {
    return Deck(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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
  static Insertable<DeckData> custom({
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

mixin DeckTagToColumns implements Insertable<DeckTagData> {
  String get deckId;
  String get tag;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['deck_id'] = Variable<String>(deckId);
    map['tag'] = Variable<String>(tag);
    return map;
  }
}

class DeckTag extends Table with TableInfo<DeckTag, DeckTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckTag(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeckTagData(
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_id'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
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

class DeckTagData extends DataClass with DeckTagToColumns {
  @override
  final String deckId;
  @override
  final String tag;
  const DeckTagData({required this.deckId, required this.tag});
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

mixin DeckCardToColumns implements Insertable<DeckCardData> {
  String get deckId;
  String get cardCode;
  int get quantity;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['deck_id'] = Variable<String>(deckId);
    map['card_code'] = Variable<String>(cardCode);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }
}

class DeckCard extends Table with TableInfo<DeckCard, DeckCardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeckCard(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  late final GeneratedColumn<String> deckId = GeneratedColumn<String>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _cardCodeMeta =
      const VerificationMeta('cardCode');
  late final GeneratedColumn<String> cardCode = GeneratedColumn<String>(
      'card_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeckCardData(
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck_id'])!,
      cardCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_code'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
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

mixin CollectionToColumns implements Insertable<CollectionData> {
  String get packCode;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pack_code'] = Variable<String>(packCode);
    return map;
  }
}

class Collection extends Table with TableInfo<Collection, CollectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Collection(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _packCodeMeta =
      const VerificationMeta('packCode');
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionData(
      packCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pack_code'])!,
    );
  }

  @override
  Collection createAlias(String alias) {
    return Collection(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CollectionData extends DataClass with CollectionToColumns {
  @override
  final String packCode;
  const CollectionData({required this.packCode});
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

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
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
  Selectable<TypeResult> listTypes({ListTypes$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.type, this.side) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"type"."code" AS "nested_0.code", "type"."side_code" AS "nested_0.side_code", "type"."position" AS "nested_0.position", "type"."name" AS "nested_0.name", "type"."is_subtype" AS "nested_0.is_subtype","side"."code" AS "nested_1.code", "side"."name" AS "nested_1.name" FROM type LEFT JOIN side ON side.code = type.side_code WHERE ${generatedwhere.sql} ORDER BY type.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          type,
          side,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => TypeResult(
          type: await type.mapFromRow(row, tablePrefix: 'nested_0'),
          side: await side.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
        ));
  }

  Selectable<SideData> listSides({ListSides$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.side) ?? const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect('SELECT * FROM side WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          side,
          ...generatedwhere.watchedTables,
        }).asyncMap(side.mapFromRow);
  }

  Selectable<SettingsResult> getSettings() {
    return customSelect(
        'SELECT settings.*,"filter_format"."id" AS "nested_0.id", "filter_format"."code" AS "nested_0.code", "filter_format"."name" AS "nested_0.name","filter_rotation"."code" AS "nested_1.code", "filter_rotation"."rotation_code" AS "nested_1.rotation_code", "filter_rotation"."format_code" AS "nested_1.format_code", "filter_rotation"."name" AS "nested_1.name", "filter_rotation"."date_start" AS "nested_1.date_start", "filter_rotation"."type" AS "nested_1.type","filter_mwl"."code" AS "nested_2.code", "filter_mwl"."format_code" AS "nested_2.format_code", "filter_mwl"."mwl_code" AS "nested_2.mwl_code", "filter_mwl"."name" AS "nested_2.name", "filter_mwl"."date_start" AS "nested_2.date_start", "filter_mwl"."runner_points" AS "nested_2.runner_points", "filter_mwl"."corp_points" AS "nested_2.corp_points", "filter_mwl"."type" AS "nested_2.type" FROM settings LEFT JOIN format AS filter_format ON filter_format.code = settings.filter_format_code LEFT JOIN rotation_view AS filter_rotation ON filter_rotation.code = settings.filter_rotation_code LEFT JOIN mwl_view AS filter_mwl ON filter_mwl.code = settings.filter_mwl_code LIMIT 1',
        variables: [],
        readsFrom: {
          settings,
          format,
          rotation,
          mwl,
        }).asyncMap((QueryRow row) async => SettingsResult(
          id: row.read<bool>('id'),
          filterFormatCode: row.readNullable<String>('filter_format_code'),
          filterRotationCode: row.readNullable<String>('filter_rotation_code'),
          filterMwlCode: row.readNullable<String>('filter_mwl_code'),
          filterCollection: row.read<bool>('filter_collection'),
          cardSort: Settings.$convertercardSort
              .fromSql(row.read<String>('card_sort')),
          cardGroup: Settings.$convertercardGroup
              .fromSql(row.read<String>('card_group')),
          deckSort: Settings.$converterdeckSort
              .fromSql(row.read<String>('deck_sort')),
          deckGroup: Settings.$converterdeckGroup
              .fromSql(row.read<String>('deck_group')),
          deckCardSort: Settings.$converterdeckCardSort
              .fromSql(row.read<String>('deck_card_sort')),
          deckCardGroup: Settings.$converterdeckCardGroup
              .fromSql(row.read<String>('deck_card_group')),
          compareCardSort: Settings.$convertercompareCardSort
              .fromSql(row.read<String>('compare_card_sort')),
          apexResources: row.read<bool>('apex_resources'),
          cardGalleryView: Settings.$convertercardGalleryView
              .fromSql(row.read<String>('card_gallery_view')),
          filterFormat:
              await format.mapFromRowOrNull(row, tablePrefix: 'nested_0'),
          filterRotation:
              await rotationView.mapFromRowOrNull(row, tablePrefix: 'nested_1'),
          filterMwl:
              await mwlView.mapFromRowOrNull(row, tablePrefix: 'nested_2'),
        ));
  }

  Selectable<RotationViewData> listRotations({ListRotations$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(alias(this.rotationView, 'rotation')) ??
            const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT rotation.* FROM rotation_view AS rotation WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          rotation,
          ...generatedwhere.watchedTables,
        }).asyncMap(rotationView.mapFromRow);
  }

  Selectable<RotationPackResult> listRotationPacks(
      {ListRotationPacks$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(
                alias(this.rotationView, 'rotation'),
                this.format,
                alias(this.rotationCycleView, 'rotation_cycle'),
                this.cycle,
                this.pack) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name","rotation"."code" AS "nested_1.code", "rotation"."rotation_code" AS "nested_1.rotation_code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."type" AS "nested_1.type","pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size","cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated" FROM rotation_view AS rotation INNER JOIN format ON format.code = rotation.format_code INNER JOIN rotation_cycle_view AS rotation_cycle ON rotation_cycle.rotation_code = rotation.code INNER JOIN cycle ON cycle.code = rotation_cycle.cycle_code INNER JOIN pack ON pack.cycle_code = cycle.code WHERE ${generatedwhere.sql} ORDER BY format.id, rotation.type DESC NULLS LAST, rotation.date_start DESC, cycle.position DESC, pack.position DESC',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          cycle,
          pack,
          rotation,
          rotationCycle,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => RotationPackResult(
          format: await format.mapFromRow(row, tablePrefix: 'nested_0'),
          rotation: await rotationView.mapFromRow(row, tablePrefix: 'nested_1'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_2'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_3'),
        ));
  }

  Selectable<RotationPackResult> listDefaultFormatPacks() {
    return customSelect(
        'SELECT"format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name","rotation"."code" AS "nested_1.code", "rotation"."rotation_code" AS "nested_1.rotation_code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."type" AS "nested_1.type","pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size","cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated" FROM settings INNER JOIN format ON format.code = settings.filter_format_code INNER JOIN rotation_view AS rotation ON rotation.format_code = format.code AND rotation.type = \'current\' INNER JOIN rotation_cycle_view AS rotation_cycle ON rotation_cycle.rotation_code = rotation.code INNER JOIN cycle ON cycle.code = rotation_cycle.cycle_code INNER JOIN pack ON pack.cycle_code = cycle.code ORDER BY cycle.position DESC, pack.position DESC',
        variables: [],
        readsFrom: {
          settings,
          format,
          cycle,
          pack,
          rotation,
          rotationCycle,
        }).asyncMap((QueryRow row) async => RotationPackResult(
          format: await format.mapFromRow(row, tablePrefix: 'nested_0'),
          rotation: await rotationView.mapFromRow(row, tablePrefix: 'nested_1'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_2'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_3'),
        ));
  }

  Selectable<RotationCardResult> listRotationCards(
      {ListRotationCards$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(
                alias(this.rotationView, 'rotation'),
                this.format,
                alias(this.rotationCycleView, 'rotation_cycle'),
                this.cycle,
                this.pack,
                this.card) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name","rotation"."code" AS "nested_1.code", "rotation"."rotation_code" AS "nested_1.rotation_code", "rotation"."format_code" AS "nested_1.format_code", "rotation"."name" AS "nested_1.name", "rotation"."date_start" AS "nested_1.date_start", "rotation"."type" AS "nested_1.type","pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size","cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated","card"."code" AS "nested_4.code", "card"."pack_code" AS "nested_4.pack_code", "card"."faction_code" AS "nested_4.faction_code", "card"."type_code" AS "nested_4.type_code", "card"."position" AS "nested_4.position", "card"."title" AS "nested_4.title", "card"."body" AS "nested_4.body", "card"."keywords" AS "nested_4.keywords", "card"."quantity" AS "nested_4.quantity", "card"."cost" AS "nested_4.cost", "card"."deck_limit" AS "nested_4.deck_limit", "card"."faction_cost" AS "nested_4.faction_cost", "card"."uniqueness" AS "nested_4.uniqueness", "card"."strength" AS "nested_4.strength", "card"."agenda_points" AS "nested_4.agenda_points", "card"."memory_cost" AS "nested_4.memory_cost", "card"."advancement_cost" AS "nested_4.advancement_cost", "card"."trash_cost" AS "nested_4.trash_cost", "card"."base_link" AS "nested_4.base_link", "card"."influence_limit" AS "nested_4.influence_limit", "card"."minimum_deck_size" AS "nested_4.minimum_deck_size", "card"."flavor" AS "nested_4.flavor", "card"."illustrator" AS "nested_4.illustrator", "card"."image_url" AS "nested_4.image_url" FROM rotation_view AS rotation INNER JOIN format ON format.code = rotation.format_code INNER JOIN rotation_cycle_view AS rotation_cycle ON rotation_cycle.rotation_code = rotation.code INNER JOIN cycle ON cycle.code = rotation_cycle.cycle_code INNER JOIN pack ON pack.cycle_code = cycle.code INNER JOIN card ON card.pack_code = pack.code WHERE ${generatedwhere.sql} ORDER BY rotation.date_start DESC, cycle.position DESC, pack.position DESC, card.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          cycle,
          pack,
          card,
          rotation,
          rotationCycle,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => RotationCardResult(
          format: await format.mapFromRow(row, tablePrefix: 'nested_0'),
          rotation: await rotationView.mapFromRow(row, tablePrefix: 'nested_1'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_2'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_3'),
          card: await card.mapFromRow(row, tablePrefix: 'nested_4'),
        ));
  }

  Selectable<CountStuffResult> countStuff(
      {CountStuff$cards? cards,
      CountStuff$cycles? cycles,
      CountStuff$packs? packs,
      CountStuff$sides? sides,
      CountStuff$factions? factions,
      CountStuff$types? types}) {
    var $arrayStartIndex = 1;
    final generatedcards = $write(
        cards?.call(this.card) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedcards.amountOfVariables;
    final generatedcycles = $write(
        cycles?.call(this.cycle) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedcycles.amountOfVariables;
    final generatedpacks = $write(
        packs?.call(this.pack) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedpacks.amountOfVariables;
    final generatedsides = $write(
        sides?.call(this.side) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedsides.amountOfVariables;
    final generatedfactions = $write(
        factions?.call(this.faction, this.side) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedfactions.amountOfVariables;
    final generatedtypes = $write(
        types?.call(this.type, this.side) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedtypes.amountOfVariables;
    return customSelect(
        'SELECT (SELECT COUNT(*) FROM card WHERE ${generatedcards.sql}) AS card_count, (SELECT COUNT(*) FROM cycle WHERE ${generatedcycles.sql}) AS cycle_count, (SELECT COUNT(*) FROM pack WHERE ${generatedpacks.sql}) AS pack_count, (SELECT COUNT(*) FROM side WHERE ${generatedsides.sql}) AS side_count, (SELECT COUNT(*) FROM faction INNER JOIN side ON side.code = faction.side_code WHERE ${generatedfactions.sql}) AS faction_count, (SELECT COUNT(*) FROM type INNER JOIN side ON side.code = type.side_code WHERE ${generatedtypes.sql}) AS type_count',
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

  Selectable<PackResult> listPacks({ListPacks$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.pack, this.cycle) ?? const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"pack"."code" AS "nested_0.code", "pack"."cycle_code" AS "nested_0.cycle_code", "pack"."position" AS "nested_0.position", "pack"."name" AS "nested_0.name", "pack"."date_release" AS "nested_0.date_release", "pack"."size" AS "nested_0.size","cycle"."code" AS "nested_1.code", "cycle"."position" AS "nested_1.position", "cycle"."name" AS "nested_1.name", "cycle"."size" AS "nested_1.size", "cycle"."rotated" AS "nested_1.rotated" FROM pack INNER JOIN cycle ON cycle.code = pack.cycle_code WHERE ${generatedwhere.sql} ORDER BY cycle.position DESC, pack.position DESC',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          pack,
          cycle,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => PackResult(
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_0'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_1'),
        ));
  }

  Selectable<NrdbData> getNrdb() {
    return customSelect('SELECT * FROM nrdb LIMIT 1',
        variables: [],
        readsFrom: {
          nrdb,
        }).asyncMap(nrdb.mapFromRow);
  }

  Selectable<MwlViewData> listMwl({ListMwl$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(alias(this.mwlView, 'mwl')) ??
            const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT mwl.* FROM mwl_view AS mwl WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          mwl,
          ...generatedwhere.watchedTables,
        }).asyncMap(mwlView.mapFromRow);
  }

  Selectable<MwlCardData> listMwlCard({ListMwlCard$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.mwlCard) ?? const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect('SELECT * FROM mwl_card WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          mwlCard,
          ...generatedwhere.watchedTables,
        }).asyncMap(mwlCard.mapFromRow);
  }

  Selectable<FormatResult> listFormats({ListFormats$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.format, alias(this.rotationView, 'current_rotation'),
                alias(this.mwlView, 'active_mwl')) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"format"."id" AS "nested_0.id", "format"."code" AS "nested_0.code", "format"."name" AS "nested_0.name","current_rotation"."code" AS "nested_1.code", "current_rotation"."rotation_code" AS "nested_1.rotation_code", "current_rotation"."format_code" AS "nested_1.format_code", "current_rotation"."name" AS "nested_1.name", "current_rotation"."date_start" AS "nested_1.date_start", "current_rotation"."type" AS "nested_1.type","active_mwl"."code" AS "nested_2.code", "active_mwl"."format_code" AS "nested_2.format_code", "active_mwl"."mwl_code" AS "nested_2.mwl_code", "active_mwl"."name" AS "nested_2.name", "active_mwl"."date_start" AS "nested_2.date_start", "active_mwl"."runner_points" AS "nested_2.runner_points", "active_mwl"."corp_points" AS "nested_2.corp_points", "active_mwl"."type" AS "nested_2.type" FROM format INNER JOIN rotation_view AS current_rotation ON current_rotation.format_code = format.code AND current_rotation.type = \'current\' INNER JOIN mwl_view AS active_mwl ON active_mwl.format_code = format.code AND active_mwl.type = \'active\' WHERE ${generatedwhere.sql} ORDER BY format.id',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          format,
          rotation,
          mwl,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => FormatResult(
          format: await format.mapFromRow(row, tablePrefix: 'nested_0'),
          currentRotation:
              await rotationView.mapFromRow(row, tablePrefix: 'nested_1'),
          activeMwl: await mwlView.mapFromRow(row, tablePrefix: 'nested_2'),
        ));
  }

  Selectable<FactionResult> listFactions({ListFactions$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.faction, this.side) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"faction"."code" AS "nested_0.code", "faction"."side_code" AS "nested_0.side_code", "faction"."name" AS "nested_0.name", "faction"."color" AS "nested_0.color", "faction"."is_mini" AS "nested_0.is_mini","side"."code" AS "nested_1.code", "side"."name" AS "nested_1.name" FROM faction INNER JOIN side ON side.code = faction.side_code WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          faction,
          side,
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => FactionResult(
          faction: await faction.mapFromRow(row, tablePrefix: 'nested_0'),
          side: await side.mapFromRow(row, tablePrefix: 'nested_1'),
        ));
  }

  Selectable<DeckResult> listDecks({ListDecks$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(
                this.deck,
                alias(this.card, 'identity'),
                this.pack,
                this.cycle,
                this.faction,
                this.side,
                this.type,
                alias(this.type, 'subtype'),
                this.format,
                alias(this.rotationView, 'rotation'),
                alias(this.mwlView, 'mwl')) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"deck"."id" AS "nested_0.id", "deck"."identity_code" AS "nested_0.identity_code", "deck"."format_code" AS "nested_0.format_code", "deck"."rotation_code" AS "nested_0.rotation_code", "deck"."mwl_code" AS "nested_0.mwl_code", "deck"."name" AS "nested_0.name", "deck"."description" AS "nested_0.description", "deck"."created" AS "nested_0.created", "deck"."updated" AS "nested_0.updated", "deck"."deleted" AS "nested_0.deleted", "deck"."remote_updated" AS "nested_0.remote_updated", "deck"."synced" AS "nested_0.synced","identity"."code" AS "nested_1.code", "identity"."pack_code" AS "nested_1.pack_code", "identity"."faction_code" AS "nested_1.faction_code", "identity"."type_code" AS "nested_1.type_code", "identity"."position" AS "nested_1.position", "identity"."title" AS "nested_1.title", "identity"."body" AS "nested_1.body", "identity"."keywords" AS "nested_1.keywords", "identity"."quantity" AS "nested_1.quantity", "identity"."cost" AS "nested_1.cost", "identity"."deck_limit" AS "nested_1.deck_limit", "identity"."faction_cost" AS "nested_1.faction_cost", "identity"."uniqueness" AS "nested_1.uniqueness", "identity"."strength" AS "nested_1.strength", "identity"."agenda_points" AS "nested_1.agenda_points", "identity"."memory_cost" AS "nested_1.memory_cost", "identity"."advancement_cost" AS "nested_1.advancement_cost", "identity"."trash_cost" AS "nested_1.trash_cost", "identity"."base_link" AS "nested_1.base_link", "identity"."influence_limit" AS "nested_1.influence_limit", "identity"."minimum_deck_size" AS "nested_1.minimum_deck_size", "identity"."flavor" AS "nested_1.flavor", "identity"."illustrator" AS "nested_1.illustrator", "identity"."image_url" AS "nested_1.image_url","pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size","cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated","faction"."code" AS "nested_4.code", "faction"."side_code" AS "nested_4.side_code", "faction"."name" AS "nested_4.name", "faction"."color" AS "nested_4.color", "faction"."is_mini" AS "nested_4.is_mini","side"."code" AS "nested_5.code", "side"."name" AS "nested_5.name","type"."code" AS "nested_6.code", "type"."side_code" AS "nested_6.side_code", "type"."position" AS "nested_6.position", "type"."name" AS "nested_6.name", "type"."is_subtype" AS "nested_6.is_subtype","subtype"."code" AS "nested_7.code", "subtype"."side_code" AS "nested_7.side_code", "subtype"."position" AS "nested_7.position", "subtype"."name" AS "nested_7.name", "subtype"."is_subtype" AS "nested_7.is_subtype","format"."id" AS "nested_8.id", "format"."code" AS "nested_8.code", "format"."name" AS "nested_8.name","rotation"."code" AS "nested_9.code", "rotation"."rotation_code" AS "nested_9.rotation_code", "rotation"."format_code" AS "nested_9.format_code", "rotation"."name" AS "nested_9.name", "rotation"."date_start" AS "nested_9.date_start", "rotation"."type" AS "nested_9.type","mwl"."code" AS "nested_10.code", "mwl"."format_code" AS "nested_10.format_code", "mwl"."mwl_code" AS "nested_10.mwl_code", "mwl"."name" AS "nested_10.name", "mwl"."date_start" AS "nested_10.date_start", "mwl"."runner_points" AS "nested_10.runner_points", "mwl"."corp_points" AS "nested_10.corp_points", "mwl"."type" AS "nested_10.type" FROM deck INNER JOIN card AS identity ON identity.code = deck.identity_code INNER JOIN pack ON pack.code = identity.pack_code INNER JOIN cycle ON cycle.code = pack.cycle_code INNER JOIN faction ON faction.code = identity.faction_code INNER JOIN side ON side.code = faction.side_code INNER JOIN type ON type.code = identity.type_code LEFT JOIN type AS subtype ON subtype.is_subtype AND(subtype.name = identity.keywords OR identity.keywords LIKE(subtype.name || \' - %\'))LEFT JOIN format ON format.code = deck.format_code LEFT JOIN rotation_view AS rotation ON rotation.code = deck.rotation_code LEFT JOIN mwl_view AS mwl ON mwl.code = deck.mwl_code WHERE ${generatedwhere.sql}',
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
        }).asyncMap((QueryRow row) async => DeckResult(
          deck: await deck.mapFromRow(row, tablePrefix: 'nested_0'),
          identity: await card.mapFromRow(row, tablePrefix: 'nested_1'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_2'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_3'),
          faction: await faction.mapFromRow(row, tablePrefix: 'nested_4'),
          side: await side.mapFromRow(row, tablePrefix: 'nested_5'),
          type: await type.mapFromRow(row, tablePrefix: 'nested_6'),
          subtype: await type.mapFromRowOrNull(row, tablePrefix: 'nested_7'),
          format: await format.mapFromRowOrNull(row, tablePrefix: 'nested_8'),
          rotation:
              await rotationView.mapFromRowOrNull(row, tablePrefix: 'nested_9'),
          mwl: await mwlView.mapFromRowOrNull(row, tablePrefix: 'nested_10'),
        ));
  }

  Selectable<DeckData> getDeckById({required String deckId}) {
    return customSelect('SELECT * FROM deck WHERE id = ?1', variables: [
      Variable<String>(deckId)
    ], readsFrom: {
      deck,
    }).asyncMap(deck.mapFromRow);
  }

  Future<int> deleteDecks({required List<String> deckIds}) {
    var $arrayStartIndex = 1;
    final expandeddeckIds = $expandVar($arrayStartIndex, deckIds.length);
    $arrayStartIndex += deckIds.length;
    return customUpdate(
      'DELETE FROM deck WHERE id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deck},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DeckTagData> listDeckTags({ListDeckTags$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.deckTag, this.deck) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT deck_tag.* FROM deck_tag INNER JOIN deck ON deck.id = deck_tag.deck_id WHERE ${generatedwhere.sql} AND NOT deck.deleted',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          deckTag,
          deck,
          ...generatedwhere.watchedTables,
        }).asyncMap(deckTag.mapFromRow);
  }

  Selectable<String> listDistinctDeckTags({ListDistinctDeckTags$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.deckTag, this.deck) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT tag FROM (SELECT deck_tag.tag, COUNT(*) AS count FROM deck_tag INNER JOIN deck ON deck.id = deck_tag.deck_id WHERE ${generatedwhere.sql} AND NOT deck.deleted GROUP BY deck_tag.tag) AS deck_tag ORDER BY count DESC',
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
      'DELETE FROM deck_tag WHERE deck_id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deckTag},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> copyDeckTags(
      {required String newDeckId, required String oldDeckId}) {
    return customInsert(
      'INSERT INTO deck_tag SELECT ?1, tag FROM deck_tag WHERE deck_id = ?2',
      variables: [Variable<String>(newDeckId), Variable<String>(oldDeckId)],
      updates: {deckTag},
    );
  }

  Selectable<DeckCardResult> listDeckCards({ListDeckCards$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(
                this.deckCard,
                this.card,
                this.pack,
                this.cycle,
                this.faction,
                this.side,
                this.type,
                alias(this.type, 'subtype')) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"deck_card"."deck_id" AS "nested_0.deck_id", "deck_card"."card_code" AS "nested_0.card_code", "deck_card"."quantity" AS "nested_0.quantity","card"."code" AS "nested_1.code", "card"."pack_code" AS "nested_1.pack_code", "card"."faction_code" AS "nested_1.faction_code", "card"."type_code" AS "nested_1.type_code", "card"."position" AS "nested_1.position", "card"."title" AS "nested_1.title", "card"."body" AS "nested_1.body", "card"."keywords" AS "nested_1.keywords", "card"."quantity" AS "nested_1.quantity", "card"."cost" AS "nested_1.cost", "card"."deck_limit" AS "nested_1.deck_limit", "card"."faction_cost" AS "nested_1.faction_cost", "card"."uniqueness" AS "nested_1.uniqueness", "card"."strength" AS "nested_1.strength", "card"."agenda_points" AS "nested_1.agenda_points", "card"."memory_cost" AS "nested_1.memory_cost", "card"."advancement_cost" AS "nested_1.advancement_cost", "card"."trash_cost" AS "nested_1.trash_cost", "card"."base_link" AS "nested_1.base_link", "card"."influence_limit" AS "nested_1.influence_limit", "card"."minimum_deck_size" AS "nested_1.minimum_deck_size", "card"."flavor" AS "nested_1.flavor", "card"."illustrator" AS "nested_1.illustrator", "card"."image_url" AS "nested_1.image_url","pack"."code" AS "nested_2.code", "pack"."cycle_code" AS "nested_2.cycle_code", "pack"."position" AS "nested_2.position", "pack"."name" AS "nested_2.name", "pack"."date_release" AS "nested_2.date_release", "pack"."size" AS "nested_2.size","cycle"."code" AS "nested_3.code", "cycle"."position" AS "nested_3.position", "cycle"."name" AS "nested_3.name", "cycle"."size" AS "nested_3.size", "cycle"."rotated" AS "nested_3.rotated","faction"."code" AS "nested_4.code", "faction"."side_code" AS "nested_4.side_code", "faction"."name" AS "nested_4.name", "faction"."color" AS "nested_4.color", "faction"."is_mini" AS "nested_4.is_mini","side"."code" AS "nested_5.code", "side"."name" AS "nested_5.name","type"."code" AS "nested_6.code", "type"."side_code" AS "nested_6.side_code", "type"."position" AS "nested_6.position", "type"."name" AS "nested_6.name", "type"."is_subtype" AS "nested_6.is_subtype","subtype"."code" AS "nested_7.code", "subtype"."side_code" AS "nested_7.side_code", "subtype"."position" AS "nested_7.position", "subtype"."name" AS "nested_7.name", "subtype"."is_subtype" AS "nested_7.is_subtype" FROM deck_card INNER JOIN card ON card.code = deck_card.card_code INNER JOIN pack ON pack.code = card.pack_code INNER JOIN cycle ON cycle.code = pack.cycle_code INNER JOIN faction ON faction.code = card.faction_code INNER JOIN side ON side.code = faction.side_code INNER JOIN type ON type.code = card.type_code LEFT JOIN type AS subtype ON subtype.is_subtype AND(subtype.name = card.keywords OR card.keywords LIKE(subtype.name || \' - %\'))WHERE ${generatedwhere.sql}',
        variables: [
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
          ...generatedwhere.watchedTables,
        }).asyncMap((QueryRow row) async => DeckCardResult(
          deckCard: await deckCard.mapFromRow(row, tablePrefix: 'nested_0'),
          card: await card.mapFromRow(row, tablePrefix: 'nested_1'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_2'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_3'),
          faction: await faction.mapFromRow(row, tablePrefix: 'nested_4'),
          side: await side.mapFromRow(row, tablePrefix: 'nested_5'),
          type: await type.mapFromRow(row, tablePrefix: 'nested_6'),
          subtype: await type.mapFromRowOrNull(row, tablePrefix: 'nested_7'),
        ));
  }

  Future<int> deleteDeckCards({required List<String> deckIds}) {
    var $arrayStartIndex = 1;
    final expandeddeckIds = $expandVar($arrayStartIndex, deckIds.length);
    $arrayStartIndex += deckIds.length;
    return customUpdate(
      'DELETE FROM deck_card WHERE deck_id IN ($expandeddeckIds)',
      variables: [for (var $ in deckIds) Variable<String>($)],
      updates: {deckCard},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> copyDeckCards(
      {required String newDeckId, required String oldDeckId}) {
    return customInsert(
      'INSERT INTO deck_card SELECT ?1, card_code, quantity FROM deck_card WHERE deck_id = ?2',
      variables: [Variable<String>(newDeckId), Variable<String>(oldDeckId)],
      updates: {deckCard},
    );
  }

  Selectable<CycleData> listCycles() {
    return customSelect('SELECT * FROM cycle ORDER BY position DESC',
        variables: [],
        readsFrom: {
          cycle,
        }).asyncMap(cycle.mapFromRow);
  }

  Selectable<CollectionResult> listCollection({required bool inCollection}) {
    return customSelect(
        'SELECT"pack"."code" AS "nested_0.code", "pack"."cycle_code" AS "nested_0.cycle_code", "pack"."position" AS "nested_0.position", "pack"."name" AS "nested_0.name", "pack"."date_release" AS "nested_0.date_release", "pack"."size" AS "nested_0.size","cycle"."code" AS "nested_1.code", "cycle"."position" AS "nested_1.position", "cycle"."name" AS "nested_1.name", "cycle"."size" AS "nested_1.size", "cycle"."rotated" AS "nested_1.rotated",(collection.pack_code IS NOT NULL)AS in_collection FROM pack INNER JOIN cycle ON cycle.code = pack.cycle_code LEFT JOIN collection ON collection.pack_code = pack.code WHERE(NOT ?1 OR(collection.pack_code IS NOT NULL))ORDER BY cycle.position DESC, pack.position DESC',
        variables: [
          Variable<bool>(inCollection)
        ],
        readsFrom: {
          collection,
          pack,
          cycle,
        }).asyncMap((QueryRow row) async => CollectionResult(
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_0'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_1'),
          inCollection: row.read<bool>('in_collection'),
        ));
  }

  Future<int> deleteCollection() {
    return customUpdate(
      'DELETE FROM collection',
      variables: [],
      updates: {collection},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<CardResult> listCards({String? mwlCode, ListCards$where? where}) {
    var $arrayStartIndex = 2;
    final generatedwhere = $write(
        where?.call(this.card, this.pack, this.cycle, this.faction, this.side,
                this.type, alias(this.type, 'subtype'), this.mwlCard) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT"card"."code" AS "nested_0.code", "card"."pack_code" AS "nested_0.pack_code", "card"."faction_code" AS "nested_0.faction_code", "card"."type_code" AS "nested_0.type_code", "card"."position" AS "nested_0.position", "card"."title" AS "nested_0.title", "card"."body" AS "nested_0.body", "card"."keywords" AS "nested_0.keywords", "card"."quantity" AS "nested_0.quantity", "card"."cost" AS "nested_0.cost", "card"."deck_limit" AS "nested_0.deck_limit", "card"."faction_cost" AS "nested_0.faction_cost", "card"."uniqueness" AS "nested_0.uniqueness", "card"."strength" AS "nested_0.strength", "card"."agenda_points" AS "nested_0.agenda_points", "card"."memory_cost" AS "nested_0.memory_cost", "card"."advancement_cost" AS "nested_0.advancement_cost", "card"."trash_cost" AS "nested_0.trash_cost", "card"."base_link" AS "nested_0.base_link", "card"."influence_limit" AS "nested_0.influence_limit", "card"."minimum_deck_size" AS "nested_0.minimum_deck_size", "card"."flavor" AS "nested_0.flavor", "card"."illustrator" AS "nested_0.illustrator", "card"."image_url" AS "nested_0.image_url","pack"."code" AS "nested_1.code", "pack"."cycle_code" AS "nested_1.cycle_code", "pack"."position" AS "nested_1.position", "pack"."name" AS "nested_1.name", "pack"."date_release" AS "nested_1.date_release", "pack"."size" AS "nested_1.size","cycle"."code" AS "nested_2.code", "cycle"."position" AS "nested_2.position", "cycle"."name" AS "nested_2.name", "cycle"."size" AS "nested_2.size", "cycle"."rotated" AS "nested_2.rotated","faction"."code" AS "nested_3.code", "faction"."side_code" AS "nested_3.side_code", "faction"."name" AS "nested_3.name", "faction"."color" AS "nested_3.color", "faction"."is_mini" AS "nested_3.is_mini","side"."code" AS "nested_4.code", "side"."name" AS "nested_4.name","type"."code" AS "nested_5.code", "type"."side_code" AS "nested_5.side_code", "type"."position" AS "nested_5.position", "type"."name" AS "nested_5.name", "type"."is_subtype" AS "nested_5.is_subtype","subtype"."code" AS "nested_6.code", "subtype"."side_code" AS "nested_6.side_code", "subtype"."position" AS "nested_6.position", "subtype"."name" AS "nested_6.name", "subtype"."is_subtype" AS "nested_6.is_subtype" FROM card INNER JOIN pack ON pack.code = card.pack_code INNER JOIN cycle ON cycle.code = pack.cycle_code INNER JOIN faction ON faction.code = card.faction_code INNER JOIN side ON side.code = faction.side_code INNER JOIN type ON type.code = card.type_code LEFT JOIN type AS subtype ON subtype.is_subtype AND(subtype.name = card.keywords OR card.keywords LIKE(subtype.name || \' - %\'))LEFT JOIN mwl_card ON mwl_card.mwl_code = ?1 AND mwl_card.card_title = card.title WHERE ${generatedwhere.sql}',
        variables: [
          Variable<String>(mwlCode),
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
        }).asyncMap((QueryRow row) async => CardResult(
          card: await card.mapFromRow(row, tablePrefix: 'nested_0'),
          pack: await pack.mapFromRow(row, tablePrefix: 'nested_1'),
          cycle: await cycle.mapFromRow(row, tablePrefix: 'nested_2'),
          faction: await faction.mapFromRow(row, tablePrefix: 'nested_3'),
          side: await side.mapFromRow(row, tablePrefix: 'nested_4'),
          type: await type.mapFromRow(row, tablePrefix: 'nested_5'),
          subtype: await type.mapFromRowOrNull(row, tablePrefix: 'nested_6'),
        ));
  }

  Selectable<String> listIdentityCards({required List<String> codeList}) {
    var $arrayStartIndex = 1;
    final expandedcodeList = $expandVar($arrayStartIndex, codeList.length);
    $arrayStartIndex += codeList.length;
    return customSelect(
        'SELECT code FROM card WHERE type_code = \'identity\' AND code IN ($expandedcodeList)',
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
        'SELECT code FROM card WHERE type_code = \'identity\' AND code IN ($expandedcodeList) LIMIT 1',
        variables: [
          for (var $ in codeList) Variable<String>($)
        ],
        readsFrom: {
          card,
        }).map((QueryRow row) => row.read<String>('code'));
  }

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
        OnCreateQuery('INSERT INTO settings DEFAULT VALUES'),
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
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef ListTypes$where = Expression<bool> Function(Type type, Side side);
typedef ListSides$where = Expression<bool> Function(Side side);
typedef ListRotations$where = Expression<bool> Function(RotationView rotation);
typedef ListRotationPacks$where = Expression<bool> Function(
    RotationView rotation,
    Format format,
    RotationCycleView rotation_cycle,
    Cycle cycle,
    Pack pack);
typedef ListRotationCards$where = Expression<bool> Function(
    RotationView rotation,
    Format format,
    RotationCycleView rotation_cycle,
    Cycle cycle,
    Pack pack,
    Card card);

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

typedef CountStuff$cards = Expression<bool> Function(Card card);
typedef CountStuff$cycles = Expression<bool> Function(Cycle cycle);
typedef CountStuff$packs = Expression<bool> Function(Pack pack);
typedef CountStuff$sides = Expression<bool> Function(Side side);
typedef CountStuff$factions = Expression<bool> Function(
    Faction faction, Side side);
typedef CountStuff$types = Expression<bool> Function(Type type, Side side);
typedef ListPacks$where = Expression<bool> Function(Pack pack, Cycle cycle);
typedef ListMwl$where = Expression<bool> Function(MwlView mwl);
typedef ListMwlCard$where = Expression<bool> Function(MwlCard mwl_card);
typedef ListFormats$where = Expression<bool> Function(
    Format format, RotationView current_rotation, MwlView active_mwl);
typedef ListFactions$where = Expression<bool> Function(
    Faction faction, Side side);
typedef ListDecks$where = Expression<bool> Function(
    Deck deck,
    Card identity,
    Pack pack,
    Cycle cycle,
    Faction faction,
    Side side,
    Type type,
    Type subtype,
    Format format,
    RotationView rotation,
    MwlView mwl);
typedef ListDeckTags$where = Expression<bool> Function(
    DeckTag deck_tag, Deck deck);
typedef ListDistinctDeckTags$where = Expression<bool> Function(
    DeckTag deck_tag, Deck deck);
typedef ListDeckCards$where = Expression<bool> Function(
    DeckCard deck_card,
    Card card,
    Pack pack,
    Cycle cycle,
    Faction faction,
    Side side,
    Type type,
    Type subtype);
typedef ListCards$where = Expression<bool> Function(
    Card card,
    Pack pack,
    Cycle cycle,
    Faction faction,
    Side side,
    Type type,
    Type subtype,
    MwlCard mwl_card);
