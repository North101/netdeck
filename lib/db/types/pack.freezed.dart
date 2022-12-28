// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackData _$PackDataFromJson(Map<String, dynamic> json) {
  return _PackData.fromJson(json);
}

/// @nodoc
mixin _$PackData {
  String get code => throw _privateConstructorUsedError;
  String get cycleCode => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateRelease => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackDataCopyWith<PackData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackDataCopyWith<$Res> {
  factory $PackDataCopyWith(PackData value, $Res Function(PackData) then) =
      _$PackDataCopyWithImpl<$Res, PackData>;
  @useResult
  $Res call(
      {String code,
      String cycleCode,
      int position,
      String name,
      DateTime? dateRelease,
      int? size});
}

/// @nodoc
class _$PackDataCopyWithImpl<$Res, $Val extends PackData>
    implements $PackDataCopyWith<$Res> {
  _$PackDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? cycleCode = null,
    Object? position = null,
    Object? name = null,
    Object? dateRelease = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cycleCode: null == cycleCode
          ? _value.cycleCode
          : cycleCode // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateRelease: freezed == dateRelease
          ? _value.dateRelease
          : dateRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackDataCopyWith<$Res> implements $PackDataCopyWith<$Res> {
  factory _$$_PackDataCopyWith(
          _$_PackData value, $Res Function(_$_PackData) then) =
      __$$_PackDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String cycleCode,
      int position,
      String name,
      DateTime? dateRelease,
      int? size});
}

/// @nodoc
class __$$_PackDataCopyWithImpl<$Res>
    extends _$PackDataCopyWithImpl<$Res, _$_PackData>
    implements _$$_PackDataCopyWith<$Res> {
  __$$_PackDataCopyWithImpl(
      _$_PackData _value, $Res Function(_$_PackData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? cycleCode = null,
    Object? position = null,
    Object? name = null,
    Object? dateRelease = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_PackData(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cycleCode: null == cycleCode
          ? _value.cycleCode
          : cycleCode // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateRelease: freezed == dateRelease
          ? _value.dateRelease
          : dateRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackData extends _PackData {
  const _$_PackData(
      {required this.code,
      required this.cycleCode,
      required this.position,
      required this.name,
      required this.dateRelease,
      required this.size})
      : super._();

  factory _$_PackData.fromJson(Map<String, dynamic> json) =>
      _$$_PackDataFromJson(json);

  @override
  final String code;
  @override
  final String cycleCode;
  @override
  final int position;
  @override
  final String name;
  @override
  final DateTime? dateRelease;
  @override
  final int? size;

  @override
  String toString() {
    return 'PackData(code: $code, cycleCode: $cycleCode, position: $position, name: $name, dateRelease: $dateRelease, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.cycleCode, cycleCode) ||
                other.cycleCode == cycleCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateRelease, dateRelease) ||
                other.dateRelease == dateRelease) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, cycleCode, position, name, dateRelease, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackDataCopyWith<_$_PackData> get copyWith =>
      __$$_PackDataCopyWithImpl<_$_PackData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackDataToJson(
      this,
    );
  }
}

abstract class _PackData extends PackData {
  const factory _PackData(
      {required final String code,
      required final String cycleCode,
      required final int position,
      required final String name,
      required final DateTime? dateRelease,
      required final int? size}) = _$_PackData;
  const _PackData._() : super._();

  factory _PackData.fromJson(Map<String, dynamic> json) = _$_PackData.fromJson;

  @override
  String get code;
  @override
  String get cycleCode;
  @override
  int get position;
  @override
  String get name;
  @override
  DateTime? get dateRelease;
  @override
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$_PackDataCopyWith<_$_PackData> get copyWith =>
      throw _privateConstructorUsedError;
}

PackResult _$PackResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _PackResult.fromJson(json);
    case 'collection':
      return CollectionResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PackResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PackResult {
  PackData get pack => throw _privateConstructorUsedError;
  CycleData get cycle => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle) $default, {
    required TResult Function(PackData pack, CycleData cycle, bool inCollection)
        collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PackData pack, CycleData cycle)? $default, {
    TResult? Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle)? $default, {
    TResult Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackResult value) $default, {
    required TResult Function(CollectionResult value) collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackResult value)? $default, {
    TResult? Function(CollectionResult value)? collection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackResult value)? $default, {
    TResult Function(CollectionResult value)? collection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackResultCopyWith<PackResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackResultCopyWith<$Res> {
  factory $PackResultCopyWith(
          PackResult value, $Res Function(PackResult) then) =
      _$PackResultCopyWithImpl<$Res, PackResult>;
  @useResult
  $Res call({PackData pack, CycleData cycle});

  $PackDataCopyWith<$Res> get pack;
  $CycleDataCopyWith<$Res> get cycle;
}

/// @nodoc
class _$PackResultCopyWithImpl<$Res, $Val extends PackResult>
    implements $PackResultCopyWith<$Res> {
  _$PackResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pack = null,
    Object? cycle = null,
  }) {
    return _then(_value.copyWith(
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
    ) as $Val);
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
}

/// @nodoc
abstract class _$$_PackResultCopyWith<$Res>
    implements $PackResultCopyWith<$Res> {
  factory _$$_PackResultCopyWith(
          _$_PackResult value, $Res Function(_$_PackResult) then) =
      __$$_PackResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PackData pack, CycleData cycle});

  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
}

/// @nodoc
class __$$_PackResultCopyWithImpl<$Res>
    extends _$PackResultCopyWithImpl<$Res, _$_PackResult>
    implements _$$_PackResultCopyWith<$Res> {
  __$$_PackResultCopyWithImpl(
      _$_PackResult _value, $Res Function(_$_PackResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pack = null,
    Object? cycle = null,
  }) {
    return _then(_$_PackResult(
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackResult extends _PackResult {
  const _$_PackResult(
      {required this.pack, required this.cycle, final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_PackResult.fromJson(Map<String, dynamic> json) =>
      _$$_PackResultFromJson(json);

  @override
  final PackData pack;
  @override
  final CycleData cycle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PackResult(pack: $pack, cycle: $cycle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackResult &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pack, cycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackResultCopyWith<_$_PackResult> get copyWith =>
      __$$_PackResultCopyWithImpl<_$_PackResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle) $default, {
    required TResult Function(PackData pack, CycleData cycle, bool inCollection)
        collection,
  }) {
    return $default(pack, cycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PackData pack, CycleData cycle)? $default, {
    TResult? Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
  }) {
    return $default?.call(pack, cycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle)? $default, {
    TResult Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(pack, cycle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackResult value) $default, {
    required TResult Function(CollectionResult value) collection,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackResult value)? $default, {
    TResult? Function(CollectionResult value)? collection,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackResult value)? $default, {
    TResult Function(CollectionResult value)? collection,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackResultToJson(
      this,
    );
  }
}

abstract class _PackResult extends PackResult {
  const factory _PackResult(
      {required final PackData pack,
      required final CycleData cycle}) = _$_PackResult;
  const _PackResult._() : super._();

  factory _PackResult.fromJson(Map<String, dynamic> json) =
      _$_PackResult.fromJson;

  @override
  PackData get pack;
  @override
  CycleData get cycle;
  @override
  @JsonKey(ignore: true)
  _$$_PackResultCopyWith<_$_PackResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionResultCopyWith<$Res>
    implements $PackResultCopyWith<$Res> {
  factory _$$CollectionResultCopyWith(
          _$CollectionResult value, $Res Function(_$CollectionResult) then) =
      __$$CollectionResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PackData pack, CycleData cycle, bool inCollection});

  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
}

/// @nodoc
class __$$CollectionResultCopyWithImpl<$Res>
    extends _$PackResultCopyWithImpl<$Res, _$CollectionResult>
    implements _$$CollectionResultCopyWith<$Res> {
  __$$CollectionResultCopyWithImpl(
      _$CollectionResult _value, $Res Function(_$CollectionResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pack = null,
    Object? cycle = null,
    Object? inCollection = null,
  }) {
    return _then(_$CollectionResult(
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      inCollection: null == inCollection
          ? _value.inCollection
          : inCollection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionResult extends CollectionResult {
  const _$CollectionResult(
      {required this.pack,
      required this.cycle,
      required this.inCollection,
      final String? $type})
      : $type = $type ?? 'collection',
        super._();

  factory _$CollectionResult.fromJson(Map<String, dynamic> json) =>
      _$$CollectionResultFromJson(json);

  @override
  final PackData pack;
  @override
  final CycleData cycle;
  @override
  final bool inCollection;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PackResult.collection(pack: $pack, cycle: $cycle, inCollection: $inCollection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionResult &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.inCollection, inCollection) ||
                other.inCollection == inCollection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pack, cycle, inCollection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionResultCopyWith<_$CollectionResult> get copyWith =>
      __$$CollectionResultCopyWithImpl<_$CollectionResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle) $default, {
    required TResult Function(PackData pack, CycleData cycle, bool inCollection)
        collection,
  }) {
    return collection(pack, cycle, inCollection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PackData pack, CycleData cycle)? $default, {
    TResult? Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
  }) {
    return collection?.call(pack, cycle, inCollection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PackData pack, CycleData cycle)? $default, {
    TResult Function(PackData pack, CycleData cycle, bool inCollection)?
        collection,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(pack, cycle, inCollection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackResult value) $default, {
    required TResult Function(CollectionResult value) collection,
  }) {
    return collection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackResult value)? $default, {
    TResult? Function(CollectionResult value)? collection,
  }) {
    return collection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackResult value)? $default, {
    TResult Function(CollectionResult value)? collection,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionResultToJson(
      this,
    );
  }
}

abstract class CollectionResult extends PackResult {
  const factory CollectionResult(
      {required final PackData pack,
      required final CycleData cycle,
      required final bool inCollection}) = _$CollectionResult;
  const CollectionResult._() : super._();

  factory CollectionResult.fromJson(Map<String, dynamic> json) =
      _$CollectionResult.fromJson;

  @override
  PackData get pack;
  @override
  CycleData get cycle;
  bool get inCollection;
  @override
  @JsonKey(ignore: true)
  _$$CollectionResultCopyWith<_$CollectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}
