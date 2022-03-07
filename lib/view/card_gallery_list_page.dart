import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import '/view/header_list_tile.dart';

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
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: headerList.length),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 12,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final card = headerList[index];
            return InkWell(
              onTap: () => onTap(context, ref, indexOffset + index),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: card.card.imageUrl,
                  placeholder: (context, imageUrl) => card.faction.icon?.image() ?? const SizedBox.shrink(),
                  errorWidget: (context, imageUrl, error) => card.faction.icon?.image() ?? const SizedBox.shrink(),
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
