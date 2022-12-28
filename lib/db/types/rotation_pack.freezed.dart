// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rotation_pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RotationPackResult _$RotationPackResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _RotationPackResult.fromJson(json);
    case 'cards':
      return RotationCardResult.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RotationPackResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RotationPackResult {
  FormatData get format => throw _privateConstructorUsedError;
  RotationViewData get rotation => throw _privateConstructorUsedError;
  PackData get pack => throw _privateConstructorUsedError;
  CycleData get cycle => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)
        $default, {
    required TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)
        cards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RotationPackResult value) $default, {
    required TResult Function(RotationCardResult value) cards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RotationPackResult value)? $default, {
    TResult? Function(RotationCardResult value)? cards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RotationPackResult value)? $default, {
    TResult Function(RotationCardResult value)? cards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RotationPackResultCopyWith<RotationPackResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotationPackResultCopyWith<$Res> {
  factory $RotationPackResultCopyWith(
          RotationPackResult value, $Res Function(RotationPackResult) then) =
      _$RotationPackResultCopyWithImpl<$Res, RotationPackResult>;
  @useResult
  $Res call(
      {FormatData format,
      RotationViewData rotation,
      PackData pack,
      CycleData cycle});

  $FormatDataCopyWith<$Res> get format;
  $PackDataCopyWith<$Res> get pack;
  $CycleDataCopyWith<$Res> get cycle;
}

/// @nodoc
class _$RotationPackResultCopyWithImpl<$Res, $Val extends RotationPackResult>
    implements $RotationPackResultCopyWith<$Res> {
  _$RotationPackResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? rotation = null,
    Object? pack = null,
    Object? cycle = null,
  }) {
    return _then(_value.copyWith(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData,
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
  $FormatDataCopyWith<$Res> get format {
    return $FormatDataCopyWith<$Res>(_value.format, (value) {
      return _then(_value.copyWith(format: value) as $Val);
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
}

/// @nodoc
abstract class _$$_RotationPackResultCopyWith<$Res>
    implements $RotationPackResultCopyWith<$Res> {
  factory _$$_RotationPackResultCopyWith(_$_RotationPackResult value,
          $Res Function(_$_RotationPackResult) then) =
      __$$_RotationPackResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormatData format,
      RotationViewData rotation,
      PackData pack,
      CycleData cycle});

  @override
  $FormatDataCopyWith<$Res> get format;
  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
}

/// @nodoc
class __$$_RotationPackResultCopyWithImpl<$Res>
    extends _$RotationPackResultCopyWithImpl<$Res, _$_RotationPackResult>
    implements _$$_RotationPackResultCopyWith<$Res> {
  __$$_RotationPackResultCopyWithImpl(
      _$_RotationPackResult _value, $Res Function(_$_RotationPackResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? rotation = null,
    Object? pack = null,
    Object? cycle = null,
  }) {
    return _then(_$_RotationPackResult(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData,
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
class _$_RotationPackResult implements _RotationPackResult {
  const _$_RotationPackResult(
      {required this.format,
      required this.rotation,
      required this.pack,
      required this.cycle,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$_RotationPackResult.fromJson(Map<String, dynamic> json) =>
      _$$_RotationPackResultFromJson(json);

  @override
  final FormatData format;
  @override
  final RotationViewData rotation;
  @override
  final PackData pack;
  @override
  final CycleData cycle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RotationPackResult(format: $format, rotation: $rotation, pack: $pack, cycle: $cycle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RotationPackResult &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, format, rotation, pack, cycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RotationPackResultCopyWith<_$_RotationPackResult> get copyWith =>
      __$$_RotationPackResultCopyWithImpl<_$_RotationPackResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)
        $default, {
    required TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)
        cards,
  }) {
    return $default(format, rotation, pack, cycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
  }) {
    return $default?.call(format, rotation, pack, cycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(format, rotation, pack, cycle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RotationPackResult value) $default, {
    required TResult Function(RotationCardResult value) cards,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RotationPackResult value)? $default, {
    TResult? Function(RotationCardResult value)? cards,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RotationPackResult value)? $default, {
    TResult Function(RotationCardResult value)? cards,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_RotationPackResultToJson(
      this,
    );
  }
}

abstract class _RotationPackResult implements RotationPackResult {
  const factory _RotationPackResult(
      {required final FormatData format,
      required final RotationViewData rotation,
      required final PackData pack,
      required final CycleData cycle}) = _$_RotationPackResult;

  factory _RotationPackResult.fromJson(Map<String, dynamic> json) =
      _$_RotationPackResult.fromJson;

  @override
  FormatData get format;
  @override
  RotationViewData get rotation;
  @override
  PackData get pack;
  @override
  CycleData get cycle;
  @override
  @JsonKey(ignore: true)
  _$$_RotationPackResultCopyWith<_$_RotationPackResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RotationCardResultCopyWith<$Res>
    implements $RotationPackResultCopyWith<$Res> {
  factory _$$RotationCardResultCopyWith(_$RotationCardResult value,
          $Res Function(_$RotationCardResult) then) =
      __$$RotationCardResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormatData format,
      RotationViewData rotation,
      PackData pack,
      CycleData cycle,
      CardData card});

  @override
  $FormatDataCopyWith<$Res> get format;
  @override
  $PackDataCopyWith<$Res> get pack;
  @override
  $CycleDataCopyWith<$Res> get cycle;
  $CardDataCopyWith<$Res> get card;
}

/// @nodoc
class __$$RotationCardResultCopyWithImpl<$Res>
    extends _$RotationPackResultCopyWithImpl<$Res, _$RotationCardResult>
    implements _$$RotationCardResultCopyWith<$Res> {
  __$$RotationCardResultCopyWithImpl(
      _$RotationCardResult _value, $Res Function(_$RotationCardResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? rotation = null,
    Object? pack = null,
    Object? cycle = null,
    Object? card = null,
  }) {
    return _then(_$RotationCardResult(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as FormatData,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as RotationViewData,
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as PackData,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleData,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<$Res> get card {
    return $CardDataCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$RotationCardResult implements RotationCardResult {
  const _$RotationCardResult(
      {required this.format,
      required this.rotation,
      required this.pack,
      required this.cycle,
      required this.card,
      final String? $type})
      : $type = $type ?? 'cards';

  factory _$RotationCardResult.fromJson(Map<String, dynamic> json) =>
      _$$RotationCardResultFromJson(json);

  @override
  final FormatData format;
  @override
  final RotationViewData rotation;
  @override
  final PackData pack;
  @override
  final CycleData cycle;
  @override
  final CardData card;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RotationPackResult.cards(format: $format, rotation: $rotation, pack: $pack, cycle: $cycle, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RotationCardResult &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.pack, pack) || other.pack == pack) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, format, rotation, pack, cycle, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RotationCardResultCopyWith<_$RotationCardResult> get copyWith =>
      __$$RotationCardResultCopyWithImpl<_$RotationCardResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)
        $default, {
    required TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)
        cards,
  }) {
    return cards(format, rotation, pack, cycle, card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult? Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
  }) {
    return cards?.call(format, rotation, pack, cycle, card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle)?
        $default, {
    TResult Function(FormatData format, RotationViewData rotation,
            PackData pack, CycleData cycle, CardData card)?
        cards,
    required TResult orElse(),
  }) {
    if (cards != null) {
      return cards(format, rotation, pack, cycle, card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RotationPackResult value) $default, {
    required TResult Function(RotationCardResult value) cards,
  }) {
    return cards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RotationPackResult value)? $default, {
    TResult? Function(RotationCardResult value)? cards,
  }) {
    return cards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RotationPackResult value)? $default, {
    TResult Function(RotationCardResult value)? cards,
    required TResult orElse(),
  }) {
    if (cards != null) {
      return cards(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RotationCardResultToJson(
      this,
    );
  }
}

abstract class RotationCardResult implements RotationPackResult {
  const factory RotationCardResult(
      {required final FormatData format,
      required final RotationViewData rotation,
      required final PackData pack,
      required final CycleData cycle,
      required final CardData card}) = _$RotationCardResult;

  factory RotationCardResult.fromJson(Map<String, dynamic> json) =
      _$RotationCardResult.fromJson;

  @override
  FormatData get format;
  @override
  RotationViewData get rotation;
  @override
  PackData get pack;
  @override
  CycleData get cycle;
  CardData get card;
  @override
  @JsonKey(ignore: true)
  _$$RotationCardResultCopyWith<_$RotationCardResult> get copyWith =>
      throw _privateConstructorUsedError;
}
