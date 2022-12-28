import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '/db/database.dart' hide Card;
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/header_list.dart';
import 'async_value_builder.dart';
import 'card_tile.dart';

class CardGallerySwipePage extends ConsumerWidget {
  const CardGallerySwipePage({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGalleryPageView value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardGalleryView: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGalleryView = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.cardGalleryView);
    }));

    final groupedCardListStream = ref.watch(cardGalleryGroupedCardListProvider);
    final index = ref.watch(cardGalleryIndexProvider).value ?? 0;
    final currentCard = groupedCardListStream.whenOrNull(data: (value) => value.allItems[index]);
    return WillPopScope(
      onWillPop: () async {
        final index = ref.read(cardGalleryIndexProvider);
        index.value = null;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentCard?.card.title ?? 'Card Gallery'),
          actions: [
            IconButton(
              icon: const Icon(Icons.public),
              onPressed: currentCard != null ? () => launchUrl(currentCard.card.url) : null,
            ),
            if (cardGalleryView != null)
              IconButton(
                  icon: cardGalleryView == CardGalleryPageView.image
                      ? const Icon(Icons.text_fields)
                      : const Icon(Icons.image),
                  onPressed: () async {
                    switch (cardGalleryView) {
                      case CardGalleryPageView.image:
                        return onSelected(context, ref, CardGalleryPageView.text);
                      case CardGalleryPageView.text:
                        return onSelected(context, ref, CardGalleryPageView.image);
                    }
                  }),
            IconButton(
              icon: const Icon(Icons.view_comfortable),
              onPressed: () {
                final index = ref.read(cardGalleryIndexProvider);
                index.value = null;
              },
            ),
          ],
        ),
        body: AsyncValueBuilder<HeaderList<CardResult>>(
          value: groupedCardListStream,
          data: (groupedCardList) => PageView.builder(
            controller: PageController(initialPage: index),
            scrollDirection: Axis.horizontal,
            itemCount: groupedCardList.allItems.length,
            itemBuilder: (context, index) {
              final card = groupedCardList.allItems[index];
              return Material(
                color: Theme.of(context).splashColor,
                child: Column(
                  children: [
                    Expanded(child: CardPage(card)),
                    DeckCardCount(card),
                  ],
                ),
              );
            },
            onPageChanged: (value) {
              final index = ref.read(cardGalleryIndexProvider);
              index.value = value;
            },
          ),
        ),
      ),
    );
  }
}

class CardPage extends ConsumerWidget {
  const CardPage(this.card, {super.key});

  final CardResult card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGalleryView = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.cardGalleryView);
    }));
    switch (cardGalleryView) {
      case CardGalleryPageView.image:
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
      case CardGalleryPageView.text:
        return Padding(
          padding: const EdgeInsets.all(8),
          child: CardTile(card, logo: false, body: true),
        );
      case null:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class DeckCardCount extends ConsumerWidget {
  const DeckCardCount(this.card, {super.key});

  final CardResult card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cardGalleryDeckCardCodesProvider.select((value) {
      return value?.getCard(card);
    }));
    if (count == null || card.type.code == 'identity') return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (count > 0)
              IconButton(
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.remove_outlined),
                iconSize: 36,
                onPressed: () {
                  final deckCardsNotifier = ref.read(cardGalleryDeckCardCodesProvider);
                  deckCardsNotifier?.decCard(card);
                },
              ),
            if (count > 0) Text('$count', style: const TextStyle(fontSize: 36)),
            IconButton(
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.add_outlined),
              iconSize: 36,
              onPressed: () {
                final deckCardsNotifier = ref.read(cardGalleryDeckCardCodesProvider);
                deckCardsNotifier?.incCard(card);
              },
            ),
          ],
        ),
      ),
    );
  }
}
