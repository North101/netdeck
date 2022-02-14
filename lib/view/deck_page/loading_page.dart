import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '/db/database.dart';
import '/providers.dart';
import 'page.dart';

class DeckLoaderResult {
  const DeckLoaderResult(this.deck, this.cards, this.tags);

  final DeckResult deck;
  final Map<CardResult, int> cards;
  final List<String> tags;
}

final deckLoaderProvider = FutureProvider.autoDispose.family<DeckLoaderResult, String>((ref, deckId) {
  final db = ref.watch(dbProvider);
  return CombineLatestStream.combine3<DeckResult, Map<CardResult, int>, List<String>, DeckLoaderResult>(
    db.listDecks(where: db.deck.id.equals(deckId)).getSingle().asStream(),
    db.listDeckCards(where: db.deckCard.deckId.equals(deckId)).get().asStream().map((event) {
      return event.fold<Map<CardResult, int>>({}, (value, e) {
        return value..[e.toCard()] = e.quantity;
      });
    }),
    db.listDeckTags(where: db.deckTag.deckId.equals(deckId)).get().asStream().map((event) {
      return event.map((e) => e.tag).toList();
    }),
    (a, b, c) => DeckLoaderResult(a, b, c),
  ).first;
});

class DeckLoaderPage extends ConsumerWidget {
  const DeckLoaderPage({required this.deckId, Key? key}) : super(key: key);

  final String deckId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckLoaderProvider(deckId));
    return deck.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stacktrace) => Scaffold(
        body: Text(error.toString()),
      ),
      data: (data) {
        return DeckPage.withOverrides(
          deck: data.deck,
          cards: data.cards,
          tags: data.tags,
        );
      },
    );
  }
}
