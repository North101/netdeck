import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netrunner_deckbuilder/view/card_gallery/page.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';
import 'body.dart';

class DeckPage extends ConsumerWidget {
  const DeckPage({Key? key}) : super(key: key);

  static withOverrides({
    required DeckResult deck,
    required Map<CardResult, int> cards,
    required List<String> tags,
  }) {
    return ProviderScope(
      overrides: [
        deckProvider.overrideWithValue(StateController(deck)),
        deckCardListProvider.overrideWithValue(DeckCardListNotifier(cards)),
        deckTagsProvider.overrideWithValue(StateController(tags)),
        groupedCardListProvider.overrideWithProvider(groupedDeckCardListProvider),
      ],
      child: const DeckPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const DeckBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final db = ref.read(dbProvider);
          final deck = ref.read(deckProvider);
          final deckCardList = ref.read(deckCardListProvider.notifier);
          final sides = await db.listSides(where: db.side.code.equals(deck.side.code).not()).get();
          deckCardList.update();

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardListPage.withOverrides(
              title: 'Edit Deck',
              filterCollection: true,
              filterFormat: deck.format,
              filterRotation: deck.rotation,
              filterMwl: deck.mwl,
              filterSides: FilterType(never: sides.map((e) => e.code).toSet()),
              filterTypes: FilterType(never: {deck.identity.typeCode}),
              deckCardList: deckCardList,
              cardTile: (context, ref, index, card) {
                final count = deckCardList.get(card);
                return CardTile(
                  card,
                  key: ValueKey(card),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (count > 0)
                        IconButton(
                          icon: const Icon(Icons.remove_outlined),
                          onPressed: () {
                            deckCardList.dec(card);
                            ref.refresh(cardListProvider);
                          },
                        ),
                      if (count > 0) Text('${deckCardList.get(card)}'),
                      IconButton(
                        icon: const Icon(Icons.add_outlined),
                        onPressed: () {
                          deckCardList.inc(card);
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
      ),
    );
  }
}
