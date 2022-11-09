import '/db/database.dart';

enum MwlType {
  active,
  latest,
}

class MwlTypeConverter extends MyTypeConverter<MwlType, String> {
  const MwlTypeConverter();

  @override
  MwlType fromSql(String fromDb) => MwlType.values.firstWhere((e) => toSql(e) == fromDb);

  @override
  String toSql(MwlType value) => value.name;
}
