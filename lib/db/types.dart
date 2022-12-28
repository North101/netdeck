import 'package:timeago/timeago.dart' as timeago;

export 'types/card.dart';
export 'types/card_gallery_view.dart';
export 'types/card_group.dart';
export 'types/card_sort.dart';
export 'types/color.dart';
export 'types/cycle.dart';
export 'types/deck.dart';
export 'types/deck_card.dart';
export 'types/deck_group.dart';
export 'types/deck_sort.dart';
export 'types/faction.dart';
export 'types/format.dart';
export 'types/mwl.dart';
export 'types/mwl_type.dart';
export 'types/pack.dart';
export 'types/rotation.dart';
export 'types/rotation_pack.dart';
export 'types/rotation_type.dart';
export 'types/settings.dart';
export 'types/side.dart';
export 'types/type.dart';

String relativeDate(DateTime value) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  if (value.isAfter(today)) return 'Today';

  final yesterday = today.subtract(const Duration(days: 1));
  if (value.isAfter(yesterday)) return 'Yesterday';

  return timeago.format(value);
}
