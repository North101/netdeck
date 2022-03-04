import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netrunner_deckbuilder/util/assets.gen.dart';

import '/db/database.dart';
import '/providers.dart';
import 'card_tile.dart';

final viewProvider = StateProvider((ref) => GalleryViewState.image);

enum GalleryViewState {
  image,
  text,
}

class CardGallerySwipePage extends ConsumerWidget {
  const CardGallerySwipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    final index = ref.watch(galleryCardIndexProvider) ?? 0;
    final view = ref.watch(viewProvider.state);
    return Scaffold(
      appBar: groupedCardList.whenOrNull(
        data: (data) => AppBar(
          title: Text(data.allItems[index].card.title),
          actions: [
            IconButton(
                icon: view.state == GalleryViewState.image ? const Icon(Icons.text_fields) : const Icon(Icons.image),
                onPressed: () {
                  switch (view.state) {
                    case GalleryViewState.image:
                      view.state = GalleryViewState.text;
                      return;
                    case GalleryViewState.text:
                      view.state = GalleryViewState.image;
                      return;
                  }
                }),
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
            switch (view.state) {
              case GalleryViewState.image:
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: card.card.imageUrl,
                    placeholder: (context, imageUrl) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorWidget: (context, imageUrl, error) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.interrupt.image(),
                          const Text('Error loading image'),
                        ],
                      );
                    },
                  ),
                );
              case GalleryViewState.text:
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [CardTile(card, logo: false, body: true)],
                  ),
                );
            }
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
