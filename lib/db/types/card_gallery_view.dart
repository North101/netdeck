import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

enum CardGalleryView {
  image,
  text,
}

class CardGalleryViewConverter extends NullAwareTypeConverter<CardGalleryView, String> {
  const CardGalleryViewConverter(this.defaultValue);

  final CardGalleryView defaultValue;

  @override
  CardGalleryView requireMapToDart(String fromDb) =>
      CardGalleryView.values.firstWhereOrNull((e) => requireMapToSql(e) == fromDb) ?? defaultValue;

  @override
  String requireMapToSql(CardGalleryView value) => value.toString();
}
