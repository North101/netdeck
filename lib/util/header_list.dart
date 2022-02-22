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

  int sumUntilItem(HeaderItems<T> item) {
    return items.take(items.indexOf(item)).map((value) {
        return value.length;
      }).sum;
  }

  HeaderItems<T> operator [](int index) => items[index];
}
