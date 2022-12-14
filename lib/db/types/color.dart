import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class ColorConverter extends TypeConverter<Color, int> with JsonTypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}
