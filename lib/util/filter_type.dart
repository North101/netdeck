import 'package:freezed_annotation/freezed_annotation.dart';

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

  @override
  Iterator<T> get iterator => (values.union(always).difference(never)).iterator;

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
}

class TypeFilterState extends FilterState {
  const TypeFilterState({
    bool always = true,
    bool values = true,
    bool never = true,
    this.subtypes = true,
  }) : super(
          always: always,
          values: values,
          never: never,
        );

  final bool subtypes;
}

class CardFilterState extends TypeFilterState {
  const CardFilterState({
    bool always = true,
    bool values = true,
    bool never = true,
    bool subtypes = true,
    this.rotation = true,
    this.mwl = true,
    this.collection = true,
  }) : super(
          always: always,
          values: values,
          never: never,
          subtypes: subtypes,
        );

  final bool rotation;
  final bool mwl;
  final bool collection;
}