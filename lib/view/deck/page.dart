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
        filterSearchingProvider.overrideWithValue(StateController(false)),
        filterQueryProvider.overrideWithValue(StateController(null)),
        filterCollectionProvider.overrideWithValue(StateController(false)),
        filterPacksProvider.overrideWithValue(StateController(FilterType())),
        filterSidesProvider.overrideWithValue(StateController(FilterType(always: {deck.side.code}))),
        filterFactionsProvider.overrideWithValue(StateController(FilterType())),
        filterTypesProvider.overrideWithValue(StateController(FilterType(never: {deck.identity.typeCode}))),
      ],
      child: const DeckPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: DeckBody(),
      floatingActionButton: DeckFloatingActionBar(),
    );
  }
}
