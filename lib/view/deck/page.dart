import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
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
