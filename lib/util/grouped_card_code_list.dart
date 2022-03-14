import '/db/database.dart';
import 'header_list.dart';

class GroupedCardCodeList extends HeaderList<String> {
  GroupedCardCodeList(super.items);

  factory GroupedCardCodeList.fromCardResult(HeaderList<CardResult> groupedCardList) {
    return GroupedCardCodeList(groupedCardList.map((e) {
      return HeaderItems(e.header, e.items.map((e) => e.card.code).toList());
    }).toList());
  }

  factory GroupedCardCodeList.fromJson(List<String> data) {
    return GroupedCardCodeList(data.cast<List>().map((e) {
      final items = e.cast<String>();
      return HeaderItems<String>(items.first, items.skip(1).toList());
    }).toList());
  }

  List<List<String>> toJson() {
    return items.map((e) => [e.header, ...e.items]).toList();
  }
}
