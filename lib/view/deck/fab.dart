import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:query/query.dart';

import '/providers.dart';
import '/util/filter_type.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';

final deckFilterSearchingProvider = StateProvider<bool>((ref) => throw UnimplementedError());
final deckFilterQueryProvider = StateProvider<Query?>((ref) => throw UnimplementedError());
final deckFilterCollectionProvider = StateProvider<bool>((ref) => throw UnimplementedError());
final deckFilterPacksProvider = StateProvider<FilterType<String>>((ref) => throw UnimplementedError());
final deckFilterSidesProvider = StateProvider<FilterType<String>>((ref) => throw UnimplementedError());
final deckFilterFactionsProvider = StateProvider<FilterType<String>>((ref) => throw UnimplementedError());
final deckFilterTypesProvider = StateProvider<FilterType<String>>((ref) => throw UnimplementedError());

class DeckFloatingActionBar extends ConsumerWidget {
  const DeckFloatingActionBar({Key? key}) : super(key: key);

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
            filterSearching: ref.read(deckFilterSearchingProvider.state),
            filterQuery: ref.read(deckFilterQueryProvider.state),
            filterCollection: ref.read(deckFilterSearchingProvider.state),
            filterFormat: StateController(deck.format),
            filterRotation: StateController(deck.rotation),
            filterMwl: StateController(deck.mwl),
            filterPacks: ref.read(deckFilterPacksProvider.state),
            filterSides: ref.read(deckFilterSidesProvider.state),
            filterTypes: ref.read(deckFilterTypesProvider.state),
            deckValidator: deckValidator,
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
