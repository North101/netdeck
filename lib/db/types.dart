import 'package:timeago/timeago.dart' as timeago;

export 'types/card_gallery_view.dart';
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
