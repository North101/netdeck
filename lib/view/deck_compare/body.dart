import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import '/view/card_gallery_page.dart';
import '/view/card_tile.dart';
import '/view/header_list_tile.dart';

class DeckCompareBody extends ConsumerWidget {
  const DeckCompareBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compareCardList = ref.watch(compareGroupedCardListProvider);
    return compareCardList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data: (compareCardList) => CustomScrollView(
        slivers: [
          ...compareCardList.map((headerList) => DeckCardHeader(compareCardList.sumUntilItem(headerList), headerList)),
        ],
      ),
    );
  }
}

class DeckCardHeader extends ConsumerWidget {
  const DeckCardHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final HeaderItems<MapEntry<CardResult, int>> headerList;
  final int indexOffset;

  void onTap(BuildContext context, WidgetRef ref, int index) {}

  Widget cardItemBuilder(BuildContext context, WidgetRef ref, int index, CardResult card, int count) {
    final maxCardList = ref.watch(compareMaxCardListProvider);
    return CardTile(
      card,
      key: ValueKey(card),
      trailing: Text('$count / ${maxCardList[card]}'),
      onTap: () async {
        final compareCardList = await ref.read(compareGroupedCardListProvider.future);
        final groupedCardList = HeaderList(compareCardList.map((e) {
          return HeaderItems<CardResult>(e.header, e.items.map((e) => e.key).toList());
        }).toList());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardGalleryPage.withOverrides(
            groupedCardList: groupedCardList,
            currentIndex: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = headerList.fold<int>(0, (value, entry) => value += entry.value);
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: count),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index.isEven) {
              final realIndex = index ~/ 2;
              final card = headerList[realIndex];
              return cardItemBuilder(context, ref, indexOffset + realIndex, card.key, card.value);
            } else {
              return const Divider();
            }
          },
          childCount: headerList.length * 2,
        ),
      ),
    );
  }
}
