// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeckData _$DeckDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _DeckData.fromJson(json);
    case 'notifier':
      return DeckNotifierData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DeckData',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DeckData {
  String get id => throw _privateConstructorUsedError;
  String get identityCode => throw _privateConstructorUsedError;
  String? get formatCode => throw _privateConstructorUsedError;
  String? get rotationCode => throw _privateConstructorUsedError;
  String? get mwlCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  DateTime? get remoteUpdated => throw _privateConstructorUsedError;
  DateTime? get synced => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)
        $default, {
    required TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)
        notifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckData value) $default, {
    required TResult Function(DeckNotifierData value) notifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckData value)? $default, {
    TResult? Function(DeckNotifierData value)? notifier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckData value)? $default, {
    TResult Function(DeckNotifierData value)? notifier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckDataCopyWith<DeckData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckDataCopyWith<$Res> {
  factory $DeckDataCopyWith(DeckData value, $Res Function(DeckData) then) =
      _$DeckDataCopyWithImpl<$Res, DeckData>;
  @useResult
  $Res call(
      {String id,
      String identityCode,
      String? formatCode,
      String? rotationCode,
      String? mwlCode,
      String name,
      String description,
      DateTime created,
      DateTime updated,
      bool deleted,
      DateTime? remoteUpdated,
      DateTime? synced});
}

/// @nodoc
class _$DeckDataCopyWithImpl<$Res, $Val extends DeckData>
    implements $DeckDataCopyWith<$Res> {
  _$DeckDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? identityCode = null,
    Object? formatCode = freezed,
    Object? rotationCode = freezed,
    Object? mwlCode = freezed,
    Object? name = null,
    Object? description = null,
    Object? created = null,
    Object? updated = null,
    Object? deleted = null,
    Object? remoteUpdated = freezed,
    Object? synced = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      identityCode: null == identityCode
          ? _value.identityCode
          : identityCode // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: freezed == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rotationCode: freezed == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteUpdated: freezed == remoteUpdated
          ? _value.remoteUpdated
          : remoteUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      synced: freezed == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckDataCopyWith<$Res> implements $DeckDataCopyWith<$Res> {
  factory _$$_DeckDataCopyWith(
          _$_DeckData value, $Res Function(_$_DeckData) then) =
      __$$_DeckDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String identityCode,
      String? formatCode,
      String? rotationCode,
      String? mwlCode,
      String name,
      String description,
      DateTime created,
      DateTime updated,
      bool deleted,
      DateTime? remoteUpdated,
      DateTime? synced});
}

/// @nodoc
class __$$_DeckDataCopyWithImpl<$Res>
    extends _$DeckDataCopyWithImpl<$Res, _$_DeckData>
    implements _$$_DeckDataCopyWith<$Res> {
  __$$_DeckDataCopyWithImpl(
      _$_DeckData _value, $Res Function(_$_DeckData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? identityCode = null,
    Object? formatCode = freezed,
    Object? rotationCode = freezed,
    Object? mwlCode = freezed,
    Object? name = null,
    Object? description = null,
    Object? created = null,
    Object? updated = null,
    Object? deleted = null,
    Object? remoteUpdated = freezed,
    Object? synced = freezed,
  }) {
    return _then(_$_DeckData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      identityCode: null == identityCode
          ? _value.identityCode
          : identityCode // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: freezed == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rotationCode: freezed == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteUpdated: freezed == remoteUpdated
          ? _value.remoteUpdated
          : remoteUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      synced: freezed == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckData extends _DeckData {
  const _$_DeckData(
      {required this.id,
      required this.identityCode,
      required this.formatCode,
      required this.rotationCode,
      required this.mwlCode,
      required this.name,
      required this.description,
      required this.created,
      required this.updated,
      required this.deleted,
      required this.remoteUpdated,
      required this.synced,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_DeckData.fromJson(Map<String, dynamic> json) =>
      _$$_DeckDataFromJson(json);

  @override
  final String id;
  @override
  final String identityCode;
  @override
  final String? formatCode;
  @override
  final String? rotationCode;
  @override
  final String? mwlCode;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final bool deleted;
  @override
  final DateTime? remoteUpdated;
  @override
  final DateTime? synced;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeckData(id: $id, identityCode: $identityCode, formatCode: $formatCode, rotationCode: $rotationCode, mwlCode: $mwlCode, name: $name, description: $description, created: $created, updated: $updated, deleted: $deleted, remoteUpdated: $remoteUpdated, synced: $synced)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.identityCode, identityCode) ||
                other.identityCode == identityCode) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.rotationCode, rotationCode) ||
                other.rotationCode == rotationCode) &&
            (identical(other.mwlCode, mwlCode) || other.mwlCode == mwlCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.remoteUpdated, remoteUpdated) ||
                other.remoteUpdated == remoteUpdated) &&
            (identical(other.synced, synced) || other.synced == synced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      synced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckDataCopyWith<_$_DeckData> get copyWith =>
      __$$_DeckDataCopyWithImpl<_$_DeckData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)
        $default, {
    required TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)
        notifier,
  }) {
    return $default(id, identityCode, formatCode, rotationCode, mwlCode, name,
        description, created, updated, deleted, remoteUpdated, synced);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
  }) {
    return $default?.call(id, identityCode, formatCode, rotationCode, mwlCode,
        name, description, created, updated, deleted, remoteUpdated, synced);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, identityCode, formatCode, rotationCode, mwlCode, name,
          description, created, updated, deleted, remoteUpdated, synced);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckData value) $default, {
    required TResult Function(DeckNotifierData value) notifier,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckData value)? $default, {
    TResult? Function(DeckNotifierData value)? notifier,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckData value)? $default, {
    TResult Function(DeckNotifierData value)? notifier,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckDataToJson(
      this,
    );
  }
}

abstract class _DeckData extends DeckData {
  const factory _DeckData(
      {required final String id,
      required final String identityCode,
      required final String? formatCode,
      required final String? rotationCode,
      required final String? mwlCode,
      required final String name,
      required final String description,
      required final DateTime created,
      required final DateTime updated,
      required final bool deleted,
      required final DateTime? remoteUpdated,
      required final DateTime? synced}) = _$_DeckData;
  const _DeckData._() : super._();

  factory _DeckData.fromJson(Map<String, dynamic> json) = _$_DeckData.fromJson;

  @override
  String get id;
  @override
  String get identityCode;
  @override
  String? get formatCode;
  @override
  String? get rotationCode;
  @override
  String? get mwlCode;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  bool get deleted;
  @override
  DateTime? get remoteUpdated;
  @override
  DateTime? get synced;
  @override
  @JsonKey(ignore: true)
  _$$_DeckDataCopyWith<_$_DeckData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeckNotifierDataCopyWith<$Res>
    implements $DeckDataCopyWith<$Res> {
  factory _$$DeckNotifierDataCopyWith(
          _$DeckNotifierData value, $Res Function(_$DeckNotifierData) then) =
      __$$DeckNotifierDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String identityCode,
      String? formatCode,
      String? rotationCode,
      String? mwlCode,
      String name,
      String description,
      DateTime created,
      DateTime updated,
      bool deleted,
      DateTime? remoteUpdated,
      DateTime? synced,
      Map<String, int> cards,
      List<String> tags,
      DeckSaveState state});
}

/// @nodoc
class __$$DeckNotifierDataCopyWithImpl<$Res>
    extends _$DeckDataCopyWithImpl<$Res, _$DeckNotifierData>
    implements _$$DeckNotifierDataCopyWith<$Res> {
  __$$DeckNotifierDataCopyWithImpl(
      _$DeckNotifierData _value, $Res Function(_$DeckNotifierData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? identityCode = null,
    Object? formatCode = freezed,
    Object? rotationCode = freezed,
    Object? mwlCode = freezed,
    Object? name = null,
    Object? description = null,
    Object? created = null,
    Object? updated = null,
    Object? deleted = null,
    Object? remoteUpdated = freezed,
    Object? synced = freezed,
    Object? cards = null,
    Object? tags = null,
    Object? state = null,
  }) {
    return _then(_$DeckNotifierData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      identityCode: null == identityCode
          ? _value.identityCode
          : identityCode // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: freezed == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rotationCode: freezed == rotationCode
          ? _value.rotationCode
          : rotationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteUpdated: freezed == remoteUpdated
          ? _value.remoteUpdated
          : remoteUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      synced: freezed == synced
          ? _value.synced
          : synced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeckSaveState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeckNotifierData extends DeckNotifierData with DeckNotifierMixin {
  const _$DeckNotifierData(
      {required this.id,
      required this.identityCode,
      required this.formatCode,
      required this.rotationCode,
      required this.mwlCode,
      required this.name,
      required this.description,
      required this.created,
      required this.updated,
      required this.deleted,
      required this.remoteUpdated,
      required this.synced,
      required final Map<String, int> cards,
      required final List<String> tags,
      required this.state,
      final String? $type})
      : _cards = cards,
        _tags = tags,
        $type = $type ?? 'notifier',
        super._();

  factory _$DeckNotifierData.fromJson(Map<String, dynamic> json) =>
      _$$DeckNotifierDataFromJson(json);

  @override
  final String id;
  @override
  final String identityCode;
  @override
  final String? formatCode;
  @override
  final String? rotationCode;
  @override
  final String? mwlCode;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final bool deleted;
  @override
  final DateTime? remoteUpdated;
  @override
  final DateTime? synced;
  final Map<String, int> _cards;
  @override
  Map<String, int> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DeckSaveState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeckData.notifier(id: $id, identityCode: $identityCode, formatCode: $formatCode, rotationCode: $rotationCode, mwlCode: $mwlCode, name: $name, description: $description, created: $created, updated: $updated, deleted: $deleted, remoteUpdated: $remoteUpdated, synced: $synced, cards: $cards, tags: $tags, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeckNotifierData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.identityCode, identityCode) ||
                other.identityCode == identityCode) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.rotationCode, rotationCode) ||
                other.rotationCode == rotationCode) &&
            (identical(other.mwlCode, mwlCode) || other.mwlCode == mwlCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.remoteUpdated, remoteUpdated) ||
                other.remoteUpdated == remoteUpdated) &&
            (identical(other.synced, synced) || other.synced == synced) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      synced,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_tags),
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeckNotifierDataCopyWith<_$DeckNotifierData> get copyWith =>
      __$$DeckNotifierDataCopyWithImpl<_$DeckNotifierData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)
        $default, {
    required TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)
        notifier,
  }) {
    return notifier(
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
        synced,
        cards,
        tags,
        state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult? Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
  }) {
    return notifier?.call(
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
        synced,
        cards,
        tags,
        state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced)?
        $default, {
    TResult Function(
            String id,
            String identityCode,
            String? formatCode,
            String? rotationCode,
            String? mwlCode,
            String name,
            String description,
            DateTime created,
            DateTime updated,
            bool deleted,
            DateTime? remoteUpdated,
            DateTime? synced,
            Map<String, int> cards,
            List<String> tags,
            DeckSaveState state)?
        notifier,
    required TResult orElse(),
  }) {
    if (notifier != null) {
      return notifier(
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
          synced,
          cards,
          tags,
          state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckData value) $default, {
    required TResult Function(DeckNotifierData value) notifier,
  }) {
    return notifier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckData value)? $default, {
    TResult? Function(DeckNotifierData value)? notifier,
  }) {
    return notifier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckData value)? $default, {
    TResult Function(DeckNotifierData value)? notifier,
    required TResult orElse(),
  }) {
    if (notifier != null) {
      return notifier(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeckNotifierDataToJson(
      this,
    );
  }
}

abstract class DeckNotifierData extends DeckData implements DeckNotifierMixin {
  const factory DeckNotifierData(
      {required final String id,
      required final String identityCode,
      required final String? formatCode,
      required final String? rotationCode,
      required final String? mwlCode,
      required final String name,
      required final String description,
      required final DateTime created,
      required final DateTime updated,
      required final bool deleted,
      required final DateTime? remoteUpdated,
      required final DateTime? synced,
      required final Map<String, int> cards,
      required final List<String> tags,
      required final DeckSaveState state}) = _$DeckNotifierData;
  const DeckNotifierData._() : super._();

  factory DeckNotifierData.fromJson(Map<String, dynamic> json) =
      _$DeckNotifierData.fromJson;

  @override
  String get id;
  @override
  String get identityCode;
  @override
  String? get formatCode;
  @override
  String? get rotationCode;
  @override
  String? get mwlCode;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  bool get deleted;
  @override
  DateTime? get remoteUpdated;
  @override
  DateTime? get synced;
  Map<String, int> get cards;
  List<String> get tags;
  DeckSaveState get state;
  @override
  @JsonKey(ignore: true)
  _$$DeckNotifierDataCopyWith<_$DeckNotifierData> get copyWith =>
      throw _privateConstructorUsedError;
}

DeckResult _$DeckResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _DeckResult.fromJson(json);
    case 'full':
      return DeckFullResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DeckResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DeckResult {
  DeckData get deck => throw _privateConstructorUsedError;
  CardData get identity => throw _privateConstructorUsedError;
  PackData get pack => throw _privateConstructorUsedError;
  CycleData get cycle => throw _privateConstructorUsedError;
  FactionData get faction => throw _privateConstructorUsedError;
  SideData get side => throw _privateConstructorUsedError;
  TypeData get type => throw _privateConstructorUsedError;
  TypeData? get subtype => throw _privateConstructorUsedError;
  FormatData? get format => throw _privateConstructorUsedError;
  RotationViewData? get rotation => throw _privateConstructorUsedError;
  MwlViewData? get mwl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)
        $default, {
    required TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)
        full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckResult value) $default, {
    required TResult Function(DeckFullResult value) full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckResult value)? $default, {
    TResult? Function(DeckFullResult value)? full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckResult value)? $default, {
    TResult Function(DeckFullResult value)? full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckResultCopyWith<DeckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckResultCopyWith<$Res> {
  factory $DeckResultCopyWith(
          DeckResult value, $Res Function(DeckResult) then) =
      _$DeckResultCopyWithImpl<$Res, DeckResult>;
  @useResult
  $Res call(
      {DeckData deck,
      CardData identity,
      PackData pack,
      CycleData cycle,
      FactionData faction,
      SideData side,
      TypeData type,
      TypeData? subtype,
      FormatData? format,
      RotationViewData? rotation,
      MwlViewData? mwl});

  $DeckDataCopyWith<$Res> get deck;
  $CardDataCopyWith<$Res> get identity;
  $PackDataCopyWith<$Res> get pack;
  $CycleDataCopyWith<$Res> get cycle;
  $FactionDataCopyWith<$Res> get faction;
  $SideDataCopyWith<$Res> get side;
  $TypeDataCopyWith<$Res> get type;
  $TypeDataCopyWith<$Res>? get subtype;
  $FormatDataCopyWith<$Res>? get format;
}

/// @nodoc
class _$DeckResultCopyWithImpl<$Res, $Val extends DeckResult>
    implements $DeckResultCopyWith<$Res> {
  _$DeckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? identity = null,
    Object? pack = null,
    Object? cycle = null,
    Object? faction = null,
    Object? side = null,
    Object? type = null,
    Object? subtype = freezed,
    Object? format = freezed,
    Object? rotation = freezed,
    Object? mwl = freezed,
  }) {
    return _then(_value.copyWith(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as DeckData,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as CardData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as TypeData?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData?,
      rotation: freezed == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData?,
      mwl: freezed == mwl
          ? _value.mwl
          : mwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeckDataCopyWith<$Res> get deck {
    return $DeckDataCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<$Res> get identity {
    return $CardDataCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PackDataCopyWith<$Res> get pack {
    return $PackDataCopyWith<$Res>(_value.pack, (value) {
      return _then(_value.copyWith(pack: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CycleDataCopyWith<$Res> get cycle {
    return $CycleDataCopyWith<$Res>(_value.cycle, (value) {
      return _then(_value.copyWith(cycle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FactionDataCopyWith<$Res> get faction {
    return $FactionDataCopyWith<$Res>(_value.faction, (value) {
      return _then(_value.copyWith(faction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SideDataCopyWith<$Res> get side {
    return $SideDataCopyWith<$Res>(_value.side, (value) {
      return _then(_value.copyWith(side: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeDataCopyWith<$Res> get type {
    return $TypeDataCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeDataCopyWith<$Res>? get subtype {
    if (_value.subtype == null) {
      return null;
    }

    return $TypeDataCopyWith<$Res>(_value.subtype!, (value) {
      return _then(_value.copyWith(subtype: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FormatDataCopyWith<$Res>? get format {
    if (_value.format == null) {
      return null;
    }

    return $FormatDataCopyWith<$Res>(_value.format!, (value) {
      return _then(_value.copyWith(format: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeckResultCopyWith<$Res>
    implements $DeckResultCopyWith<$Res> {
  factory _$$_DeckResultCopyWith(
          _$_DeckResult value, $Res Function(_$_DeckResult) then) =
      __$$_DeckResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeckData deck,
      CardData identity,
      PackData pack,
      CycleData cycle,
      FactionData faction,
      SideData side,
      TypeData type,
      TypeData? subtype,
      FormatData? format,
      RotationViewData? rotation,
      MwlViewData? mwl});

  @override
  $DeckDataCopyWith<$Res> get deck;
  @override
  $CardDataCopyWith<$Res> get identity;
  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
  @override
  $FactionDataCopyWith<$Res> get faction;
  @override
  $SideDataCopyWith<$Res> get side;
  @override
  $TypeDataCopyWith<$Res> get type;
  @override
  $TypeDataCopyWith<$Res>? get subtype;
  @override
  $FormatDataCopyWith<$Res>? get format;
}

/// @nodoc
class __$$_DeckResultCopyWithImpl<$Res>
    extends _$DeckResultCopyWithImpl<$Res, _$_DeckResult>
    implements _$$_DeckResultCopyWith<$Res> {
  __$$_DeckResultCopyWithImpl(
      _$_DeckResult _value, $Res Function(_$_DeckResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? identity = null,
    Object? pack = null,
    Object? cycle = null,
    Object? faction = null,
    Object? side = null,
    Object? type = null,
    Object? subtype = freezed,
    Object? format = freezed,
    Object? rotation = freezed,
    Object? mwl = freezed,
  }) {
    return _then(_$_DeckResult(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as DeckData,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as CardData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as TypeData?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData?,
      rotation: freezed == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData?,
      mwl: freezed == mwl
          ? _value.mwl
          : mwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckResult extends _DeckResult {
  const _$_DeckResult(
      {required this.deck,
      required this.identity,
      required this.pack,
      required this.cycle,
      required this.faction,
      required this.side,
      required this.type,
      required this.subtype,
      required this.format,
      required this.rotation,
      required this.mwl,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_DeckResult.fromJson(Map<String, dynamic> json) =>
      _$$_DeckResultFromJson(json);

  @override
  final DeckData deck;
  @override
  final CardData identity;
  @override
  final PackData pack;
  @override
  final CycleData cycle;
  @override
  final FactionData faction;
  @override
  final SideData side;
  @override
  final TypeData type;
  @override
  final TypeData? subtype;
  @override
  final FormatData? format;
  @override
  final RotationViewData? rotation;
  @override
  final MwlViewData? mwl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeckResult(deck: $deck, identity: $identity, pack: $pack, cycle: $cycle, faction: $faction, side: $side, type: $type, subtype: $subtype, format: $format, rotation: $rotation, mwl: $mwl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckResult &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.faction, faction) || other.faction == faction) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subtype, subtype) || other.subtype == subtype) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.mwl, mwl) || other.mwl == mwl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deck, identity, pack, cycle,
      faction, side, type, subtype, format, rotation, mwl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckResultCopyWith<_$_DeckResult> get copyWith =>
      __$$_DeckResultCopyWithImpl<_$_DeckResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)
        $default, {
    required TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)
        full,
  }) {
    return $default(deck, identity, pack, cycle, faction, side, type, subtype,
        format, rotation, mwl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
  }) {
    return $default?.call(deck, identity, pack, cycle, faction, side, type,
        subtype, format, rotation, mwl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(deck, identity, pack, cycle, faction, side, type, subtype,
          format, rotation, mwl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckResult value) $default, {
    required TResult Function(DeckFullResult value) full,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckResult value)? $default, {
    TResult? Function(DeckFullResult value)? full,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckResult value)? $default, {
    TResult Function(DeckFullResult value)? full,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckResultToJson(
      this,
    );
  }
}

abstract class _DeckResult extends DeckResult {
  const factory _DeckResult(
      {required final DeckData deck,
      required final CardData identity,
      required final PackData pack,
      required final CycleData cycle,
      required final FactionData faction,
      required final SideData side,
      required final TypeData type,
      required final TypeData? subtype,
      required final FormatData? format,
      required final RotationViewData? rotation,
      required final MwlViewData? mwl}) = _$_DeckResult;
  const _DeckResult._() : super._();

  factory _DeckResult.fromJson(Map<String, dynamic> json) =
      _$_DeckResult.fromJson;

  @override
  DeckData get deck;
  @override
  CardData get identity;
  @override
  PackData get pack;
  @override
  CycleData get cycle;
  @override
  FactionData get faction;
  @override
  SideData get side;
  @override
  TypeData get type;
  @override
  TypeData? get subtype;
  @override
  FormatData? get format;
  @override
  RotationViewData? get rotation;
  @override
  MwlViewData? get mwl;
  @override
  @JsonKey(ignore: true)
  _$$_DeckResultCopyWith<_$_DeckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeckFullResultCopyWith<$Res>
    implements $DeckResultCopyWith<$Res> {
  factory _$$DeckFullResultCopyWith(
          _$DeckFullResult value, $Res Function(_$DeckFullResult) then) =
      __$$DeckFullResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeckData deck,
      CardData identity,
      PackData pack,
      CycleData cycle,
      FactionData faction,
      SideData side,
      TypeData type,
      TypeData? subtype,
      FormatData? format,
      RotationViewData? rotation,
      MwlViewData? mwl,
      @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
          Map<CardResult, int> cards,
      List<String> tags});

  @override
  $DeckDataCopyWith<$Res> get deck;
  @override
  $CardDataCopyWith<$Res> get identity;
  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
  @override
  $FactionDataCopyWith<$Res> get faction;
  @override
  $SideDataCopyWith<$Res> get side;
  @override
  $TypeDataCopyWith<$Res> get type;
  @override
  $TypeDataCopyWith<$Res>? get subtype;
  @override
  $FormatDataCopyWith<$Res>? get format;
}

/// @nodoc
class __$$DeckFullResultCopyWithImpl<$Res>
    extends _$DeckResultCopyWithImpl<$Res, _$DeckFullResult>
    implements _$$DeckFullResultCopyWith<$Res> {
  __$$DeckFullResultCopyWithImpl(
      _$DeckFullResult _value, $Res Function(_$DeckFullResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? identity = null,
    Object? pack = null,
    Object? cycle = null,
    Object? faction = null,
    Object? side = null,
    Object? type = null,
    Object? subtype = freezed,
    Object? format = freezed,
    Object? rotation = freezed,
    Object? mwl = freezed,
    Object? cards = null,
    Object? tags = null,
  }) {
    return _then(_$DeckFullResult(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as DeckData,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as CardData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      faction: null == faction
          ? _value.faction
          : faction // ignore: cast_nullable_to_non_nullable
              as FactionData,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as SideData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeData,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as TypeData?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData?,
      rotation: freezed == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData?,
      mwl: freezed == mwl
          ? _value.mwl
          : mwl // ignore: cast_nullable_to_non_nullable
              as MwlViewData?,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<CardResult, int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeckFullResult extends DeckFullResult with DeckFullResultMixin {
  const _$DeckFullResult(
      {required this.deck,
      required this.identity,
      required this.pack,
      required this.cycle,
      required this.faction,
      required this.side,
      required this.type,
      required this.subtype,
      required this.format,
      required this.rotation,
      required this.mwl,
      @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
          required final Map<CardResult, int> cards,
      required final List<String> tags,
      final String? $type})
      : _cards = cards,
        _tags = tags,
        $type = $type ?? 'full',
        super._();

  factory _$DeckFullResult.fromJson(Map<String, dynamic> json) =>
      _$$DeckFullResultFromJson(json);

  @override
  final DeckData deck;
  @override
  final CardData identity;
  @override
  final PackData pack;
  @override
  final CycleData cycle;
  @override
  final FactionData faction;
  @override
  final SideData side;
  @override
  final TypeData type;
  @override
  final TypeData? subtype;
  @override
  final FormatData? format;
  @override
  final RotationViewData? rotation;
  @override
  final MwlViewData? mwl;
  final Map<CardResult, int> _cards;
  @override
  @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
  Map<CardResult, int> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeckResult.full(deck: $deck, identity: $identity, pack: $pack, cycle: $cycle, faction: $faction, side: $side, type: $type, subtype: $subtype, format: $format, rotation: $rotation, mwl: $mwl, cards: $cards, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeckFullResult &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.faction, faction) || other.faction == faction) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subtype, subtype) || other.subtype == subtype) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.mwl, mwl) || other.mwl == mwl) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deck,
      identity,
      pack,
      cycle,
      faction,
      side,
      type,
      subtype,
      format,
      rotation,
      mwl,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeckFullResultCopyWith<_$DeckFullResult> get copyWith =>
      __$$DeckFullResultCopyWithImpl<_$DeckFullResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)
        $default, {
    required TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)
        full,
  }) {
    return full(deck, identity, pack, cycle, faction, side, type, subtype,
        format, rotation, mwl, cards, tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult? Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
  }) {
    return full?.call(deck, identity, pack, cycle, faction, side, type, subtype,
        format, rotation, mwl, cards, tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl)?
        $default, {
    TResult Function(
            DeckData deck,
            CardData identity,
            PackData pack,
            CycleData cycle,
            FactionData faction,
            SideData side,
            TypeData type,
            TypeData? subtype,
            FormatData? format,
            RotationViewData? rotation,
            MwlViewData? mwl,
            @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
                Map<CardResult, int> cards,
            List<String> tags)?
        full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(deck, identity, pack, cycle, faction, side, type, subtype,
          format, rotation, mwl, cards, tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeckResult value) $default, {
    required TResult Function(DeckFullResult value) full,
  }) {
    return full(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeckResult value)? $default, {
    TResult? Function(DeckFullResult value)? full,
  }) {
    return full?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeckResult value)? $default, {
    TResult Function(DeckFullResult value)? full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeckFullResultToJson(
      this,
    );
  }
}

abstract class DeckFullResult extends DeckResult
    implements DeckFullResultMixin {
  const factory DeckFullResult(
      {required final DeckData deck,
      required final CardData identity,
      required final PackData pack,
      required final CycleData cycle,
      required final FactionData faction,
      required final SideData side,
      required final TypeData type,
      required final TypeData? subtype,
      required final FormatData? format,
      required final RotationViewData? rotation,
      required final MwlViewData? mwl,
      @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
          required final Map<CardResult, int> cards,
      required final List<String> tags}) = _$DeckFullResult;
  const DeckFullResult._() : super._();

  factory DeckFullResult.fromJson(Map<String, dynamic> json) =
      _$DeckFullResult.fromJson;

  @override
  DeckData get deck;
  @override
  CardData get identity;
  @override
  PackData get pack;
  @override
  CycleData get cycle;
  @override
  FactionData get faction;
  @override
  SideData get side;
  @override
  TypeData get type;
  @override
  TypeData? get subtype;
  @override
  FormatData? get format;
  @override
  RotationViewData? get rotation;
  @override
  MwlViewData? get mwl;
  @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson)
  Map<CardResult, int> get cards;
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$DeckFullResultCopyWith<_$DeckFullResult> get copyWith =>
      throw _privateConstructorUsedError;
}

DeckCompareResult _$DeckCompareResultFromJson(Map<String, dynamic> json) {
  return _DeckCompareResult.fromJson(json);
}

/// @nodoc
mixin _$DeckCompareResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<String, int> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCompareResultCopyWith<DeckCompareResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCompareResultCopyWith<$Res> {
  factory $DeckCompareResultCopyWith(
          DeckCompareResult value, $Res Function(DeckCompareResult) then) =
      _$DeckCompareResultCopyWithImpl<$Res, DeckCompareResult>;
  @useResult
  $Res call({String id, String name, Map<String, int> cards});
}

/// @nodoc
class _$DeckCompareResultCopyWithImpl<$Res, $Val extends DeckCompareResult>
    implements $DeckCompareResultCopyWith<$Res> {
  _$DeckCompareResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCompareResultCopyWith<$Res>
    implements $DeckCompareResultCopyWith<$Res> {
  factory _$$_DeckCompareResultCopyWith(_$_DeckCompareResult value,
          $Res Function(_$_DeckCompareResult) then) =
      __$$_DeckCompareResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, Map<String, int> cards});
}

/// @nodoc
class __$$_DeckCompareResultCopyWithImpl<$Res>
    extends _$DeckCompareResultCopyWithImpl<$Res, _$_DeckCompareResult>
    implements _$$_DeckCompareResultCopyWith<$Res> {
  __$$_DeckCompareResultCopyWithImpl(
      _$_DeckCompareResult _value, $Res Function(_$_DeckCompareResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cards = null,
  }) {
    return _then(_$_DeckCompareResult(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckCompareResult implements _DeckCompareResult {
  const _$_DeckCompareResult(
      {required this.id,
      required this.name,
      required final Map<String, int> cards})
      : _cards = cards;

  factory _$_DeckCompareResult.fromJson(Map<String, dynamic> json) =>
      _$$_DeckCompareResultFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final Map<String, int> _cards;
  @override
  Map<String, int> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  @override
  String toString() {
    return 'DeckCompareResult(id: $id, name: $name, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCompareResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCompareResultCopyWith<_$_DeckCompareResult> get copyWith =>
      __$$_DeckCompareResultCopyWithImpl<_$_DeckCompareResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckCompareResultToJson(
      this,
    );
  }
}

abstract class _DeckCompareResult implements DeckCompareResult {
  const factory _DeckCompareResult(
      {required final String id,
      required final String name,
      required final Map<String, int> cards}) = _$_DeckCompareResult;

  factory _DeckCompareResult.fromJson(Map<String, dynamic> json) =
      _$_DeckCompareResult.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Map<String, int> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCompareResultCopyWith<_$_DeckCompareResult> get copyWith =>
      throw _privateConstructorUsedError;
}
