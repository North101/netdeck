// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_filter_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeckFilterArguments _$DeckFilterArgumentsFromJson(Map<String, dynamic> json) {
  return _DeckFilterArguments.fromJson(json);
}

/// @nodoc
mixin _$DeckFilterArguments {
  FormatData? get format => throw _privateConstructorUsedError;
  RotationViewData? get rotation => throw _privateConstructorUsedError;
  MwlViewData? get mwl => throw _privateConstructorUsedError;
  FilterType<String> get packs => throw _privateConstructorUsedError;
  FilterType<String> get sides => throw _privateConstructorUsedError;
  FilterType<String> get factions => throw _privateConstructorUsedError;
  FilterType<String> get types => throw _privateConstructorUsedError;
  Set<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckFilterArgumentsCopyWith<DeckFilterArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckFilterArgumentsCopyWith<$Res> {
  factory $DeckFilterArgumentsCopyWith(
          DeckFilterArguments value, $Res Function(DeckFilterArguments) then) =
      _$DeckFilterArgumentsCopyWithImpl<$Res, DeckFilterArguments>;
  @useResult
  $Res call(
      {FormatData? format,
      RotationViewData? rotation,
      MwlViewData? mwl,
      FilterType<String> packs,
      FilterType<String> sides,
      FilterType<String> factions,
      FilterType<String> types,
      Set<String> tags});

  $FormatDataCopyWith<$Res>? get format;
  $RotationViewDataCopyWith<$Res>? get rotation;
  $MwlViewDataCopyWith<$Res>? get mwl;
  $FilterTypeCopyWith<String, $Res> get packs;
  $FilterTypeCopyWith<String, $Res> get sides;
  $FilterTypeCopyWith<String, $Res> get factions;
  $FilterTypeCopyWith<String, $Res> get types;
}

/// @nodoc
class _$DeckFilterArgumentsCopyWithImpl<$Res, $Val extends DeckFilterArguments>
    implements $DeckFilterArgumentsCopyWith<$Res> {
  _$DeckFilterArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = freezed,
    Object? rotation = freezed,
    Object? mwl = freezed,
    Object? packs = null,
    Object? sides = null,
    Object? factions = null,
    Object? types = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
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
      packs: null == packs
          ? _value.packs
          : packs // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      factions: null == factions
          ? _value.factions
          : factions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $RotationViewDataCopyWith<$Res>? get rotation {
    if (_value.rotation == null) {
      return null;
    }

    return $RotationViewDataCopyWith<$Res>(_value.rotation!, (value) {
      return _then(_value.copyWith(rotation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MwlViewDataCopyWith<$Res>? get mwl {
    if (_value.mwl == null) {
      return null;
    }

    return $MwlViewDataCopyWith<$Res>(_value.mwl!, (value) {
      return _then(_value.copyWith(mwl: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get packs {
    return $FilterTypeCopyWith<String, $Res>(_value.packs, (value) {
      return _then(_value.copyWith(packs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get sides {
    return $FilterTypeCopyWith<String, $Res>(_value.sides, (value) {
      return _then(_value.copyWith(sides: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get factions {
    return $FilterTypeCopyWith<String, $Res>(_value.factions, (value) {
      return _then(_value.copyWith(factions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterTypeCopyWith<String, $Res> get types {
    return $FilterTypeCopyWith<String, $Res>(_value.types, (value) {
      return _then(_value.copyWith(types: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeckFilterArgumentsCopyWith<$Res>
    implements $DeckFilterArgumentsCopyWith<$Res> {
  factory _$$_DeckFilterArgumentsCopyWith(_$_DeckFilterArguments value,
          $Res Function(_$_DeckFilterArguments) then) =
      __$$_DeckFilterArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormatData? format,
      RotationViewData? rotation,
      MwlViewData? mwl,
      FilterType<String> packs,
      FilterType<String> sides,
      FilterType<String> factions,
      FilterType<String> types,
      Set<String> tags});

  @override
  $FormatDataCopyWith<$Res>? get format;
  @override
  $RotationViewDataCopyWith<$Res>? get rotation;
  @override
  $MwlViewDataCopyWith<$Res>? get mwl;
  @override
  $FilterTypeCopyWith<String, $Res> get packs;
  @override
  $FilterTypeCopyWith<String, $Res> get sides;
  @override
  $FilterTypeCopyWith<String, $Res> get factions;
  @override
  $FilterTypeCopyWith<String, $Res> get types;
}

/// @nodoc
class __$$_DeckFilterArgumentsCopyWithImpl<$Res>
    extends _$DeckFilterArgumentsCopyWithImpl<$Res, _$_DeckFilterArguments>
    implements _$$_DeckFilterArgumentsCopyWith<$Res> {
  __$$_DeckFilterArgumentsCopyWithImpl(_$_DeckFilterArguments _value,
      $Res Function(_$_DeckFilterArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = freezed,
    Object? rotation = freezed,
    Object? mwl = freezed,
    Object? packs = null,
    Object? sides = null,
    Object? factions = null,
    Object? types = null,
    Object? tags = null,
  }) {
    return _then(_$_DeckFilterArguments(
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
      packs: null == packs
          ? _value.packs
          : packs // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      sides: null == sides
          ? _value.sides
          : sides // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      factions: null == factions
          ? _value.factions
          : factions // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as FilterType<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckFilterArguments implements _DeckFilterArguments {
  const _$_DeckFilterArguments(
      {required this.format,
      required this.rotation,
      required this.mwl,
      required this.packs,
      required this.sides,
      required this.factions,
      required this.types,
      required final Set<String> tags})
      : _tags = tags;

  factory _$_DeckFilterArguments.fromJson(Map<String, dynamic> json) =>
      _$$_DeckFilterArgumentsFromJson(json);

  @override
  final FormatData? format;
  @override
  final RotationViewData? rotation;
  @override
  final MwlViewData? mwl;
  @override
  final FilterType<String> packs;
  @override
  final FilterType<String> sides;
  @override
  final FilterType<String> factions;
  @override
  final FilterType<String> types;
  final Set<String> _tags;
  @override
  Set<String> get tags {
    if (_tags is EqualUnmodifiableSetView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_tags);
  }

  @override
  String toString() {
    return 'DeckFilterArguments(format: $format, rotation: $rotation, mwl: $mwl, packs: $packs, sides: $sides, factions: $factions, types: $types, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckFilterArguments &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.mwl, mwl) || other.mwl == mwl) &&
            const DeepCollectionEquality().equals(other.packs, packs) &&
            const DeepCollectionEquality().equals(other.sides, sides) &&
            const DeepCollectionEquality().equals(other.factions, factions) &&
            const DeepCollectionEquality().equals(other.types, types) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      format,
      rotation,
      mwl,
      const DeepCollectionEquality().hash(packs),
      const DeepCollectionEquality().hash(sides),
      const DeepCollectionEquality().hash(factions),
      const DeepCollectionEquality().hash(types),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckFilterArgumentsCopyWith<_$_DeckFilterArguments> get copyWith =>
      __$$_DeckFilterArgumentsCopyWithImpl<_$_DeckFilterArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckFilterArgumentsToJson(
      this,
    );
  }
}

abstract class _DeckFilterArguments implements DeckFilterArguments {
  const factory _DeckFilterArguments(
      {required final FormatData? format,
      required final RotationViewData? rotation,
      required final MwlViewData? mwl,
      required final FilterType<String> packs,
      required final FilterType<String> sides,
      required final FilterType<String> factions,
      required final FilterType<String> types,
      required final Set<String> tags}) = _$_DeckFilterArguments;

  factory _DeckFilterArguments.fromJson(Map<String, dynamic> json) =
      _$_DeckFilterArguments.fromJson;

  @override
  FormatData? get format;
  @override
  RotationViewData? get rotation;
  @override
  MwlViewData? get mwl;
  @override
  FilterType<String> get packs;
  @override
  FilterType<String> get sides;
  @override
  FilterType<String> get factions;
  @override
  FilterType<String> get types;
  @override
  Set<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_DeckFilterArgumentsCopyWith<_$_DeckFilterArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
