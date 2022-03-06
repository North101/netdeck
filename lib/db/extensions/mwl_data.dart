import '/db/database.dart';

extension MwlDataEx on MwlData {
  int? points(SideData side) {
    switch (side.code) {
      case 'corp': return corpPoints;
      case 'runner': return runnerPoints;
      default: return null;
    }
  }
}