import '../database.dart';

extension CardDataEx on CardData {
  String get url => 'https://netrunnerdb.com/en/card/$code';
  String get imageUrl => 'https://netrunnerdb.com/card_image/large/$code.jpg';
}
