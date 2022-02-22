import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/filter_type.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';

class DeckFloatingActionBar extends ConsumerWidget {
  const DeckFloatingActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final db = ref.read(dbProvider);
          final deckNotifier = ref.read(deckProvider.notifier);
          final deck = deckNotifier.value;
          final settings = await db.getSettings().getSingle();

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardListPage.withOverrides(
              color: deck.faction.color,
              title: 'Edit Deck',
              filterCollection: settings.settings.filterCollection,
              filterFormat: deck.format,
              filterRotation: deck.rotation,
              filterMwl: deck.mwl,
              filterSides: FilterType(always: {deck.side.code}),
              filterTypes: FilterType(never: {deck.identity.typeCode}),
              deckCardList: deck.cards.keys.toSet(),
              cardTile: (context, ref, index, card) {
                final count = deckNotifier.getCard(card);
                return CardTile(
                  card,
                  key: ValueKey(card),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return CardGalleryPage.withOverrides(
                        groupedCardList: ref.read(groupedCardListProvider),
                        currentIndex: index,
                      );
                    }));
                  },
                );
              },
            );
          }));
        },
      );
  }
  
}