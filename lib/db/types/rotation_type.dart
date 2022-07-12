import '/db/database.dart';

enum RotationType {
  current,
  latest,
}

class RotationTypeConverter extends MyTypeConverter<RotationType, String> {
  const RotationTypeConverter();

  @override
  RotationType fromSql(String fromDb) =>
      RotationType.values.firstWhere((e) => toSql(e) == fromDb);

  @override
  String toSql(RotationType value) => value.name;
}