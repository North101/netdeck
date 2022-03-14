import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import 'async_value_builder.dart';
import 'card_gallery_swipe_page.dart';
import 'header_list_tile.dart';

class CardGalleryListPage extends ConsumerWidget {
  CardGalleryListPage({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardListStream = ref.watch(cardGalleryGroupedCardListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Card Gallery')),
      body: AsyncValueBuilder<HeaderList<CardResult>>(
        value: groupedCardListStream,
        data: (groupedCardList) => CustomScrollView(
          controller: controller,
          slivers: groupedCardList.mapItems(CardHeader.new).toList(),
        ),
      ),
    );
  }
}

class CardHeader extends ConsumerWidget {
  const CardHeader(this.indexOffset, this.headerList, {super.key});

  final int indexOffset;
  final HeaderItems<CardResult> headerList;

  void onTap(BuildContext context, WidgetRef ref, int value) {
    final index = ref.read(cardGalleryIndexProvider);
    index.value = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;
    final deckCardList = ref.watch(cardGalleryDeckCardCodesProvider)?.value;

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
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => onTap(context, ref, indexOffset + index),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: card.card.imageUrl,
                        placeholder: (context, imageUrl) => card.faction.icon?.image() ?? const SizedBox.shrink(),
                        errorWidget: (context, imageUrl, error) =>
                            card.faction.icon?.image() ?? const SizedBox.shrink(),
                      ),
                    ),
                    if (deckCardList != null && card.type.code != 'identity') Center(child: DeckCardCount(card)),
                  ],
                ),
              ),
            );
          },
          childCount: headerList.length,
        ),
      ),
    );
  }
}
