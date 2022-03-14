import '/db/database.dart';

extension CardDataEx on CardData {
  Uri get url => Uri.https('netrunnerdb.com', '/en/card/$code');
}
