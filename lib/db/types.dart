import 'package:collection/collection.dart';
import 'package:timeago/timeago.dart' as timeago;

export 'types/card_group.dart';
export 'types/card_sort.dart';
export 'types/color.dart';
export 'types/datetime_utc.dart';
export 'types/deck_group.dart';
export 'types/deck_sort.dart';
export 'types/deck_state.dart';

String relativeDate(DateTime value) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  if (value.isAfter(today)) {
    return 'Today';
  }
  final yesterday = today.subtract(const Duration(days: 1));
  if (value.isAfter(yesterday)) {
    return 'Yesterday';
  }
  return timeago.format(value);
}

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
