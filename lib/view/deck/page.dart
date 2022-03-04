import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'body.dart';
import 'fab.dart';

class DeckPage extends ConsumerWidget {
  const DeckPage({Key? key}) : super(key: key);

  static withOverrides({
    required DeckResult2 deck,
  }) {
    return ProviderScope(
      overrides: [
        deckProvider.overrideWithValue(DeckNotifier(deck)),
        groupedCardListProvider.overrideWithProvider(groupedDeckCardListProvider),
        deckFilterSearchingProvider.overrideWithValue(StateController(false)),
        deckFilterQueryProvider.overrideWithValue(StateController(null)),
        deckFilterCollectionProvider.overrideWithValue(StateController(false)),
        deckFilterPacksProvider.overrideWithValue(StateController(FilterType())),
        deckFilterSidesProvider.overrideWithValue(StateController(FilterType(always: {deck.side.code}))),
        deckFilterFactionsProvider.overrideWithValue(StateController(FilterType())),
        deckFilterTypesProvider.overrideWithValue(StateController(FilterType(never: {deck.identity.typeCode}))),
      ],
      child: const DeckPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: DeckBody(),
        floatingActionButton: DeckFloatingActionBar(),
      ),
    );
  }
}
