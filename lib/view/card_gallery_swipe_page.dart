import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import 'card_tile.dart';

class CardGallerySwipePage extends ConsumerWidget {
  const CardGallerySwipePage({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGalleryView value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardGalleryView: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGalleryView = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardGalleryView);
    }));

    final groupedCardList = ref.watch(groupedCardListProvider);
    final index = ref.watch(cardGalleryIndexProvider) ?? 0;
    return Scaffold(
      appBar: groupedCardList.whenOrNull(
        data: (data) {
          final card = data.allItems[index];
          return AppBar(
            title: Text(card.card.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.public),
                onPressed: () => launch('https://netrunnerdb.com/en/card/${card.card.code}'),
              ),
              if (cardGalleryView != null)
                IconButton(
                    icon: cardGalleryView == CardGalleryView.image
                        ? const Icon(Icons.text_fields)
                        : const Icon(Icons.image),
                    onPressed: () async {
                      switch (cardGalleryView) {
                        case CardGalleryView.image:
                          return onSelected(context, ref, CardGalleryView.text);
                        case CardGalleryView.text:
                          return onSelected(context, ref, CardGalleryView.image);
                      }
                    }),
              IconButton(
                icon: const Icon(Icons.view_comfortable),
                onPressed: () {
                  final index = ref.read(cardGalleryIndexProvider.state);
                  index.state = null;
                },
              ),
            ],
          );
        },
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
            switch (cardGalleryView) {
              case CardGalleryView.image:
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
              case CardGalleryView.text:
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CardTile(card, logo: false, body: true),
                );
              case null:
                return const Center(child: CircularProgressIndicator());
            }
          },
          onPageChanged: (value) {
            final index = ref.read(cardGalleryIndexProvider.state);
            index.state = value;
          },
        ),
      ),
    );
  }
}
