import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

class ColorConverter extends NullAwareTypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color requireMapToDart(int fromDb) => Color(fromDb);

  @override
  int requireMapToSql(Color value) => value.value;
}

