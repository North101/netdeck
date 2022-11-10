import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util.dart';
import '/util/grouped_card_code_list.dart';
import '/util/header_list.dart';
import '/view/async_value_builder.dart';
import '/view/card_gallery_page.dart';
import '/view/card_tile.dart';
import '/view/header_list_tile.dart';

class DeckCompareBody extends ConsumerWidget {
  const DeckCompareBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compareCardList = ref.watch(compareGroupedCardListProvider);
    return AsyncValueBuilder<HeaderList<MapEntry<CardResult, int>>>(
      value: compareCardList,
      data: (compareCardList) => CustomScrollView(
        slivers: [
          ...compareCardList.mapItems(DeckCardHeader.new),
        ],
      ),
    );
  }
}

class DeckCardHeader extends ConsumerWidget {
  const DeckCardHeader(this.indexOffset, this.headerList, {super.key});

  final HeaderItems<MapEntry<CardResult, int>> headerList;
  final int indexOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = headerList.map<int>((e) => e.value).sum;
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: count),
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        sliver: SliverList(
          delegate: SliverChildSeperatedBuilderDelegate(
            (context, index) => DeckCardTile(
              index: indexOffset + index,
              card: headerList[index].key,
              count: headerList[index].value,
            ),
            (context, index) => const Divider(),
            childCount: headerList.length,
          ),
        ),
      ),
    );
  }
}

class DeckCardTile extends ConsumerWidget {
  const DeckCardTile({
    required this.index,
    required this.card,
    required this.count,
    super.key,
  });

  final int index;
  final CardResult card;
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxCardList = ref.watch(compareMaxCardListProvider.select((value) {
      return value.whenOrNull(data: (data) => data) ?? const {};
    }));
    return CardTile(
      card,
      key: ValueKey(card),
      trailing: Text('$count / ${maxCardList[card]}'),
      onTap: () async {
        final navigator = Navigator.of(context);
        final compareCardList = await ref.read(compareGroupedCardListProvider.future);
        final groupedCardList = GroupedCardCodeList(compareCardList.map((e) {
          return HeaderItems(e.header, e.items.map((e) => e.key.code).toList());
        }).toList());
        navigator.restorablePush(
          CardGalleryPage.route,
          arguments: CardGalleryArguments(
            items: groupedCardList,
            index: index,
          ).toJson(),
        );
      },
    );
  }
}
