import '/db/database.dart';

extension PackResultEx on PackResult {
  bool get hasCycleName => cycle.name == pack.name;
}

extension CollectionEx on CollectionResult {
  bool get hasCycleName => cycle.name == pack.name;
}