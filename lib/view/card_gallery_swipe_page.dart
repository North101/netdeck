import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class CardGallerySwipePage extends ConsumerWidget {
  const CardGallerySwipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    final index = ref.watch(galleryCardIndexProvider) ?? 0;
    return Scaffold(
      appBar: groupedCardList.whenOrNull(
        data: (data) => AppBar(
          title: Text(data.allItems[index].card.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                final index = ref.read(galleryCardIndexProvider.state);
                index.state = null;
              },
            ),
          ],
        ),
      ),
      body: groupedCardList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (data) => PageView.builder(
          controller: PageController(initialPage: index),
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
          onPageChanged: (value) {
            final index = ref.read(galleryCardIndexProvider.state);
            index.state = value;
          },
        ),
      ),
    );
  }
}
