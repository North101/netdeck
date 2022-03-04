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
    final maxCardList = ref.watch(compareMaxCardListProvider);
    final compareCardList = ref.watch(compareGroupedCardListProvider);
    return compareCardList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data: (compareCardList) => CustomScrollView(
        slivers: [
          ...compareCardList.map((headerList) {
            final count = headerList.fold<int>(0, (value, entry) => value += entry.value);
            return SliverStickyHeader(
              header: HeaderListTile.titleCount(title: headerList.header, count: count),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index.isEven) {
                      final realIndex = index ~/ 2;
                      final card = headerList.items[realIndex];
                      return CardTile(
                        card.key,
                        trailing: Text('${card.value} / ${maxCardList[card.key]}'),
                        onTap: () {
                          final groupedCardList = AsyncData(HeaderList(compareCardList.map((e) {
                            return HeaderItems<CardResult>(e.header, e.items.map((e) => e.key).toList());
                          }).toList()));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return CardGalleryPage.withOverrides(
                              groupedCardList: groupedCardList,
                              currentIndex: compareCardList.sumUntilItem(headerList) + realIndex,
                            );
                          }));
                        },
                      );
                    } else {
                      return const Divider();
                    }
                  },
                  childCount: headerList.items.length * 2,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
