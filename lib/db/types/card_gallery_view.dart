import 'package:collection/collection.dart';

import '/db/database.dart';

enum CardGalleryPageView {
  image,
  text,
}

class CardGalleryViewConverter extends MyTypeConverter<CardGalleryPageView, String> {
  const CardGalleryViewConverter(this.defaultValue);

  final CardGalleryPageView defaultValue;

  @override
  CardGalleryPageView fromSql(String fromDb) =>
      CardGalleryPageView.values.firstWhereOrNull((e) => toSql(e) == fromDb) ?? defaultValue;

  @override
  String toSql(CardGalleryPageView value) => value.name;
}
