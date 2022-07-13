import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/grouped_card_code_list.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';

class DeckFloatingActionBar extends ConsumerStatefulWidget {
  const DeckFloatingActionBar({super.key});

  @override
  DeckFloatingActionBarState createState() => DeckFloatingActionBarState();
}

class DeckFloatingActionBarState extends ConsumerState<DeckFloatingActionBar> with RestorationMixin {
  late RestorableRouteFuture<CardListResults?> deckCardListRoute;

  @override
  void initState() {
    super.initState();

    deckCardListRoute = RestorableRouteFuture<CardListResults?>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openDeckCardListRoute,
        arguments: arguments,
      ),
      onComplete: (result) {
        if (result == null) return;

        final deck = ref.read(deckProvider);
        deck.value = deck.value.copyWith(
          cards: result.deckCards,
        );

        final filterSearching = ref.read(filterSearchingProvider);
        filterSearching.value = result.filterSearching;

        final filterQuery = ref.read(filterQueryProvider);
        filterQuery.value = result.filterQuery;

        final filterCollection = ref.read(filterCollectionProvider);
        filterCollection.value = result.filterCollection;

        final filterPacks = ref.read(filterPacksProvider);
        filterPacks.value = result.filterPacks;

        final filterSides = ref.read(filterSidesProvider);
        filterSides.value = result.filterSides;

        final filterFactions = ref.read(filterFactionsProvider);
        filterFactions.value = result.filterFactions;

        final filterTypes = ref.read(filterTypesProvider);
        filterTypes.value = result.filterTypes;
      },
    );
  }

  static Route<CardListResults?> openDeckCardListRoute(BuildContext context, Object? arguments) {
    final result = CardListArguments.fromJson((arguments as Map).cast());
    return MaterialPageRoute<CardListResults?>(builder: (context) {
      return CardListPage.withOverrides(
        restorationId: 'deck_card_list_page',
        color: result.deck.faction.color,
        title: 'Edit Deck',
        filterSearching: result.filterSearching,
        filterQuery: result.filterQuery,
        filterCollection: result.filterCollection,
        filterFormat: result.deck.format,
        filterRotation: result.deck.rotation,
        filterMwl: result.deck.mwl,
        filterPacks: result.filterPacks,
        filterSides: result.filterSides,
        filterFactions: result.filterFactions,
        filterTypes: result.filterTypes,
        deck: result.deck,
        deckCards: result.deckCards,
        itemBuilder: (context, ref, index, card) => DeckCardListTile(
          index: index,
          card: card,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final deck = ref.read(deckValidatorResultProvider).deck;
        deckCardListRoute.present(CardListArguments(
          deck: deck,
          deckCards: ref.read(deckProvider).value.cards,
          filterSearching: ref.read(filterSearchingProvider).value,
          filterQuery: ref.read(filterQueryProvider).value,
          filterCollection: ref.read(filterCollectionProvider).value,
          filterPacks: ref.read(filterPacksProvider).value,
          filterSides: ref.read(filterSidesProvider).value.copyWith(
            always: {deck.side.code},
          ),
          filterFactions: ref.read(filterFactionsProvider).value,
          filterTypes: ref.read(filterTypesProvider).value.copyWith(
            never: {deck.type.code},
          ),
        ).toJson());
      },
    );
  }

  @override
  String? restorationId = 'deck_fab';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(deckCardListRoute, 'deckCardListRoute');
  }
}

class DeckCardListTile extends ConsumerStatefulWidget {
  const DeckCardListTile({
    required this.index,
    required this.card,
    super.key,
  });

  final int index;
  final CardResult card;

  @override
  DeckCardListTileState createState() => DeckCardListTileState();
}

class DeckCardListTileState extends ConsumerState<DeckCardListTile> with RestorationMixin {
  late RestorableRouteFuture<CardGalleryResult> cardGalleryRoute;

  @override
  void initState() {
    super.initState();

    cardGalleryRoute = RestorableRouteFuture<CardGalleryResult>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openCardGalleryPage,
        arguments: arguments,
      ),
      onComplete: (result) {
        if (result.deckCards == null) return;

        final deck = ref.read(deckCardListNotifierProvider);
        deck?.value = result.deckCards!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(deckCardListNotifierProvider.select((value) {
      return value?.getCard(widget.card) ?? 0;
    }));
    final mwlCard = ref.watch(mwlCardMapProvider.select((value) {
      return value.whenOrNull(data: (data) => data[widget.card.card.code]);
    }));
    return CardTile(
      widget.card,
      key: ValueKey(widget.card),
      mwlCard: mwlCard,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            IconButton(
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.remove_outlined),
              onPressed: () {
                final deckCards = ref.read(deckCardListNotifierProvider);
                deckCards?.decCard(widget.card);
              },
            ),
          if (count > 0) Text('$count'),
          IconButton(
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              final deckCards = ref.read(deckCardListNotifierProvider);
              deckCards?.incCard(widget.card);
            },
          ),
        ],
      ),
      onTap: () async {
        final deck = ref.read(deckCardListNotifierProvider);
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        cardGalleryRoute.present(CardGalleryArguments(
          items: GroupedCardCodeList.fromCardResult(groupedCardList),
          index: widget.index,
          deckCards: deck?.value,
        ).toJson());
      },
    );
  }

  @override
  String? get restorationId => 'deck_card_list_tile_${widget.index}';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cardGalleryRoute, 'cardGalleryRoute');
  }
}
