import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';

part 'filter_type.freezed.dart';

@freezed
class FilterType<T> extends Iterable<T> with _$FilterType<T> {
  factory FilterType({
    @Default(true) bool visible,
    @Default({}) Set<T> values,
    @Default({}) Set<T> always,
    @Default({}) Set<T> never,
  }) = _FilterType;

  const FilterType._();

  factory FilterType.fromJson(Map<String, dynamic> data) {
    return FilterType(
      visible: data['visible'] as bool,
      always: Set<T>.from(data['always']),
      values: Set<T>.from(data['values']),
      never: Set<T>.from(data['never']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'visible': visible,
      'always': always.toList(),
      'values': values.toList(),
      'never': never.toList(),
    };
  }

  @override
  Iterator<T> get iterator => ({...values}.union(always).difference(never)).iterator;

  bool get isVisible => visible && isNotEmpty;
}

class FilterState {
  const FilterState({
    this.always = true,
    this.values = true,
    this.never = true,
  });

  final bool always;
  final bool values;
  final bool never;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
      );

  @override
  bool operator ==(Object other) =>
      other is FactionFilter && //
      other.always == always && //
      other.values == values && //
      other.never == never;
}

abstract class FormatFilter implements FilterState {
  Format get format;
}

abstract class RotationFilter implements FilterState {
  Rotation get rotation;
}

abstract class MwlFilter implements FilterState {
  Mwl get mwl;
}

abstract class CycleFilter implements FilterState {
  Cycle get cycle;
}

class PackFilter extends FilterState {
  const PackFilter({
    super.always,
    super.values,
    super.never,
    required this.pack,
  });

  final Pack pack;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        pack,
      );

  @override
  bool operator ==(Object other) =>
      other is PackFilter &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.pack == pack;
}

class SideFilter extends FilterState {
  const SideFilter({
    super.always,
    super.values,
    super.never,
    required this.side,
  });

  final Side side;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        side,
      );

  @override
  bool operator ==(Object other) =>
      other is SideFilter &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.side == side;
}

class FactionFilter extends SideFilter {
  const FactionFilter({
    super.always,
    super.values,
    super.never,
    required super.side,
    required this.faction,
  });

  final Faction faction;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        side,
        faction,
      );

  @override
  bool operator ==(Object other) =>
      other is FactionFilter &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.side == side &&
      other.faction == faction;
}

class TypeFilter extends FilterState implements SideFilter {
  const TypeFilter({
    super.always,
    super.values,
    super.never,
    this.filterSubtypes = true,
    required this.type,
    required this.subtype,
    required this.side,
  });

  final bool filterSubtypes;

  final Type type;
  final Type subtype;

  @override
  final Side side;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        filterSubtypes,
        type,
        subtype,
        side,
      );

  @override
  bool operator ==(Object other) =>
      other is TypeFilter &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.filterSubtypes == filterSubtypes &&
      other.type == type &&
      other.subtype == subtype &&
      other.side == side;
}

class CardFilterState extends FilterState implements PackFilter, CycleFilter, FactionFilter, TypeFilter {
  const CardFilterState({
    super.always,
    super.values,
    super.never,
    this.filterSubtypes = true,
    this.filterRotation = true,
    this.filterMwl = true,
    this.filterCollection = true,
    required this.card,
    required this.pack,
    required this.cycle,
    required this.faction,
    required this.side,
    required this.type,
    required this.subtype,
    required this.mwlCard,
  });

  @override
  final bool filterSubtypes;
  final bool filterRotation;
  final bool filterMwl;
  final bool filterCollection;

  final Card card;
  @override
  final Pack pack;
  @override
  final Cycle cycle;
  @override
  final Faction faction;
  @override
  final Side side;
  @override
  final Type type;
  @override
  final Type subtype;
  final MwlCardTitle mwlCard;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        filterSubtypes,
        filterRotation,
        filterMwl,
        filterCollection,
        card,
        pack,
        cycle,
        faction,
        side,
        type,
        subtype,
        mwlCard,
      );

  @override
  bool operator ==(Object other) =>
      other is CardFilterState &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.filterSubtypes == filterSubtypes &&
      other.filterRotation == filterRotation &&
      other.filterMwl == filterMwl &&
      other.filterCollection == filterCollection &&
      other.card == card &&
      other.pack == pack &&
      other.cycle == cycle &&
      other.faction == faction &&
      other.side == side &&
      other.type == type &&
      other.subtype == subtype &&
      other.mwlCard == mwlCard;
}

class DeckFilterState extends FilterState
    implements PackFilter, CycleFilter, FactionFilter, TypeFilter, FormatFilter, RotationFilter, MwlFilter {
  const DeckFilterState({
    super.always,
    super.values,
    super.never,
    this.filterSubtypes = true,
    required this.deck,
    required this.identity,
    required this.cycle,
    required this.pack,
    required this.faction,
    required this.side,
    required this.type,
    required this.subtype,
    required this.format,
    required this.rotation,
    required this.mwl,
  });

  final Deck deck;
  final Card identity;

  @override
  final Cycle cycle;

  @override
  final Faction faction;

  @override
  final Format format;

  @override
  final Mwl mwl;

  @override
  final Pack pack;

  @override
  final Rotation rotation;

  @override
  final Side side;

  @override
  final Type subtype;

  @override
  final Type type;

  @override
  final bool filterSubtypes;

  @override
  int get hashCode => Object.hash(
        always,
        values,
        never,
        filterSubtypes,
        deck,
        identity,
        cycle,
        pack,
        faction,
        side,
        type,
        subtype,
        format,
        rotation,
        mwl,
      );

  @override
  bool operator ==(Object other) =>
      other is DeckFilterState &&
      other.always == always &&
      other.values == values &&
      other.never == never &&
      other.filterSubtypes == filterSubtypes &&
      other.deck == deck &&
      other.identity == identity &&
      other.cycle == cycle &&
      other.pack == pack &&
      other.faction == faction &&
      other.side == side &&
      other.type == type &&
      other.subtype == subtype &&
      other.format == format &&
      other.rotation == rotation &&
      other.mwl == mwl;
}
