import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import '/view/header_list_tile.dart';
import 'card_gallery_swipe_page.dart';

class CardGalleryListPage extends ConsumerWidget {
  const CardGalleryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(cardGalleryGroupedCardListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Card Gallery')),
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: groupedCardList.map((e) => CardHeader(groupedCardList.sumUntilItem(e), e)).toList(),
      ),
    );
  }
}

class CardHeader extends ConsumerWidget {
  const CardHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final int indexOffset;
  final HeaderItems<CardResult> headerList;

  void onTap(BuildContext context, WidgetRef ref, int index) {
    final currentIndex = ref.read(cardGalleryIndexProvider.state);
    currentIndex.state = index;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;
    final deckNotifier = ref.watch(cardGalleryDeckProvider.notifier);
    final deckCardList = deckNotifier.value?.cards;

    const rowCount = 2;
    const imageAspectRatio = (300 + 16) / (419 + 16);
    final counterScale = orientation == Orientation.landscape ? 1.0 : mediaQuery.size.aspectRatio;
    final counterSize = 52 / imageAspectRatio * counterScale;
    final imageWidth = mediaQuery.size.width / rowCount;
    final imageHeight = imageWidth / imageAspectRatio;

    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: headerList.length),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowCount,
          childAspectRatio: imageWidth / (imageHeight + counterSize),
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final card = headerList[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => onTap(context, ref, indexOffset + index),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: card.card.imageUrl,
                        placeholder: (context, imageUrl) => card.faction.icon?.image() ?? const SizedBox.shrink(),
                        errorWidget: (context, imageUrl, error) =>
                            card.faction.icon?.image() ?? const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  if (deckCardList != null)
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Transform.scale(
                        scale: counterScale,
                        alignment: Alignment.bottomCenter,
                        child:Center(child: DeckCardCount(card))
                      ),
                    ),
                ],
              ),
            );
          },
          childCount: headerList.length,
        ),
      ),
    );
  }
}
