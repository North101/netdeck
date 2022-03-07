import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../db/database.dart';
import '/providers.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';

class DeckFloatingActionBar extends ConsumerWidget {
  const DeckFloatingActionBar({Key? key}) : super(key: key);

  Widget cardItemBuilder(BuildContext context, WidgetRef ref, int index, CardResult card, DeckNotifier deckNotifier) {
    final mwlCardMap = ref.watch(mwlCardMapProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    final count = deckNotifier.getCard(card);
    return CardTile(
      card,
      key: ValueKey(card),
      mwlCard: mwlCardMap?[card.card.code],
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            IconButton(
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.remove_outlined),
              onPressed: () {
                deckNotifier.decCard(card);
                ref.refresh(cardListProvider);
              },
            ),
          if (count > 0) Text('${deckNotifier.getCard(card)}'),
          IconButton(
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              deckNotifier.incCard(card);
              ref.refresh(cardListProvider);
            },
          ),
        ],
      ),
      onTap: () {
        final groupedCardList = ref.read(groupedCardListProvider);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardGalleryPage.withOverrides(
            groupedCardList: groupedCardList,
            currentIndex: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final deckNotifier = ref.read(deckProvider.notifier);
        final deck = deckNotifier.value;
        final deckValidator = await ref.read(deckValidatorProvider.future);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardListPage.withOverrides(
            color: deck.faction.color,
            title: 'Edit Deck',
            filterSearching: ref.read(filterSearchingProvider.state),
            filterQuery: ref.read(filterQueryProvider.state),
            filterCollection: ref.read(filterCollectionProvider.state),
            filterFormat: StateController(deck.format),
            filterRotation: StateController(deck.rotation),
            filterMwl: StateController(deck.mwl),
            filterPacks: ref.read(filterPacksProvider.state),
            filterSides: ref.read(filterSidesProvider.state),
            filterTypes: ref.read(filterTypesProvider.state),
            deckValidator: deckValidator,
            itemBuilder: (context, ref, index, card) => cardItemBuilder(context, ref, index, card, deckNotifier),
          );
        }));
      },
    );
  }
}
