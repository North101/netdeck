import '/db/database.dart';

class DateTimeUtcConverter extends MyTypeConverter<DateTime, int> {
  const DateTimeUtcConverter();

  @override
  DateTime fromSql(int fromDb) => DateTime.fromMillisecondsSinceEpoch(fromDb * 1000, isUtc: true);

  @override
  int toSql(DateTime value) => value.toUtc().millisecondsSinceEpoch ~/ 1000;
}
