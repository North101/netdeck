// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'unmodified':
      return UnmodifiedApiResult.fromJson(json);
    case 'modified':
      return ModifiedApiResult.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'ApiResult', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ApiResult {
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated, Map<String, dynamic> data)
        modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime lastUpdated)? unmodified,
    TResult? Function(DateTime lastUpdated, Map<String, dynamic> data)?
        modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, Map<String, dynamic> data)? modified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnmodifiedApiResult value)? unmodified,
    TResult? Function(ModifiedApiResult value)? modified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiResultCopyWith<ApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<$Res> {
  factory $ApiResultCopyWith(ApiResult value, $Res Function(ApiResult) then) =
      _$ApiResultCopyWithImpl<$Res, ApiResult>;
  @useResult
  $Res call({DateTime lastUpdated});
}

/// @nodoc
class _$ApiResultCopyWithImpl<$Res, $Val extends ApiResult>
    implements $ApiResultCopyWith<$Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnmodifiedApiResultCopyWith<$Res>
    implements $ApiResultCopyWith<$Res> {
  factory _$$UnmodifiedApiResultCopyWith(_$UnmodifiedApiResult value,
          $Res Function(_$UnmodifiedApiResult) then) =
      __$$UnmodifiedApiResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime lastUpdated});
}

/// @nodoc
class __$$UnmodifiedApiResultCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$UnmodifiedApiResult>
    implements _$$UnmodifiedApiResultCopyWith<$Res> {
  __$$UnmodifiedApiResultCopyWithImpl(
      _$UnmodifiedApiResult _value, $Res Function(_$UnmodifiedApiResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = null,
  }) {
    return _then(_$UnmodifiedApiResult(
      null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$UnmodifiedApiResult implements UnmodifiedApiResult {
  const _$UnmodifiedApiResult(this.lastUpdated, {final String? $type})
      : $type = $type ?? 'unmodified';

  factory _$UnmodifiedApiResult.fromJson(Map<String, dynamic> json) =>
      _$$UnmodifiedApiResultFromJson(json);

  @override
  final DateTime lastUpdated;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ApiResult.unmodified(lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnmodifiedApiResult &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnmodifiedApiResultCopyWith<_$UnmodifiedApiResult> get copyWith =>
      __$$UnmodifiedApiResultCopyWithImpl<_$UnmodifiedApiResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated, Map<String, dynamic> data)
        modified,
  }) {
    return unmodified(lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime lastUpdated)? unmodified,
    TResult? Function(DateTime lastUpdated, Map<String, dynamic> data)?
        modified,
  }) {
    return unmodified?.call(lastUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, Map<String, dynamic> data)? modified,
    required TResult orElse(),
  }) {
    if (unmodified != null) {
      return unmodified(lastUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) {
    return unmodified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnmodifiedApiResult value)? unmodified,
    TResult? Function(ModifiedApiResult value)? modified,
  }) {
    return unmodified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) {
    if (unmodified != null) {
      return unmodified(this);
    }
    return orElse();
  }
}

abstract class UnmodifiedApiResult implements ApiResult {
  const factory UnmodifiedApiResult(final DateTime lastUpdated) =
      _$UnmodifiedApiResult;

  factory UnmodifiedApiResult.fromJson(Map<String, dynamic> json) =
      _$UnmodifiedApiResult.fromJson;

  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$UnmodifiedApiResultCopyWith<_$UnmodifiedApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifiedApiResultCopyWith<$Res>
    implements $ApiResultCopyWith<$Res> {
  factory _$$ModifiedApiResultCopyWith(
          _$ModifiedApiResult value, $Res Function(_$ModifiedApiResult) then) =
      __$$ModifiedApiResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime lastUpdated, Map<String, dynamic> data});
}

/// @nodoc
class __$$ModifiedApiResultCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$ModifiedApiResult>
    implements _$$ModifiedApiResultCopyWith<$Res> {
  __$$ModifiedApiResultCopyWithImpl(
      _$ModifiedApiResult _value, $Res Function(_$ModifiedApiResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = null,
    Object? data = null,
  }) {
    return _then(_$ModifiedApiResult(
      null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ModifiedApiResult implements ModifiedApiResult {
  const _$ModifiedApiResult(this.lastUpdated, final Map<String, dynamic> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'modified';

  factory _$ModifiedApiResult.fromJson(Map<String, dynamic> json) =>
      _$$ModifiedApiResultFromJson(json);

  @override
  final DateTime lastUpdated;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ApiResult.modified(lastUpdated: $lastUpdated, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifiedApiResult &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, lastUpdated, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifiedApiResultCopyWith<_$ModifiedApiResult> get copyWith =>
      __$$ModifiedApiResultCopyWithImpl<_$ModifiedApiResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime lastUpdated) unmodified,
    required TResult Function(DateTime lastUpdated, Map<String, dynamic> data)
        modified,
  }) {
    return modified(lastUpdated, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime lastUpdated)? unmodified,
    TResult? Function(DateTime lastUpdated, Map<String, dynamic> data)?
        modified,
  }) {
    return modified?.call(lastUpdated, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime lastUpdated)? unmodified,
    TResult Function(DateTime lastUpdated, Map<String, dynamic> data)? modified,
    required TResult orElse(),
  }) {
    if (modified != null) {
      return modified(lastUpdated, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnmodifiedApiResult value) unmodified,
    required TResult Function(ModifiedApiResult value) modified,
  }) {
    return modified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnmodifiedApiResult value)? unmodified,
    TResult? Function(ModifiedApiResult value)? modified,
  }) {
    return modified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnmodifiedApiResult value)? unmodified,
    TResult Function(ModifiedApiResult value)? modified,
    required TResult orElse(),
  }) {
    if (modified != null) {
      return modified(this);
    }
    return orElse();
  }
}

abstract class ModifiedApiResult implements ApiResult {
  const factory ModifiedApiResult(
          final DateTime lastUpdated, final Map<String, dynamic> data) =
      _$ModifiedApiResult;

  factory ModifiedApiResult.fromJson(Map<String, dynamic> json) =
      _$ModifiedApiResult.fromJson;

  @override
  DateTime get lastUpdated;
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$ModifiedApiResultCopyWith<_$ModifiedApiResult> get copyWith =>
      throw _privateConstructorUsedError;
}

CardApi _$CardApiFromJson(Map<String, dynamic> json) {
  return _CardApi.fromJson(json);
}

/// @nodoc
mixin _$CardApi {
  @JsonKey(name: 'imageUrlTemplate')
  String get imageUrlTemplate => throw _privateConstructorUsedError;
  List<CardApiData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardApiCopyWith<CardApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardApiCopyWith<$Res> {
  factory $CardApiCopyWith(CardApi value, $Res Function(CardApi) then) =
      _$CardApiCopyWithImpl<$Res, CardApi>;
  @useResult
  $Res call(
      {@JsonKey(name: 'imageUrlTemplate') String imageUrlTemplate,
      List<CardApiData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$CardApiCopyWithImpl<$Res, $Val extends CardApi>
    implements $CardApiCopyWith<$Res> {
  _$CardApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrlTemplate = null,
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      imageUrlTemplate: null == imageUrlTemplate
          ? _value.imageUrlTemplate
          : imageUrlTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CardApiData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardApiCopyWith<$Res> implements $CardApiCopyWith<$Res> {
  factory _$$_CardApiCopyWith(
          _$_CardApi value, $Res Function(_$_CardApi) then) =
      __$$_CardApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'imageUrlTemplate') String imageUrlTemplate,
      List<CardApiData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_CardApiCopyWithImpl<$Res>
    extends _$CardApiCopyWithImpl<$Res, _$_CardApi>
    implements _$$_CardApiCopyWith<$Res> {
  __$$_CardApiCopyWithImpl(_$_CardApi _value, $Res Function(_$_CardApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrlTemplate = null,
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_CardApi(
      imageUrlTemplate: null == imageUrlTemplate
          ? _value.imageUrlTemplate
          : imageUrlTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CardApiData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_CardApi implements _CardApi {
  const _$_CardApi(
      {@JsonKey(name: 'imageUrlTemplate') required this.imageUrlTemplate,
      required final List<CardApiData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_CardApi.fromJson(Map<String, dynamic> json) =>
      _$$_CardApiFromJson(json);

  @override
  @JsonKey(name: 'imageUrlTemplate')
  final String imageUrlTemplate;
  final List<CardApiData> _data;
  @override
  List<CardApiData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'CardApi(imageUrlTemplate: $imageUrlTemplate, data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardApi &&
            (identical(other.imageUrlTemplate, imageUrlTemplate) ||
                other.imageUrlTemplate == imageUrlTemplate) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageUrlTemplate,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardApiCopyWith<_$_CardApi> get copyWith =>
      __$$_CardApiCopyWithImpl<_$_CardApi>(this, _$identity);
}

abstract class _CardApi implements CardApi {
  const factory _CardApi(
      {@JsonKey(name: 'imageUrlTemplate')
          required final String imageUrlTemplate,
      required final List<CardApiData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_CardApi;

  factory _CardApi.fromJson(Map<String, dynamic> json) = _$_CardApi.fromJson;

  @override
  @JsonKey(name: 'imageUrlTemplate')
  String get imageUrlTemplate;
  @override
  List<CardApiData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_CardApiCopyWith<_$_CardApi> get copyWith =>
      throw _privateConstructorUsedError;
}

CardApiData _$CardApiDataFromJson(Map<String, dynamic> json) {
  return _CardApiData.fromJson(json);
}

/// @nodoc
mixin _$CardApiData {
  String get code => throw _privateConstructorUsedError;
  int get deckLimit => throw _privateConstructorUsedError;
  String get factionCode => throw _privateConstructorUsedError;
  int get factionCost => throw _privateConstructorUsedError;
  String? get flavor => throw _privateConstructorUsedError;
  String? get illustrator => throw _privateConstructorUsedError;
  int? get influenceLimit => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  int? get minimumDeckSize => throw _privateConstructorUsedError;
  String get packCode => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get sideCode => throw _privateConstructorUsedError;
  String? get strippedText => throw _privateConstructorUsedError;
  String get strippedTitle => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get typeCode => throw _privateConstructorUsedError;
  bool get uniqueness => throw _privateConstructorUsedError;
  int? get baseLink => throw _privateConstructorUsedError;
  int? get cost => throw _privateConstructorUsedError;
  int? get memoryCost => throw _privateConstructorUsedError;
  int? get strength => throw _privateConstructorUsedError;
  int? get advancementCost => throw _privateConstructorUsedError;
  int? get agendaPoints => throw _privateConstructorUsedError;
  int? get trashCost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardApiDataCopyWith<CardApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardApiDataCopyWith<$Res> {
  factory $CardApiDataCopyWith(
          CardApiData value, $Res Function(CardApiData) then) =
      _$CardApiDataCopyWithImpl<$Res, CardApiData>;
  @useResult
  $Res call(
      {String code,
      int deckLimit,
      String factionCode,
      int factionCost,
      String? flavor,
      String? illustrator,
      int? influenceLimit,
      String? keywords,
      int? minimumDeckSize,
      String packCode,
      int position,
      int quantity,
      String sideCode,
      String? strippedText,
      String strippedTitle,
      String? text,
      String title,
      String typeCode,
      bool uniqueness,
      int? baseLink,
      int? cost,
      int? memoryCost,
      int? strength,
      int? advancementCost,
      int? agendaPoints,
      int? trashCost});
}

/// @nodoc
class _$CardApiDataCopyWithImpl<$Res, $Val extends CardApiData>
    implements $CardApiDataCopyWith<$Res> {
  _$CardApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deckLimit = null,
    Object? factionCode = null,
    Object? factionCost = null,
    Object? flavor = freezed,
    Object? illustrator = freezed,
    Object? influenceLimit = freezed,
    Object? keywords = freezed,
    Object? minimumDeckSize = freezed,
    Object? packCode = null,
    Object? position = null,
    Object? quantity = null,
    Object? sideCode = null,
    Object? strippedText = freezed,
    Object? strippedTitle = null,
    Object? text = freezed,
    Object? title = null,
    Object? typeCode = null,
    Object? uniqueness = null,
    Object? baseLink = freezed,
    Object? cost = freezed,
    Object? memoryCost = freezed,
    Object? strength = freezed,
    Object? advancementCost = freezed,
    Object? agendaPoints = freezed,
    Object? trashCost = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deckLimit: null == deckLimit
          ? _value.deckLimit
          : deckLimit // ignore: cast_nullable_to_non_nullable
              as int,
      factionCode: null == factionCode
          ? _value.factionCode
          : factionCode // ignore: cast_nullable_to_non_nullable
              as String,
      factionCost: null == factionCost
          ? _value.factionCost
          : factionCost // ignore: cast_nullable_to_non_nullable
              as int,
      flavor: freezed == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String?,
      illustrator: freezed == illustrator
          ? _value.illustrator
          : illustrator // ignore: cast_nullable_to_non_nullable
              as String?,
      influenceLimit: freezed == influenceLimit
          ? _value.influenceLimit
          : influenceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumDeckSize: freezed == minimumDeckSize
          ? _value.minimumDeckSize
          : minimumDeckSize // ignore: cast_nullable_to_non_nullable
              as int?,
      packCode: null == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
      strippedText: freezed == strippedText
          ? _value.strippedText
          : strippedText // ignore: cast_nullable_to_non_nullable
              as String?,
      strippedTitle: null == strippedTitle
          ? _value.strippedTitle
          : strippedTitle // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      typeCode: null == typeCode
          ? _value.typeCode
          : typeCode // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueness: null == uniqueness
          ? _value.uniqueness
          : uniqueness // ignore: cast_nullable_to_non_nullable
              as bool,
      baseLink: freezed == baseLink
          ? _value.baseLink
          : baseLink // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      memoryCost: freezed == memoryCost
          ? _value.memoryCost
          : memoryCost // ignore: cast_nullable_to_non_nullable
              as int?,
      strength: freezed == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int?,
      advancementCost: freezed == advancementCost
          ? _value.advancementCost
          : advancementCost // ignore: cast_nullable_to_non_nullable
              as int?,
      agendaPoints: freezed == agendaPoints
          ? _value.agendaPoints
          : agendaPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      trashCost: freezed == trashCost
          ? _value.trashCost
          : trashCost // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardApiDataCopyWith<$Res>
    implements $CardApiDataCopyWith<$Res> {
  factory _$$_CardApiDataCopyWith(
          _$_CardApiData value, $Res Function(_$_CardApiData) then) =
      __$$_CardApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      int deckLimit,
      String factionCode,
      int factionCost,
      String? flavor,
      String? illustrator,
      int? influenceLimit,
      String? keywords,
      int? minimumDeckSize,
      String packCode,
      int position,
      int quantity,
      String sideCode,
      String? strippedText,
      String strippedTitle,
      String? text,
      String title,
      String typeCode,
      bool uniqueness,
      int? baseLink,
      int? cost,
      int? memoryCost,
      int? strength,
      int? advancementCost,
      int? agendaPoints,
      int? trashCost});
}

/// @nodoc
class __$$_CardApiDataCopyWithImpl<$Res>
    extends _$CardApiDataCopyWithImpl<$Res, _$_CardApiData>
    implements _$$_CardApiDataCopyWith<$Res> {
  __$$_CardApiDataCopyWithImpl(
      _$_CardApiData _value, $Res Function(_$_CardApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deckLimit = null,
    Object? factionCode = null,
    Object? factionCost = null,
    Object? flavor = freezed,
    Object? illustrator = freezed,
    Object? influenceLimit = freezed,
    Object? keywords = freezed,
    Object? minimumDeckSize = freezed,
    Object? packCode = null,
    Object? position = null,
    Object? quantity = null,
    Object? sideCode = null,
    Object? strippedText = freezed,
    Object? strippedTitle = null,
    Object? text = freezed,
    Object? title = null,
    Object? typeCode = null,
    Object? uniqueness = null,
    Object? baseLink = freezed,
    Object? cost = freezed,
    Object? memoryCost = freezed,
    Object? strength = freezed,
    Object? advancementCost = freezed,
    Object? agendaPoints = freezed,
    Object? trashCost = freezed,
  }) {
    return _then(_$_CardApiData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deckLimit: null == deckLimit
          ? _value.deckLimit
          : deckLimit // ignore: cast_nullable_to_non_nullable
              as int,
      factionCode: null == factionCode
          ? _value.factionCode
          : factionCode // ignore: cast_nullable_to_non_nullable
              as String,
      factionCost: null == factionCost
          ? _value.factionCost
          : factionCost // ignore: cast_nullable_to_non_nullable
              as int,
      flavor: freezed == flavor
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as String?,
      illustrator: freezed == illustrator
          ? _value.illustrator
          : illustrator // ignore: cast_nullable_to_non_nullable
              as String?,
      influenceLimit: freezed == influenceLimit
          ? _value.influenceLimit
          : influenceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumDeckSize: freezed == minimumDeckSize
          ? _value.minimumDeckSize
          : minimumDeckSize // ignore: cast_nullable_to_non_nullable
              as int?,
      packCode: null == packCode
          ? _value.packCode
          : packCode // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
      strippedText: freezed == strippedText
          ? _value.strippedText
          : strippedText // ignore: cast_nullable_to_non_nullable
              as String?,
      strippedTitle: null == strippedTitle
          ? _value.strippedTitle
          : strippedTitle // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      typeCode: null == typeCode
          ? _value.typeCode
          : typeCode // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueness: null == uniqueness
          ? _value.uniqueness
          : uniqueness // ignore: cast_nullable_to_non_nullable
              as bool,
      baseLink: freezed == baseLink
          ? _value.baseLink
          : baseLink // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      memoryCost: freezed == memoryCost
          ? _value.memoryCost
          : memoryCost // ignore: cast_nullable_to_non_nullable
              as int?,
      strength: freezed == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int?,
      advancementCost: freezed == advancementCost
          ? _value.advancementCost
          : advancementCost // ignore: cast_nullable_to_non_nullable
              as int?,
      agendaPoints: freezed == agendaPoints
          ? _value.agendaPoints
          : agendaPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      trashCost: freezed == trashCost
          ? _value.trashCost
          : trashCost // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_CardApiData implements _CardApiData {
  const _$_CardApiData(
      {required this.code,
      required this.deckLimit,
      required this.factionCode,
      required this.factionCost,
      required this.flavor,
      required this.illustrator,
      required this.influenceLimit,
      required this.keywords,
      required this.minimumDeckSize,
      required this.packCode,
      required this.position,
      required this.quantity,
      required this.sideCode,
      required this.strippedText,
      required this.strippedTitle,
      required this.text,
      required this.title,
      required this.typeCode,
      required this.uniqueness,
      required this.baseLink,
      required this.cost,
      required this.memoryCost,
      required this.strength,
      required this.advancementCost,
      required this.agendaPoints,
      required this.trashCost});

  factory _$_CardApiData.fromJson(Map<String, dynamic> json) =>
      _$$_CardApiDataFromJson(json);

  @override
  final String code;
  @override
  final int deckLimit;
  @override
  final String factionCode;
  @override
  final int factionCost;
  @override
  final String? flavor;
  @override
  final String? illustrator;
  @override
  final int? influenceLimit;
  @override
  final String? keywords;
  @override
  final int? minimumDeckSize;
  @override
  final String packCode;
  @override
  final int position;
  @override
  final int quantity;
  @override
  final String sideCode;
  @override
  final String? strippedText;
  @override
  final String strippedTitle;
  @override
  final String? text;
  @override
  final String title;
  @override
  final String typeCode;
  @override
  final bool uniqueness;
  @override
  final int? baseLink;
  @override
  final int? cost;
  @override
  final int? memoryCost;
  @override
  final int? strength;
  @override
  final int? advancementCost;
  @override
  final int? agendaPoints;
  @override
  final int? trashCost;

  @override
  String toString() {
    return 'CardApiData(code: $code, deckLimit: $deckLimit, factionCode: $factionCode, factionCost: $factionCost, flavor: $flavor, illustrator: $illustrator, influenceLimit: $influenceLimit, keywords: $keywords, minimumDeckSize: $minimumDeckSize, packCode: $packCode, position: $position, quantity: $quantity, sideCode: $sideCode, strippedText: $strippedText, strippedTitle: $strippedTitle, text: $text, title: $title, typeCode: $typeCode, uniqueness: $uniqueness, baseLink: $baseLink, cost: $cost, memoryCost: $memoryCost, strength: $strength, advancementCost: $advancementCost, agendaPoints: $agendaPoints, trashCost: $trashCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardApiData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.deckLimit, deckLimit) ||
                other.deckLimit == deckLimit) &&
            (identical(other.factionCode, factionCode) ||
                other.factionCode == factionCode) &&
            (identical(other.factionCost, factionCost) ||
                other.factionCost == factionCost) &&
            (identical(other.flavor, flavor) || other.flavor == flavor) &&
            (identical(other.illustrator, illustrator) ||
                other.illustrator == illustrator) &&
            (identical(other.influenceLimit, influenceLimit) ||
                other.influenceLimit == influenceLimit) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.minimumDeckSize, minimumDeckSize) ||
                other.minimumDeckSize == minimumDeckSize) &&
            (identical(other.packCode, packCode) ||
                other.packCode == packCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.sideCode, sideCode) ||
                other.sideCode == sideCode) &&
            (identical(other.strippedText, strippedText) ||
                other.strippedText == strippedText) &&
            (identical(other.strippedTitle, strippedTitle) ||
                other.strippedTitle == strippedTitle) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.typeCode, typeCode) ||
                other.typeCode == typeCode) &&
            (identical(other.uniqueness, uniqueness) ||
                other.uniqueness == uniqueness) &&
            (identical(other.baseLink, baseLink) ||
                other.baseLink == baseLink) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.memoryCost, memoryCost) ||
                other.memoryCost == memoryCost) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            (identical(other.advancementCost, advancementCost) ||
                other.advancementCost == advancementCost) &&
            (identical(other.agendaPoints, agendaPoints) ||
                other.agendaPoints == agendaPoints) &&
            (identical(other.trashCost, trashCost) ||
                other.trashCost == trashCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        code,
        deckLimit,
        factionCode,
        factionCost,
        flavor,
        illustrator,
        influenceLimit,
        keywords,
        minimumDeckSize,
        packCode,
        position,
        quantity,
        sideCode,
        strippedText,
        strippedTitle,
        text,
        title,
        typeCode,
        uniqueness,
        baseLink,
        cost,
        memoryCost,
        strength,
        advancementCost,
        agendaPoints,
        trashCost
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardApiDataCopyWith<_$_CardApiData> get copyWith =>
      __$$_CardApiDataCopyWithImpl<_$_CardApiData>(this, _$identity);
}

abstract class _CardApiData implements CardApiData {
  const factory _CardApiData(
      {required final String code,
      required final int deckLimit,
      required final String factionCode,
      required final int factionCost,
      required final String? flavor,
      required final String? illustrator,
      required final int? influenceLimit,
      required final String? keywords,
      required final int? minimumDeckSize,
      required final String packCode,
      required final int position,
      required final int quantity,
      required final String sideCode,
      required final String? strippedText,
      required final String strippedTitle,
      required final String? text,
      required final String title,
      required final String typeCode,
      required final bool uniqueness,
      required final int? baseLink,
      required final int? cost,
      required final int? memoryCost,
      required final int? strength,
      required final int? advancementCost,
      required final int? agendaPoints,
      required final int? trashCost}) = _$_CardApiData;

  factory _CardApiData.fromJson(Map<String, dynamic> json) =
      _$_CardApiData.fromJson;

  @override
  String get code;
  @override
  int get deckLimit;
  @override
  String get factionCode;
  @override
  int get factionCost;
  @override
  String? get flavor;
  @override
  String? get illustrator;
  @override
  int? get influenceLimit;
  @override
  String? get keywords;
  @override
  int? get minimumDeckSize;
  @override
  String get packCode;
  @override
  int get position;
  @override
  int get quantity;
  @override
  String get sideCode;
  @override
  String? get strippedText;
  @override
  String get strippedTitle;
  @override
  String? get text;
  @override
  String get title;
  @override
  String get typeCode;
  @override
  bool get uniqueness;
  @override
  int? get baseLink;
  @override
  int? get cost;
  @override
  int? get memoryCost;
  @override
  int? get strength;
  @override
  int? get advancementCost;
  @override
  int? get agendaPoints;
  @override
  int? get trashCost;
  @override
  @JsonKey(ignore: true)
  _$$_CardApiDataCopyWith<_$_CardApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

CycleApi _$CycleApiFromJson(Map<String, dynamic> json) {
  return _CycleApi.fromJson(json);
}

/// @nodoc
mixin _$CycleApi {
  @JsonKey(fromJson: CycleApi.cycleFromJson)
  List<CycleData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CycleApiCopyWith<CycleApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleApiCopyWith<$Res> {
  factory $CycleApiCopyWith(CycleApi value, $Res Function(CycleApi) then) =
      _$CycleApiCopyWithImpl<$Res, CycleApi>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: CycleApi.cycleFromJson) List<CycleData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$CycleApiCopyWithImpl<$Res, $Val extends CycleApi>
    implements $CycleApiCopyWith<$Res> {
  _$CycleApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CycleData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleApiCopyWith<$Res> implements $CycleApiCopyWith<$Res> {
  factory _$$_CycleApiCopyWith(
          _$_CycleApi value, $Res Function(_$_CycleApi) then) =
      __$$_CycleApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: CycleApi.cycleFromJson) List<CycleData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_CycleApiCopyWithImpl<$Res>
    extends _$CycleApiCopyWithImpl<$Res, _$_CycleApi>
    implements _$$_CycleApiCopyWith<$Res> {
  __$$_CycleApiCopyWithImpl(
      _$_CycleApi _value, $Res Function(_$_CycleApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_CycleApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CycleData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_CycleApi implements _CycleApi {
  const _$_CycleApi(
      {@JsonKey(fromJson: CycleApi.cycleFromJson)
          required final List<CycleData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_CycleApi.fromJson(Map<String, dynamic> json) =>
      _$$_CycleApiFromJson(json);

  final List<CycleData> _data;
  @override
  @JsonKey(fromJson: CycleApi.cycleFromJson)
  List<CycleData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'CycleApi(data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CycleApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleApiCopyWith<_$_CycleApi> get copyWith =>
      __$$_CycleApiCopyWithImpl<_$_CycleApi>(this, _$identity);
}

abstract class _CycleApi implements CycleApi {
  const factory _CycleApi(
      {@JsonKey(fromJson: CycleApi.cycleFromJson)
          required final List<CycleData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_CycleApi;

  factory _CycleApi.fromJson(Map<String, dynamic> json) = _$_CycleApi.fromJson;

  @override
  @JsonKey(fromJson: CycleApi.cycleFromJson)
  List<CycleData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_CycleApiCopyWith<_$_CycleApi> get copyWith =>
      throw _privateConstructorUsedError;
}

FactionApi _$FactionApiFromJson(Map<String, dynamic> json) {
  return _FactionApi.fromJson(json);
}

/// @nodoc
mixin _$FactionApi {
  List<FactionApiData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FactionApiCopyWith<FactionApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactionApiCopyWith<$Res> {
  factory $FactionApiCopyWith(
          FactionApi value, $Res Function(FactionApi) then) =
      _$FactionApiCopyWithImpl<$Res, FactionApi>;
  @useResult
  $Res call(
      {List<FactionApiData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$FactionApiCopyWithImpl<$Res, $Val extends FactionApi>
    implements $FactionApiCopyWith<$Res> {
  _$FactionApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FactionApiData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactionApiCopyWith<$Res>
    implements $FactionApiCopyWith<$Res> {
  factory _$$_FactionApiCopyWith(
          _$_FactionApi value, $Res Function(_$_FactionApi) then) =
      __$$_FactionApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FactionApiData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_FactionApiCopyWithImpl<$Res>
    extends _$FactionApiCopyWithImpl<$Res, _$_FactionApi>
    implements _$$_FactionApiCopyWith<$Res> {
  __$$_FactionApiCopyWithImpl(
      _$_FactionApi _value, $Res Function(_$_FactionApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_FactionApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FactionApiData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_FactionApi implements _FactionApi {
  const _$_FactionApi(
      {required final List<FactionApiData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_FactionApi.fromJson(Map<String, dynamic> json) =>
      _$$_FactionApiFromJson(json);

  final List<FactionApiData> _data;
  @override
  List<FactionApiData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'FactionApi(data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactionApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactionApiCopyWith<_$_FactionApi> get copyWith =>
      __$$_FactionApiCopyWithImpl<_$_FactionApi>(this, _$identity);
}

abstract class _FactionApi implements FactionApi {
  const factory _FactionApi(
      {required final List<FactionApiData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_FactionApi;

  factory _FactionApi.fromJson(Map<String, dynamic> json) =
      _$_FactionApi.fromJson;

  @override
  List<FactionApiData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_FactionApiCopyWith<_$_FactionApi> get copyWith =>
      throw _privateConstructorUsedError;
}

FactionApiData _$FactionApiDataFromJson(Map<String, dynamic> json) {
  return _FactionApiData.fromJson(json);
}

/// @nodoc
mixin _$FactionApiData {
  String get code => throw _privateConstructorUsedError;
  @JsonKey(fromJson: FactionApiData.colorFromJson)
  int get color => throw _privateConstructorUsedError;
  bool get isMini => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sideCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FactionApiDataCopyWith<FactionApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactionApiDataCopyWith<$Res> {
  factory $FactionApiDataCopyWith(
          FactionApiData value, $Res Function(FactionApiData) then) =
      _$FactionApiDataCopyWithImpl<$Res, FactionApiData>;
  @useResult
  $Res call(
      {String code,
      @JsonKey(fromJson: FactionApiData.colorFromJson) int color,
      bool isMini,
      String name,
      String sideCode});
}

/// @nodoc
class _$FactionApiDataCopyWithImpl<$Res, $Val extends FactionApiData>
    implements $FactionApiDataCopyWith<$Res> {
  _$FactionApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? color = null,
    Object? isMini = null,
    Object? name = null,
    Object? sideCode = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FactionApiDataCopyWith<$Res>
    implements $FactionApiDataCopyWith<$Res> {
  factory _$$_FactionApiDataCopyWith(
          _$_FactionApiData value, $Res Function(_$_FactionApiData) then) =
      __$$_FactionApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      @JsonKey(fromJson: FactionApiData.colorFromJson) int color,
      bool isMini,
      String name,
      String sideCode});
}

/// @nodoc
class __$$_FactionApiDataCopyWithImpl<$Res>
    extends _$FactionApiDataCopyWithImpl<$Res, _$_FactionApiData>
    implements _$$_FactionApiDataCopyWith<$Res> {
  __$$_FactionApiDataCopyWithImpl(
      _$_FactionApiData _value, $Res Function(_$_FactionApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? color = null,
    Object? isMini = null,
    Object? name = null,
    Object? sideCode = null,
  }) {
    return _then(_$_FactionApiData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sideCode: null == sideCode
          ? _value.sideCode
          : sideCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_FactionApiData implements _FactionApiData {
  const _$_FactionApiData(
      {required this.code,
      @JsonKey(fromJson: FactionApiData.colorFromJson) required this.color,
      required this.isMini,
      required this.name,
      required this.sideCode});

  factory _$_FactionApiData.fromJson(Map<String, dynamic> json) =>
      _$$_FactionApiDataFromJson(json);

  @override
  final String code;
  @override
  @JsonKey(fromJson: FactionApiData.colorFromJson)
  final int color;
  @override
  final bool isMini;
  @override
  final String name;
  @override
  final String sideCode;

  @override
  String toString() {
    return 'FactionApiData(code: $code, color: $color, isMini: $isMini, name: $name, sideCode: $sideCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FactionApiData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isMini, isMini) || other.isMini == isMini) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sideCode, sideCode) ||
                other.sideCode == sideCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, color, isMini, name, sideCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FactionApiDataCopyWith<_$_FactionApiData> get copyWith =>
      __$$_FactionApiDataCopyWithImpl<_$_FactionApiData>(this, _$identity);
}

abstract class _FactionApiData implements FactionApiData {
  const factory _FactionApiData(
      {required final String code,
      @JsonKey(fromJson: FactionApiData.colorFromJson) required final int color,
      required final bool isMini,
      required final String name,
      required final String sideCode}) = _$_FactionApiData;

  factory _FactionApiData.fromJson(Map<String, dynamic> json) =
      _$_FactionApiData.fromJson;

  @override
  String get code;
  @override
  @JsonKey(fromJson: FactionApiData.colorFromJson)
  int get color;
  @override
  bool get isMini;
  @override
  String get name;
  @override
  String get sideCode;
  @override
  @JsonKey(ignore: true)
  _$$_FactionApiDataCopyWith<_$_FactionApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

FormatApi _$FormatApiFromJson(Map<String, dynamic> json) {
  return _FormatApi.fromJson(json);
}

/// @nodoc
mixin _$FormatApi {
  List<FormatApiData> get data => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormatApiCopyWith<FormatApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatApiCopyWith<$Res> {
  factory $FormatApiCopyWith(FormatApi value, $Res Function(FormatApi) then) =
      _$FormatApiCopyWithImpl<$Res, FormatApi>;
  @useResult
  $Res call({List<FormatApiData> data, DateTime lastUpdated});
}

/// @nodoc
class _$FormatApiCopyWithImpl<$Res, $Val extends FormatApi>
    implements $FormatApiCopyWith<$Res> {
  _$FormatApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FormatApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormatApiCopyWith<$Res> implements $FormatApiCopyWith<$Res> {
  factory _$$_FormatApiCopyWith(
          _$_FormatApi value, $Res Function(_$_FormatApi) then) =
      __$$_FormatApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FormatApiData> data, DateTime lastUpdated});
}

/// @nodoc
class __$$_FormatApiCopyWithImpl<$Res>
    extends _$FormatApiCopyWithImpl<$Res, _$_FormatApi>
    implements _$$_FormatApiCopyWith<$Res> {
  __$$_FormatApiCopyWithImpl(
      _$_FormatApi _value, $Res Function(_$_FormatApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_FormatApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FormatApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_FormatApi implements _FormatApi {
  const _$_FormatApi(
      {required final List<FormatApiData> data, required this.lastUpdated})
      : _data = data;

  factory _$_FormatApi.fromJson(Map<String, dynamic> json) =>
      _$$_FormatApiFromJson(json);

  final List<FormatApiData> _data;
  @override
  List<FormatApiData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'FormatApi(data: $data, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormatApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormatApiCopyWith<_$_FormatApi> get copyWith =>
      __$$_FormatApiCopyWithImpl<_$_FormatApi>(this, _$identity);
}

abstract class _FormatApi implements FormatApi {
  const factory _FormatApi(
      {required final List<FormatApiData> data,
      required final DateTime lastUpdated}) = _$_FormatApi;

  factory _FormatApi.fromJson(Map<String, dynamic> json) =
      _$_FormatApi.fromJson;

  @override
  List<FormatApiData> get data;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_FormatApiCopyWith<_$_FormatApi> get copyWith =>
      throw _privateConstructorUsedError;
}

FormatApiData _$FormatApiDataFromJson(Map<String, dynamic> json) {
  return _FormatApiData.fromJson(json);
}

/// @nodoc
mixin _$FormatApiData {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormatApiDataCopyWith<FormatApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatApiDataCopyWith<$Res> {
  factory $FormatApiDataCopyWith(
          FormatApiData value, $Res Function(FormatApiData) then) =
      _$FormatApiDataCopyWithImpl<$Res, FormatApiData>;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$FormatApiDataCopyWithImpl<$Res, $Val extends FormatApiData>
    implements $FormatApiDataCopyWith<$Res> {
  _$FormatApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormatApiDataCopyWith<$Res>
    implements $FormatApiDataCopyWith<$Res> {
  factory _$$_FormatApiDataCopyWith(
          _$_FormatApiData value, $Res Function(_$_FormatApiData) then) =
      __$$_FormatApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$$_FormatApiDataCopyWithImpl<$Res>
    extends _$FormatApiDataCopyWithImpl<$Res, _$_FormatApiData>
    implements _$$_FormatApiDataCopyWith<$Res> {
  __$$_FormatApiDataCopyWithImpl(
      _$_FormatApiData _value, $Res Function(_$_FormatApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_FormatApiData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_FormatApiData implements _FormatApiData {
  const _$_FormatApiData({required this.code, required this.name});

  factory _$_FormatApiData.fromJson(Map<String, dynamic> json) =>
      _$$_FormatApiDataFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'FormatApiData(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormatApiData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormatApiDataCopyWith<_$_FormatApiData> get copyWith =>
      __$$_FormatApiDataCopyWithImpl<_$_FormatApiData>(this, _$identity);
}

abstract class _FormatApiData implements FormatApiData {
  const factory _FormatApiData(
      {required final String code,
      required final String name}) = _$_FormatApiData;

  factory _FormatApiData.fromJson(Map<String, dynamic> json) =
      _$_FormatApiData.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FormatApiDataCopyWith<_$_FormatApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

PackApi _$PackApiFromJson(Map<String, dynamic> json) {
  return _PackApi.fromJson(json);
}

/// @nodoc
mixin _$PackApi {
  @JsonKey(fromJson: PackApi.packFromJson)
  List<PackData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PackApiCopyWith<PackApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackApiCopyWith<$Res> {
  factory $PackApiCopyWith(PackApi value, $Res Function(PackApi) then) =
      _$PackApiCopyWithImpl<$Res, PackApi>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: PackApi.packFromJson) List<PackData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$PackApiCopyWithImpl<$Res, $Val extends PackApi>
    implements $PackApiCopyWith<$Res> {
  _$PackApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackApiCopyWith<$Res> implements $PackApiCopyWith<$Res> {
  factory _$$_PackApiCopyWith(
          _$_PackApi value, $Res Function(_$_PackApi) then) =
      __$$_PackApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: PackApi.packFromJson) List<PackData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_PackApiCopyWithImpl<$Res>
    extends _$PackApiCopyWithImpl<$Res, _$_PackApi>
    implements _$$_PackApiCopyWith<$Res> {
  __$$_PackApiCopyWithImpl(_$_PackApi _value, $Res Function(_$_PackApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_PackApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_PackApi implements _PackApi {
  const _$_PackApi(
      {@JsonKey(fromJson: PackApi.packFromJson)
          required final List<PackData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_PackApi.fromJson(Map<String, dynamic> json) =>
      _$$_PackApiFromJson(json);

  final List<PackData> _data;
  @override
  @JsonKey(fromJson: PackApi.packFromJson)
  List<PackData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'PackApi(data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackApiCopyWith<_$_PackApi> get copyWith =>
      __$$_PackApiCopyWithImpl<_$_PackApi>(this, _$identity);
}

abstract class _PackApi implements PackApi {
  const factory _PackApi(
      {@JsonKey(fromJson: PackApi.packFromJson)
          required final List<PackData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_PackApi;

  factory _PackApi.fromJson(Map<String, dynamic> json) = _$_PackApi.fromJson;

  @override
  @JsonKey(fromJson: PackApi.packFromJson)
  List<PackData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_PackApiCopyWith<_$_PackApi> get copyWith =>
      throw _privateConstructorUsedError;
}

SideApi _$SideApiFromJson(Map<String, dynamic> json) {
  return _SideApi.fromJson(json);
}

/// @nodoc
mixin _$SideApi {
  @JsonKey(fromJson: SideApi.sideFromJson)
  List<SideData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SideApiCopyWith<SideApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideApiCopyWith<$Res> {
  factory $SideApiCopyWith(SideApi value, $Res Function(SideApi) then) =
      _$SideApiCopyWithImpl<$Res, SideApi>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: SideApi.sideFromJson) List<SideData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$SideApiCopyWithImpl<$Res, $Val extends SideApi>
    implements $SideApiCopyWith<$Res> {
  _$SideApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SideData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SideApiCopyWith<$Res> implements $SideApiCopyWith<$Res> {
  factory _$$_SideApiCopyWith(
          _$_SideApi value, $Res Function(_$_SideApi) then) =
      __$$_SideApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: SideApi.sideFromJson) List<SideData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_SideApiCopyWithImpl<$Res>
    extends _$SideApiCopyWithImpl<$Res, _$_SideApi>
    implements _$$_SideApiCopyWith<$Res> {
  __$$_SideApiCopyWithImpl(_$_SideApi _value, $Res Function(_$_SideApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_SideApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SideData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_SideApi implements _SideApi {
  const _$_SideApi(
      {@JsonKey(fromJson: SideApi.sideFromJson)
          required final List<SideData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_SideApi.fromJson(Map<String, dynamic> json) =>
      _$$_SideApiFromJson(json);

  final List<SideData> _data;
  @override
  @JsonKey(fromJson: SideApi.sideFromJson)
  List<SideData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'SideApi(data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SideApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SideApiCopyWith<_$_SideApi> get copyWith =>
      __$$_SideApiCopyWithImpl<_$_SideApi>(this, _$identity);
}

abstract class _SideApi implements SideApi {
  const factory _SideApi(
      {@JsonKey(fromJson: SideApi.sideFromJson)
          required final List<SideData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_SideApi;

  factory _SideApi.fromJson(Map<String, dynamic> json) = _$_SideApi.fromJson;

  @override
  @JsonKey(fromJson: SideApi.sideFromJson)
  List<SideData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_SideApiCopyWith<_$_SideApi> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeApi _$TypeApiFromJson(Map<String, dynamic> json) {
  return _TypeApi.fromJson(json);
}

/// @nodoc
mixin _$TypeApi {
  @JsonKey(fromJson: TypeApi.typeFromJson)
  List<TypeData> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TypeApiCopyWith<TypeApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeApiCopyWith<$Res> {
  factory $TypeApiCopyWith(TypeApi value, $Res Function(TypeApi) then) =
      _$TypeApiCopyWithImpl<$Res, TypeApi>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: TypeApi.typeFromJson) List<TypeData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class _$TypeApiCopyWithImpl<$Res, $Val extends TypeApi>
    implements $TypeApiCopyWith<$Res> {
  _$TypeApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TypeData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TypeApiCopyWith<$Res> implements $TypeApiCopyWith<$Res> {
  factory _$$_TypeApiCopyWith(
          _$_TypeApi value, $Res Function(_$_TypeApi) then) =
      __$$_TypeApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: TypeApi.typeFromJson) List<TypeData> data,
      int total,
      bool success,
      String versionNumber,
      DateTime lastUpdated});
}

/// @nodoc
class __$$_TypeApiCopyWithImpl<$Res>
    extends _$TypeApiCopyWithImpl<$Res, _$_TypeApi>
    implements _$$_TypeApiCopyWith<$Res> {
  __$$_TypeApiCopyWithImpl(_$_TypeApi _value, $Res Function(_$_TypeApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? success = null,
    Object? versionNumber = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_TypeApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TypeData>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_TypeApi implements _TypeApi {
  const _$_TypeApi(
      {@JsonKey(fromJson: TypeApi.typeFromJson)
          required final List<TypeData> data,
      required this.total,
      required this.success,
      required this.versionNumber,
      required this.lastUpdated})
      : _data = data;

  factory _$_TypeApi.fromJson(Map<String, dynamic> json) =>
      _$$_TypeApiFromJson(json);

  final List<TypeData> _data;
  @override
  @JsonKey(fromJson: TypeApi.typeFromJson)
  List<TypeData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final bool success;
  @override
  final String versionNumber;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'TypeApi(data: $data, total: $total, success: $success, versionNumber: $versionNumber, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      success,
      versionNumber,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeApiCopyWith<_$_TypeApi> get copyWith =>
      __$$_TypeApiCopyWithImpl<_$_TypeApi>(this, _$identity);
}

abstract class _TypeApi implements TypeApi {
  const factory _TypeApi(
      {@JsonKey(fromJson: TypeApi.typeFromJson)
          required final List<TypeData> data,
      required final int total,
      required final bool success,
      required final String versionNumber,
      required final DateTime lastUpdated}) = _$_TypeApi;

  factory _TypeApi.fromJson(Map<String, dynamic> json) = _$_TypeApi.fromJson;

  @override
  @JsonKey(fromJson: TypeApi.typeFromJson)
  List<TypeData> get data;
  @override
  int get total;
  @override
  bool get success;
  @override
  String get versionNumber;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_TypeApiCopyWith<_$_TypeApi> get copyWith =>
      throw _privateConstructorUsedError;
}

RotationApi _$RotationApiFromJson(Map<String, dynamic> json) {
  return _RotationApi.fromJson(json);
}

/// @nodoc
mixin _$RotationApi {
  List<RotationApiData> get data => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RotationApiCopyWith<RotationApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationApiCopyWith<$Res> {
  factory $RotationApiCopyWith(
          RotationApi value, $Res Function(RotationApi) then) =
      _$RotationApiCopyWithImpl<$Res, RotationApi>;
  @useResult
  $Res call({List<RotationApiData> data, DateTime lastUpdated});
}

/// @nodoc
class _$RotationApiCopyWithImpl<$Res, $Val extends RotationApi>
    implements $RotationApiCopyWith<$Res> {
  _$RotationApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RotationApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RotationApiCopyWith<$Res>
    implements $RotationApiCopyWith<$Res> {
  factory _$$_RotationApiCopyWith(
          _$_RotationApi value, $Res Function(_$_RotationApi) then) =
      __$$_RotationApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RotationApiData> data, DateTime lastUpdated});
}

/// @nodoc
class __$$_RotationApiCopyWithImpl<$Res>
    extends _$RotationApiCopyWithImpl<$Res, _$_RotationApi>
    implements _$$_RotationApiCopyWith<$Res> {
  __$$_RotationApiCopyWithImpl(
      _$_RotationApi _value, $Res Function(_$_RotationApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_RotationApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RotationApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_RotationApi implements _RotationApi {
  const _$_RotationApi(
      {required final List<RotationApiData> data, required this.lastUpdated})
      : _data = data;

  factory _$_RotationApi.fromJson(Map<String, dynamic> json) =>
      _$$_RotationApiFromJson(json);

  final List<RotationApiData> _data;
  @override
  List<RotationApiData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'RotationApi(data: $data, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationApiCopyWith<_$_RotationApi> get copyWith =>
      __$$_RotationApiCopyWithImpl<_$_RotationApi>(this, _$identity);
}

abstract class _RotationApi implements RotationApi {
  const factory _RotationApi(
      {required final List<RotationApiData> data,
      required final DateTime lastUpdated}) = _$_RotationApi;

  factory _RotationApi.fromJson(Map<String, dynamic> json) =
      _$_RotationApi.fromJson;

  @override
  List<RotationApiData> get data;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_RotationApiCopyWith<_$_RotationApi> get copyWith =>
      throw _privateConstructorUsedError;
}

RotationApiData _$RotationApiDataFromJson(Map<String, dynamic> json) {
  return _RotationApiData.fromJson(json);
}

/// @nodoc
mixin _$RotationApiData {
  String get code => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  bool get latest => throw _privateConstructorUsedError;
  List<String> get rotated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RotationApiDataCopyWith<RotationApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationApiDataCopyWith<$Res> {
  factory $RotationApiDataCopyWith(
          RotationApiData value, $Res Function(RotationApiData) then) =
      _$RotationApiDataCopyWithImpl<$Res, RotationApiData>;
  @useResult
  $Res call(
      {String code,
      DateTime? dateStart,
      String formatCode,
      String name,
      bool current,
      bool latest,
      List<String> rotated});
}

/// @nodoc
class _$RotationApiDataCopyWithImpl<$Res, $Val extends RotationApiData>
    implements $RotationApiDataCopyWith<$Res> {
  _$RotationApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? dateStart = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? current = null,
    Object? latest = null,
    Object? rotated = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as bool,
      rotated: null == rotated
          ? _value.rotated
          : rotated // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RotationApiDataCopyWith<$Res>
    implements $RotationApiDataCopyWith<$Res> {
  factory _$$_RotationApiDataCopyWith(
          _$_RotationApiData value, $Res Function(_$_RotationApiData) then) =
      __$$_RotationApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      DateTime? dateStart,
      String formatCode,
      String name,
      bool current,
      bool latest,
      List<String> rotated});
}

/// @nodoc
class __$$_RotationApiDataCopyWithImpl<$Res>
    extends _$RotationApiDataCopyWithImpl<$Res, _$_RotationApiData>
    implements _$$_RotationApiDataCopyWith<$Res> {
  __$$_RotationApiDataCopyWithImpl(
      _$_RotationApiData _value, $Res Function(_$_RotationApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? dateStart = freezed,
    Object? formatCode = null,
    Object? name = null,
    Object? current = null,
    Object? latest = null,
    Object? rotated = null,
  }) {
    return _then(_$_RotationApiData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as bool,
      rotated: null == rotated
          ? _value._rotated
          : rotated // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_RotationApiData implements _RotationApiData {
  const _$_RotationApiData(
      {required this.code,
      required this.dateStart,
      required this.formatCode,
      required this.name,
      required this.current,
      required this.latest,
      required final List<String> rotated})
      : _rotated = rotated;

  factory _$_RotationApiData.fromJson(Map<String, dynamic> json) =>
      _$$_RotationApiDataFromJson(json);

  @override
  final String code;
  @override
  final DateTime? dateStart;
  @override
  final String formatCode;
  @override
  final String name;
  @override
  final bool current;
  @override
  final bool latest;
  final List<String> _rotated;
  @override
  List<String> get rotated {
    if (_rotated is EqualUnmodifiableListView) return _rotated;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rotated);
  }

  @override
  String toString() {
    return 'RotationApiData(code: $code, dateStart: $dateStart, formatCode: $formatCode, name: $name, current: $current, latest: $latest, rotated: $rotated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationApiData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.latest, latest) || other.latest == latest) &&
            const DeepCollectionEquality().equals(other._rotated, _rotated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, dateStart, formatCode,
      name, current, latest, const DeepCollectionEquality().hash(_rotated));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationApiDataCopyWith<_$_RotationApiData> get copyWith =>
      __$$_RotationApiDataCopyWithImpl<_$_RotationApiData>(this, _$identity);
}

abstract class _RotationApiData implements RotationApiData {
  const factory _RotationApiData(
      {required final String code,
      required final DateTime? dateStart,
      required final String formatCode,
      required final String name,
      required final bool current,
      required final bool latest,
      required final List<String> rotated}) = _$_RotationApiData;

  factory _RotationApiData.fromJson(Map<String, dynamic> json) =
      _$_RotationApiData.fromJson;

  @override
  String get code;
  @override
  DateTime? get dateStart;
  @override
  String get formatCode;
  @override
  String get name;
  @override
  bool get current;
  @override
  bool get latest;
  @override
  List<String> get rotated;
  @override
  @JsonKey(ignore: true)
  _$$_RotationApiDataCopyWith<_$_RotationApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

MwlApi _$MwlApiFromJson(Map<String, dynamic> json) {
  return _MwlApi.fromJson(json);
}

/// @nodoc
mixin _$MwlApi {
  List<MwlApiData> get data => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MwlApiCopyWith<MwlApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MwlApiCopyWith<$Res> {
  factory $MwlApiCopyWith(MwlApi value, $Res Function(MwlApi) then) =
      _$MwlApiCopyWithImpl<$Res, MwlApi>;
  @useResult
  $Res call({List<MwlApiData> data, DateTime lastUpdated});
}

/// @nodoc
class _$MwlApiCopyWithImpl<$Res, $Val extends MwlApi>
    implements $MwlApiCopyWith<$Res> {
  _$MwlApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MwlApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MwlApiCopyWith<$Res> implements $MwlApiCopyWith<$Res> {
  factory _$$_MwlApiCopyWith(_$_MwlApi value, $Res Function(_$_MwlApi) then) =
      __$$_MwlApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MwlApiData> data, DateTime lastUpdated});
}

/// @nodoc
class __$$_MwlApiCopyWithImpl<$Res>
    extends _$MwlApiCopyWithImpl<$Res, _$_MwlApi>
    implements _$$_MwlApiCopyWith<$Res> {
  __$$_MwlApiCopyWithImpl(_$_MwlApi _value, $Res Function(_$_MwlApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$_MwlApi(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MwlApiData>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_MwlApi implements _MwlApi {
  const _$_MwlApi(
      {required final List<MwlApiData> data, required this.lastUpdated})
      : _data = data;

  factory _$_MwlApi.fromJson(Map<String, dynamic> json) =>
      _$$_MwlApiFromJson(json);

  final List<MwlApiData> _data;
  @override
  List<MwlApiData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'MwlApi(data: $data, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MwlApi &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MwlApiCopyWith<_$_MwlApi> get copyWith =>
      __$$_MwlApiCopyWithImpl<_$_MwlApi>(this, _$identity);
}

abstract class _MwlApi implements MwlApi {
  const factory _MwlApi(
      {required final List<MwlApiData> data,
      required final DateTime lastUpdated}) = _$_MwlApi;

  factory _MwlApi.fromJson(Map<String, dynamic> json) = _$_MwlApi.fromJson;

  @override
  List<MwlApiData> get data;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_MwlApiCopyWith<_$_MwlApi> get copyWith =>
      throw _privateConstructorUsedError;
}

MwlApiData _$MwlApiDataFromJson(Map<String, dynamic> json) {
  return _MwlApiData.fromJson(json);
}

/// @nodoc
mixin _$MwlApiData {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get formatCode => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get latest => throw _privateConstructorUsedError;
  Map<String, MwlCardApiData> get cards => throw _privateConstructorUsedError;
  Map<String, MwlCardApiData> get cardTitles =>
      throw _privateConstructorUsedError;
  int? get runnerPoints => throw _privateConstructorUsedError;
  int? get corpPoints => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MwlApiDataCopyWith<MwlApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MwlApiDataCopyWith<$Res> {
  factory $MwlApiDataCopyWith(
          MwlApiData value, $Res Function(MwlApiData) then) =
      _$MwlApiDataCopyWithImpl<$Res, MwlApiData>;
  @useResult
  $Res call(
      {String code,
      String name,
      String formatCode,
      DateTime? dateStart,
      bool active,
      bool latest,
      Map<String, MwlCardApiData> cards,
      Map<String, MwlCardApiData> cardTitles,
      int? runnerPoints,
      int? corpPoints});
}

/// @nodoc
class _$MwlApiDataCopyWithImpl<$Res, $Val extends MwlApiData>
    implements $MwlApiDataCopyWith<$Res> {
  _$MwlApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? formatCode = null,
    Object? dateStart = freezed,
    Object? active = null,
    Object? latest = null,
    Object? cards = null,
    Object? cardTitles = null,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as bool,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, MwlCardApiData>,
      cardTitles: null == cardTitles
          ? _value.cardTitles
          : cardTitles // ignore: cast_nullable_to_non_nullable
              as Map<String, MwlCardApiData>,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MwlApiDataCopyWith<$Res>
    implements $MwlApiDataCopyWith<$Res> {
  factory _$$_MwlApiDataCopyWith(
          _$_MwlApiData value, $Res Function(_$_MwlApiData) then) =
      __$$_MwlApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String formatCode,
      DateTime? dateStart,
      bool active,
      bool latest,
      Map<String, MwlCardApiData> cards,
      Map<String, MwlCardApiData> cardTitles,
      int? runnerPoints,
      int? corpPoints});
}

/// @nodoc
class __$$_MwlApiDataCopyWithImpl<$Res>
    extends _$MwlApiDataCopyWithImpl<$Res, _$_MwlApiData>
    implements _$$_MwlApiDataCopyWith<$Res> {
  __$$_MwlApiDataCopyWithImpl(
      _$_MwlApiData _value, $Res Function(_$_MwlApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? formatCode = null,
    Object? dateStart = freezed,
    Object? active = null,
    Object? latest = null,
    Object? cards = null,
    Object? cardTitles = null,
    Object? runnerPoints = freezed,
    Object? corpPoints = freezed,
  }) {
    return _then(_$_MwlApiData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formatCode: null == formatCode
          ? _value.formatCode
          : formatCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as bool,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Map<String, MwlCardApiData>,
      cardTitles: null == cardTitles
          ? _value._cardTitles
          : cardTitles // ignore: cast_nullable_to_non_nullable
              as Map<String, MwlCardApiData>,
      runnerPoints: freezed == runnerPoints
          ? _value.runnerPoints
          : runnerPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      corpPoints: freezed == corpPoints
          ? _value.corpPoints
          : corpPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_MwlApiData implements _MwlApiData {
  const _$_MwlApiData(
      {required this.code,
      required this.name,
      required this.formatCode,
      required this.dateStart,
      required this.active,
      required this.latest,
      required final Map<String, MwlCardApiData> cards,
      required final Map<String, MwlCardApiData> cardTitles,
      required this.runnerPoints,
      required this.corpPoints})
      : _cards = cards,
        _cardTitles = cardTitles;

  factory _$_MwlApiData.fromJson(Map<String, dynamic> json) =>
      _$$_MwlApiDataFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String formatCode;
  @override
  final DateTime? dateStart;
  @override
  final bool active;
  @override
  final bool latest;
  final Map<String, MwlCardApiData> _cards;
  @override
  Map<String, MwlCardApiData> get cards {
    if (_cards is EqualUnmodifiableMapView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cards);
  }

  final Map<String, MwlCardApiData> _cardTitles;
  @override
  Map<String, MwlCardApiData> get cardTitles {
    if (_cardTitles is EqualUnmodifiableMapView) return _cardTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cardTitles);
  }

  @override
  final int? runnerPoints;
  @override
  final int? corpPoints;

  @override
  String toString() {
    return 'MwlApiData(code: $code, name: $name, formatCode: $formatCode, dateStart: $dateStart, active: $active, latest: $latest, cards: $cards, cardTitles: $cardTitles, runnerPoints: $runnerPoints, corpPoints: $corpPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MwlApiData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formatCode, formatCode) ||
                other.formatCode == formatCode) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.latest, latest) || other.latest == latest) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality()
                .equals(other._cardTitles, _cardTitles) &&
            (identical(other.runnerPoints, runnerPoints) ||
                other.runnerPoints == runnerPoints) &&
            (identical(other.corpPoints, corpPoints) ||
                other.corpPoints == corpPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      formatCode,
      dateStart,
      active,
      latest,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_cardTitles),
      runnerPoints,
      corpPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MwlApiDataCopyWith<_$_MwlApiData> get copyWith =>
      __$$_MwlApiDataCopyWithImpl<_$_MwlApiData>(this, _$identity);
}

abstract class _MwlApiData implements MwlApiData {
  const factory _MwlApiData(
      {required final String code,
      required final String name,
      required final String formatCode,
      required final DateTime? dateStart,
      required final bool active,
      required final bool latest,
      required final Map<String, MwlCardApiData> cards,
      required final Map<String, MwlCardApiData> cardTitles,
      required final int? runnerPoints,
      required final int? corpPoints}) = _$_MwlApiData;

  factory _MwlApiData.fromJson(Map<String, dynamic> json) =
      _$_MwlApiData.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get formatCode;
  @override
  DateTime? get dateStart;
  @override
  bool get active;
  @override
  bool get latest;
  @override
  Map<String, MwlCardApiData> get cards;
  @override
  Map<String, MwlCardApiData> get cardTitles;
  @override
  int? get runnerPoints;
  @override
  int? get corpPoints;
  @override
  @JsonKey(ignore: true)
  _$$_MwlApiDataCopyWith<_$_MwlApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

MwlCardApiData _$MwlCardApiDataFromJson(Map<String, dynamic> json) {
  return _MwlCardApiData.fromJson(json);
}

/// @nodoc
mixin _$MwlCardApiData {
  int? get globalPenalty => throw _privateConstructorUsedError;
  int? get universalFactionCost => throw _privateConstructorUsedError;
  int? get isRestricted => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get deckLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MwlCardApiDataCopyWith<MwlCardApiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MwlCardApiDataCopyWith<$Res> {
  factory $MwlCardApiDataCopyWith(
          MwlCardApiData value, $Res Function(MwlCardApiData) then) =
      _$MwlCardApiDataCopyWithImpl<$Res, MwlCardApiData>;
  @useResult
  $Res call(
      {int? globalPenalty,
      int? universalFactionCost,
      int? isRestricted,
      int? points,
      int? deckLimit});
}

/// @nodoc
class _$MwlCardApiDataCopyWithImpl<$Res, $Val extends MwlCardApiData>
    implements $MwlCardApiDataCopyWith<$Res> {
  _$MwlCardApiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalPenalty = freezed,
    Object? universalFactionCost = freezed,
    Object? isRestricted = freezed,
    Object? points = freezed,
    Object? deckLimit = freezed,
  }) {
    return _then(_value.copyWith(
      globalPenalty: freezed == globalPenalty
          ? _value.globalPenalty
          : globalPenalty // ignore: cast_nullable_to_non_nullable
              as int?,
      universalFactionCost: freezed == universalFactionCost
          ? _value.universalFactionCost
          : universalFactionCost // ignore: cast_nullable_to_non_nullable
              as int?,
      isRestricted: freezed == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      deckLimit: freezed == deckLimit
          ? _value.deckLimit
          : deckLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MwlCardApiDataCopyWith<$Res>
    implements $MwlCardApiDataCopyWith<$Res> {
  factory _$$_MwlCardApiDataCopyWith(
          _$_MwlCardApiData value, $Res Function(_$_MwlCardApiData) then) =
      __$$_MwlCardApiDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? globalPenalty,
      int? universalFactionCost,
      int? isRestricted,
      int? points,
      int? deckLimit});
}

/// @nodoc
class __$$_MwlCardApiDataCopyWithImpl<$Res>
    extends _$MwlCardApiDataCopyWithImpl<$Res, _$_MwlCardApiData>
    implements _$$_MwlCardApiDataCopyWith<$Res> {
  __$$_MwlCardApiDataCopyWithImpl(
      _$_MwlCardApiData _value, $Res Function(_$_MwlCardApiData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalPenalty = freezed,
    Object? universalFactionCost = freezed,
    Object? isRestricted = freezed,
    Object? points = freezed,
    Object? deckLimit = freezed,
  }) {
    return _then(_$_MwlCardApiData(
      globalPenalty: freezed == globalPenalty
          ? _value.globalPenalty
          : globalPenalty // ignore: cast_nullable_to_non_nullable
              as int?,
      universalFactionCost: freezed == universalFactionCost
          ? _value.universalFactionCost
          : universalFactionCost // ignore: cast_nullable_to_non_nullable
              as int?,
      isRestricted: freezed == isRestricted
          ? _value.isRestricted
          : isRestricted // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      deckLimit: freezed == deckLimit
          ? _value.deckLimit
          : deckLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_MwlCardApiData implements _MwlCardApiData {
  const _$_MwlCardApiData(
      {required this.globalPenalty,
      required this.universalFactionCost,
      required this.isRestricted,
      required this.points,
      required this.deckLimit});

  factory _$_MwlCardApiData.fromJson(Map<String, dynamic> json) =>
      _$$_MwlCardApiDataFromJson(json);

  @override
  final int? globalPenalty;
  @override
  final int? universalFactionCost;
  @override
  final int? isRestricted;
  @override
  final int? points;
  @override
  final int? deckLimit;

  @override
  String toString() {
    return 'MwlCardApiData(globalPenalty: $globalPenalty, universalFactionCost: $universalFactionCost, isRestricted: $isRestricted, points: $points, deckLimit: $deckLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MwlCardApiData &&
            (identical(other.globalPenalty, globalPenalty) ||
                other.globalPenalty == globalPenalty) &&
            (identical(other.universalFactionCost, universalFactionCost) ||
                other.universalFactionCost == universalFactionCost) &&
            (identical(other.isRestricted, isRestricted) ||
                other.isRestricted == isRestricted) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.deckLimit, deckLimit) ||
                other.deckLimit == deckLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, globalPenalty,
      universalFactionCost, isRestricted, points, deckLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MwlCardApiDataCopyWith<_$_MwlCardApiData> get copyWith =>
      __$$_MwlCardApiDataCopyWithImpl<_$_MwlCardApiData>(this, _$identity);
}

abstract class _MwlCardApiData implements MwlCardApiData {
  const factory _MwlCardApiData(
      {required final int? globalPenalty,
      required final int? universalFactionCost,
      required final int? isRestricted,
      required final int? points,
      required final int? deckLimit}) = _$_MwlCardApiData;

  factory _MwlCardApiData.fromJson(Map<String, dynamic> json) =
      _$_MwlCardApiData.fromJson;

  @override
  int? get globalPenalty;
  @override
  int? get universalFactionCost;
  @override
  int? get isRestricted;
  @override
  int? get points;
  @override
  int? get deckLimit;
  @override
  @JsonKey(ignore: true)
  _$$_MwlCardApiDataCopyWith<_$_MwlCardApiData> get copyWith =>
      throw _privateConstructorUsedError;
}
