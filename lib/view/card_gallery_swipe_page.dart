import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '/db/database.dart' hide Card;
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

    final groupedCardList = ref.watch(cardGalleryGroupedCardListProvider);
    final index = ref.watch(cardGalleryIndexProvider) ?? 0;
    final currentCard = groupedCardList.allItems[index];
    return WillPopScope(
      onWillPop: () async {
        final index = ref.read(cardGalleryIndexProvider.state);
        index.state = null;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentCard.card.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.public),
              onPressed: () => launch('https://netrunnerdb.com/en/card/${currentCard.card.code}'),
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
        ),
        body: PageView.builder(
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
            final index = ref.read(cardGalleryIndexProvider.state);
            index.state = value;
          },
        ),
      ),
    );
  }
}

class CardPage extends ConsumerWidget {
  const CardPage(this.card, {Key? key}) : super(key: key);

  final CardResult card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGalleryView = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardGalleryView);
    }));
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
  }
}

class DeckCardCount extends ConsumerWidget {
  const DeckCardCount(this.card, {Key? key}) : super(key: key);

  final CardResult card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckNotifier = ref.watch(cardGalleryDeckProvider.notifier);
    if (deckNotifier.value == null) return const SizedBox.shrink();

    final deckCardList = deckNotifier.value!.cards;
    final count = deckCardList[card] ?? 0;
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
                    deckNotifier.decCard(card);
                    ref.refresh(cardGalleryDeckProvider);
                  }),
            if (count > 0) Text('$count', style: const TextStyle(fontSize: 36)),
            IconButton(
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.add_outlined),
                iconSize: 36,
                onPressed: () {
                  deckNotifier.incCard(card);
                  ref.refresh(cardGalleryDeckProvider);
                }),
          ],
        ),
      ),
    );
  }
}
