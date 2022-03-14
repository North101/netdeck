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
}

class TypeFilterState extends FilterState {
  const TypeFilterState({
    super.always,
    super.values,
    super.never,
    this.subtypes = true,
  });

  final bool subtypes;
}

class CardFilterState extends TypeFilterState {
  const CardFilterState({
    super.always,
    super.values,
    super.never,
    super.subtypes,
    this.rotation = true,
    this.mwl = true,
    this.collection = true,
  });

  final bool rotation;
  final bool mwl;
  final bool collection;
}
