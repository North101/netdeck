import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

enum DeckState {
  local,
  remote,
}

class DeckStateConverter extends NullAwareTypeConverter<DeckState, String> {
  const DeckStateConverter(this.defaultValue);

  final DeckState defaultValue;

  @override
  DeckState requireMapToDart(String fromDb) =>
      DeckState.values.firstWhereOrNull((e) => requireMapToSql(e) == fromDb) ?? defaultValue;

  @override
  String requireMapToSql(DeckState value) => value.toString();
}
