import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '../header_list_tile.dart';

class CardGalleryPage extends ConsumerWidget {
  const CardGalleryPage({Key? key}) : super(key: key);

  static withOverrides({
    required AsyncValue<HeaderList<CardResult>> groupedCardList,
    required int? currentIndex,
  }) {
    return ProviderScope(
      overrides: [
        groupedCardListProvider.overrideWithValue(groupedCardList),
        currentIndexProvider.overrideWithValue(StateController(currentIndex)),
      ],
      child: const CardGalleryPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    if (currentIndex == null) {
      return const CardGalleryListPage();
    } else {
      return const CardGalleryItemPage();
    }
  }
}

class CardGalleryListPage extends ConsumerWidget {
  const CardGalleryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Card Gallery')),
      body: groupedCardList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (data) => CustomScrollView(
          controller: ScrollController(),
          slivers: data.map((e) => CardHeader(data.sumUntilItem(e), e)).toList(),
        ),
      ),
    );
  }
}

class CardHeader extends ConsumerWidget {
  const CardHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final int indexOffset;
  final HeaderItems<CardResult> headerList;

  void onTap(BuildContext context, WidgetRef ref, int index) {
    final currentIndex = ref.read(currentIndexProvider.state);
    currentIndex.state = index;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: HeaderListTile.title(title: '${headerList.header} (${headerList.length})'),
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

class CardGalleryItemPage extends ConsumerWidget {
  const CardGalleryItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    final currentIndex = ref.watch(currentIndexProvider) ?? 0;
    return Scaffold(
      appBar: groupedCardList.whenOrNull(
        data: (data) => AppBar(
          title: Text(data.allItems[currentIndex].card.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                final currentIndex = ref.read(currentIndexProvider.state);
                currentIndex.state = null;
              },
            ),
          ],
        ),
      ),
      body: groupedCardList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (data) => PageView.builder(
          controller: PageController(initialPage: currentIndex),
          scrollDirection: Axis.horizontal,
          itemCount: data.allItems.length,
          itemBuilder: (context, index) {
            final card = data.allItems[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: card.card.imageUrl,
              ),
            );
          },
          onPageChanged: (index) {
            final currentIndex = ref.read(currentIndexProvider.state);
            currentIndex.state = index;
          },
        ),
      ),
    );
  }
}
