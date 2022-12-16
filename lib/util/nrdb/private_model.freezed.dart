// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NrdbDeckResult _$NrdbDeckResultFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'success':
      return NrdbDeckSuccessResult.fromJson(json);
    case 'failure':
      return NrdbDeckFailureResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'NrdbDeckResult',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$NrdbDeckResult {
  String get versionNumber => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NrdbDeckSuccessResult value) success,
    required TResult Function(NrdbDeckFailureResult value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NrdbDeckSuccessResult value)? success,
    TResult? Function(NrdbDeckFailureResult value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NrdbDeckSuccessResult value)? success,
    TResult Function(NrdbDeckFailureResult value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NrdbDeckResultCopyWith<NrdbDeckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NrdbDeckResultCopyWith<$Res> {
  factory $NrdbDeckResultCopyWith(
          NrdbDeckResult value, $Res Function(NrdbDeckResult) then) =
      _$NrdbDeckResultCopyWithImpl<$Res, NrdbDeckResult>;
  @useResult
  $Res call({String versionNumber, bool success});
}

/// @nodoc
class _$NrdbDeckResultCopyWithImpl<$Res, $Val extends NrdbDeckResult>
    implements $NrdbDeckResultCopyWith<$Res> {
  _$NrdbDeckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionNumber = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NrdbDeckSuccessResultCopyWith<$Res>
    implements $NrdbDeckResultCopyWith<$Res> {
  factory _$$NrdbDeckSuccessResultCopyWith(_$NrdbDeckSuccessResult value,
          $Res Function(_$NrdbDeckSuccessResult) then) =
      __$$NrdbDeckSuccessResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String versionNumber, bool success, NrdbDeck data, int total});

  $NrdbDeckCopyWith<$Res> get data;
}

/// @nodoc
class __$$NrdbDeckSuccessResultCopyWithImpl<$Res>
    extends _$NrdbDeckResultCopyWithImpl<$Res, _$NrdbDeckSuccessResult>
    implements _$$NrdbDeckSuccessResultCopyWith<$Res> {
  __$$NrdbDeckSuccessResultCopyWithImpl(_$NrdbDeckSuccessResult _value,
      $Res Function(_$NrdbDeckSuccessResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionNumber = null,
    Object? success = null,
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_$NrdbDeckSuccessResult(
      null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NrdbDeck,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NrdbDeckCopyWith<$Res> get data {
    return $NrdbDeckCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NrdbDeckSuccessResult implements NrdbDeckSuccessResult {
  const _$NrdbDeckSuccessResult(
      this.versionNumber, this.success, this.data, this.total,
      {final String? $type})
      : $type = $type ?? 'success';

  factory _$NrdbDeckSuccessResult.fromJson(Map<String, dynamic> json) =>
      _$$NrdbDeckSuccessResultFromJson(json);

  @override
  final String versionNumber;
  @override
  final bool success;
  @override
  final NrdbDeck data;
  @override
  final int total;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NrdbDeckResult.success(versionNumber: $versionNumber, success: $success, data: $data, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NrdbDeckSuccessResult &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, versionNumber, success, data, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NrdbDeckSuccessResultCopyWith<_$NrdbDeckSuccessResult> get copyWith =>
      __$$NrdbDeckSuccessResultCopyWithImpl<_$NrdbDeckSuccessResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failure,
  }) {
    return success(versionNumber, this.success, data, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failure,
  }) {
    return success?.call(versionNumber, this.success, data, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(versionNumber, this.success, data, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NrdbDeckSuccessResult value) success,
    required TResult Function(NrdbDeckFailureResult value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NrdbDeckSuccessResult value)? success,
    TResult? Function(NrdbDeckFailureResult value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NrdbDeckSuccessResult value)? success,
    TResult Function(NrdbDeckFailureResult value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class NrdbDeckSuccessResult implements NrdbDeckResult {
  const factory NrdbDeckSuccessResult(
      final String versionNumber,
      final bool success,
      final NrdbDeck data,
      final int total) = _$NrdbDeckSuccessResult;

  factory NrdbDeckSuccessResult.fromJson(Map<String, dynamic> json) =
      _$NrdbDeckSuccessResult.fromJson;

  @override
  String get versionNumber;
  @override
  bool get success;
  NrdbDeck get data;
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$NrdbDeckSuccessResultCopyWith<_$NrdbDeckSuccessResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NrdbDeckFailureResultCopyWith<$Res>
    implements $NrdbDeckResultCopyWith<$Res> {
  factory _$$NrdbDeckFailureResultCopyWith(_$NrdbDeckFailureResult value,
          $Res Function(_$NrdbDeckFailureResult) then) =
      __$$NrdbDeckFailureResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String versionNumber, bool success, String msg});
}

/// @nodoc
class __$$NrdbDeckFailureResultCopyWithImpl<$Res>
    extends _$NrdbDeckResultCopyWithImpl<$Res, _$NrdbDeckFailureResult>
    implements _$$NrdbDeckFailureResultCopyWith<$Res> {
  __$$NrdbDeckFailureResultCopyWithImpl(_$NrdbDeckFailureResult _value,
      $Res Function(_$NrdbDeckFailureResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionNumber = null,
    Object? success = null,
    Object? msg = null,
  }) {
    return _then(_$NrdbDeckFailureResult(
      null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NrdbDeckFailureResult implements NrdbDeckFailureResult {
  const _$NrdbDeckFailureResult(this.versionNumber, this.success, this.msg,
      {final String? $type})
      : $type = $type ?? 'failure';

  factory _$NrdbDeckFailureResult.fromJson(Map<String, dynamic> json) =>
      _$$NrdbDeckFailureResultFromJson(json);

  @override
  final String versionNumber;
  @override
  final bool success;
  @override
  final String msg;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NrdbDeckResult.failure(versionNumber: $versionNumber, success: $success, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NrdbDeckFailureResult &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, versionNumber, success, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NrdbDeckFailureResultCopyWith<_$NrdbDeckFailureResult> get copyWith =>
      __$$NrdbDeckFailureResultCopyWithImpl<_$NrdbDeckFailureResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)
        success,
    required TResult Function(String versionNumber, bool success, String msg)
        failure,
  }) {
    return failure(versionNumber, this.success, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult? Function(String versionNumber, bool success, String msg)? failure,
  }) {
    return failure?.call(versionNumber, this.success, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String versionNumber, bool success, NrdbDeck data, int total)?
        success,
    TResult Function(String versionNumber, bool success, String msg)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(versionNumber, this.success, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NrdbDeckSuccessResult value) success,
    required TResult Function(NrdbDeckFailureResult value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NrdbDeckSuccessResult value)? success,
    TResult? Function(NrdbDeckFailureResult value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NrdbDeckSuccessResult value)? success,
    TResult Function(NrdbDeckFailureResult value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class NrdbDeckFailureResult implements NrdbDeckResult {
  const factory NrdbDeckFailureResult(
          final String versionNumber, final bool success, final String msg) =
      _$NrdbDeckFailureResult;

  factory NrdbDeckFailureResult.fromJson(Map<String, dynamic> json) =
      _$NrdbDeckFailureResult.fromJson;

  @override
  String get versionNumber;
  @override
  bool get success;
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$NrdbDeckFailureResultCopyWith<_$NrdbDeckFailureResult> get copyWith =>
      throw _privateConstructorUsedError;
}

NrdbDeck _$NrdbDeckFromJson(Map<String, dynamic> json) {
  return _NrdbDeck.fromJson(json);
}

/// @nodoc
mixin _$NrdbDeck {
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get mwlCode => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;
  DateTime get dateUpdate => throw _privateConstructorUsedError;
  Map<String, int> get cards => throw _privateConstructorUsedError;
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NrdbDeckCopyWith<NrdbDeck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NrdbDeckCopyWith<$Res> {
  factory $NrdbDeckCopyWith(NrdbDeck value, $Res Function(NrdbDeck) then) =
      _$NrdbDeckCopyWithImpl<$Res, NrdbDeck>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          String id,
      String name,
      String description,
      String? mwlCode,
      DateTime dateCreation,
      DateTime dateUpdate,
      Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          List<String> tags});
}

/// @nodoc
class _$NrdbDeckCopyWithImpl<$Res, $Val extends NrdbDeck>
    implements $NrdbDeckCopyWith<$Res> {
  _$NrdbDeckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? mwlCode = freezed,
    Object? dateCreation = null,
    Object? dateUpdate = null,
    Object? cards = null,
    Object? tags = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdate: null == dateUpdate
          ? _value.dateUpdate
          : dateUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NrdbDeckCopyWith<$Res> implements $NrdbDeckCopyWith<$Res> {
  factory _$$_NrdbDeckCopyWith(
          _$_NrdbDeck value, $Res Function(_$_NrdbDeck) then) =
      __$$_NrdbDeckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          String id,
      String name,
      String description,
      String? mwlCode,
      DateTime dateCreation,
      DateTime dateUpdate,
      Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          List<String> tags});
}

/// @nodoc
class __$$_NrdbDeckCopyWithImpl<$Res>
    extends _$NrdbDeckCopyWithImpl<$Res, _$_NrdbDeck>
    implements _$$_NrdbDeckCopyWith<$Res> {
  __$$_NrdbDeckCopyWithImpl(
      _$_NrdbDeck _value, $Res Function(_$_NrdbDeck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? mwlCode = freezed,
    Object? dateCreation = null,
    Object? dateUpdate = null,
    Object? cards = null,
    Object? tags = null,
  }) {
    return _then(_$_NrdbDeck(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mwlCode: freezed == mwlCode
          ? _value.mwlCode
          : mwlCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreation: null == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdate: null == dateUpdate
          ? _value.dateUpdate
          : dateUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NrdbDeck implements _NrdbDeck {
  const _$_NrdbDeck(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          required this.id,
      required this.name,
      required this.description,
      required this.mwlCode,
      required this.dateCreation,
      required this.dateUpdate,
      required final Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          required final List<String> tags})
      : _cards = cards,
        _tags = tags;

  factory _$_NrdbDeck.fromJson(Map<String, dynamic> json) =>
      _$$_NrdbDeckFromJson(json);

  @override
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? mwlCode;
  @override
  final DateTime dateCreation;
  @override
  final DateTime dateUpdate;
  final Map<String, int> _cards;
  @override
  Map<String, int> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  final List<String> _tags;
  @override
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'NrdbDeck(id: $id, name: $name, description: $description, mwlCode: $mwlCode, dateCreation: $dateCreation, dateUpdate: $dateUpdate, cards: $cards, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NrdbDeck &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mwlCode, mwlCode) || other.mwlCode == mwlCode) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.dateUpdate, dateUpdate) ||
                other.dateUpdate == dateUpdate) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      mwlCode,
      dateCreation,
      dateUpdate,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NrdbDeckCopyWith<_$_NrdbDeck> get copyWith =>
      __$$_NrdbDeckCopyWithImpl<_$_NrdbDeck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NrdbDeckToJson(
      this,
    );
  }
}

abstract class _NrdbDeck implements NrdbDeck {
  const factory _NrdbDeck(
      {@JsonKey(fromJson: NrdbDeck.idFromJson)
          required final String id,
      required final String name,
      required final String description,
      required final String? mwlCode,
      required final DateTime dateCreation,
      required final DateTime dateUpdate,
      required final Map<String, int> cards,
      @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
          required final List<String> tags}) = _$_NrdbDeck;

  factory _NrdbDeck.fromJson(Map<String, dynamic> json) = _$_NrdbDeck.fromJson;

  @override
  @JsonKey(fromJson: NrdbDeck.idFromJson)
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get mwlCode;
  @override
  DateTime get dateCreation;
  @override
  DateTime get dateUpdate;
  @override
  Map<String, int> get cards;
  @override
  @JsonKey(fromJson: NrdbDeck.tagsFromJson, toJson: NrdbDeck.tagsToJson)
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_NrdbDeckCopyWith<_$_NrdbDeck> get copyWith =>
      throw _privateConstructorUsedError;
}

NrdbUser _$NrdbUserFromJson(Map<String, dynamic> json) {
  return _NrdbUser.fromJson(json);
}

/// @nodoc
mixin _$NrdbUser {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get reputation => throw _privateConstructorUsedError;
  bool get sharing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NrdbUserCopyWith<NrdbUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NrdbUserCopyWith<$Res> {
  factory $NrdbUserCopyWith(NrdbUser value, $Res Function(NrdbUser) then) =
      _$NrdbUserCopyWithImpl<$Res, NrdbUser>;
  @useResult
  $Res call(
      {int id, String username, String email, int reputation, bool sharing});
}

/// @nodoc
class _$NrdbUserCopyWithImpl<$Res, $Val extends NrdbUser>
    implements $NrdbUserCopyWith<$Res> {
  _$NrdbUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? reputation = null,
    Object? sharing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      reputation: null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      sharing: null == sharing
          ? _value.sharing
          : sharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NrdbUserCopyWith<$Res> implements $NrdbUserCopyWith<$Res> {
  factory _$$_NrdbUserCopyWith(
          _$_NrdbUser value, $Res Function(_$_NrdbUser) then) =
      __$$_NrdbUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String username, String email, int reputation, bool sharing});
}

/// @nodoc
class __$$_NrdbUserCopyWithImpl<$Res>
    extends _$NrdbUserCopyWithImpl<$Res, _$_NrdbUser>
    implements _$$_NrdbUserCopyWith<$Res> {
  __$$_NrdbUserCopyWithImpl(
      _$_NrdbUser _value, $Res Function(_$_NrdbUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? reputation = null,
    Object? sharing = null,
  }) {
    return _then(_$_NrdbUser(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int,
      null == sharing
          ? _value.sharing
          : sharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NrdbUser implements _NrdbUser {
  const _$_NrdbUser(
      this.id, this.username, this.email, this.reputation, this.sharing);

  factory _$_NrdbUser.fromJson(Map<String, dynamic> json) =>
      _$$_NrdbUserFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final int reputation;
  @override
  final bool sharing;

  @override
  String toString() {
    return 'NrdbUser(id: $id, username: $username, email: $email, reputation: $reputation, sharing: $sharing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NrdbUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.reputation, reputation) ||
                other.reputation == reputation) &&
            (identical(other.sharing, sharing) || other.sharing == sharing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, reputation, sharing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NrdbUserCopyWith<_$_NrdbUser> get copyWith =>
      __$$_NrdbUserCopyWithImpl<_$_NrdbUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NrdbUserToJson(
      this,
    );
  }
}

abstract class _NrdbUser implements NrdbUser {
  const factory _NrdbUser(
      final int id,
      final String username,
      final String email,
      final int reputation,
      final bool sharing) = _$_NrdbUser;

  factory _NrdbUser.fromJson(Map<String, dynamic> json) = _$_NrdbUser.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  int get reputation;
  @override
  bool get sharing;
  @override
  @JsonKey(ignore: true)
  _$$_NrdbUserCopyWith<_$_NrdbUser> get copyWith =>
      throw _privateConstructorUsedError;
}
