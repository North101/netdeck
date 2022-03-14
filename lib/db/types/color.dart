import 'package:flutter/material.dart';

import '/db/database.dart';

class ColorConverter extends MyTypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}
