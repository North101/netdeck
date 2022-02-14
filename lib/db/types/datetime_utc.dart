import 'package:drift/drift.dart';

class DateTimeUtcConverter extends NullAwareTypeConverter<DateTime, int> {
  const DateTimeUtcConverter();

  @override
  DateTime requireMapToDart(int fromDb) => DateTime.fromMillisecondsSinceEpoch(fromDb * 1000, isUtc: true);

  @override
  int requireMapToSql(DateTime value) => value.toUtc().millisecondsSinceEpoch ~/ 1000;
}
