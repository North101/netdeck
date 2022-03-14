import 'package:collection/collection.dart';

class HeaderItems<T> extends Iterable<T> {
  HeaderItems(this.header, this.items);

  final String header;
  final List<T> items;

  @override
  Iterator<T> get iterator => items.iterator;

  T operator [](int index) => items[index];
}

class HeaderList<T> extends Iterable<HeaderItems<T>> {
  HeaderList(this.items) : allItems = items.flattened.toList();

  final List<T> allItems;
  final List<HeaderItems<T>> items;

  @override
  Iterator<HeaderItems<T>> get iterator => items.iterator;

  Iterable<R> mapItems<R>(R Function(int offset, HeaderItems<T> e) toElement) sync* {
    int offset = 0;
    for (final item in items) {
      yield toElement(offset, item);
      offset += item.length;
    }
  }

  HeaderItems<T> operator [](int index) => items[index];
}
