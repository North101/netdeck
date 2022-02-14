import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class DeckAppBar extends ConsumerWidget {
  const DeckAppBar({required this.constraints, Key? key}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);

    const imageHeight = 419;
    const imageWidth = 300;
    const aspectRatio = imageHeight / imageWidth;
    final width = constraints.maxWidth;
    final height = aspectRatio * width;
    final heightRatio = height / imageHeight;
    final topOffset = 67 * heightRatio;
    final bottomOffset = 151 * heightRatio;
    return SliverAppBar(
      pinned: true,
      expandedHeight: min((height - topOffset - bottomOffset), constraints.maxHeight * 0.8),
      backgroundColor: deck.faction.color,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 48, bottom: 16, end: 48),
        title: Text(
          deck.deck.name,
          overflow: TextOverflow.fade,
          softWrap: false,
          maxLines: 1,
        ),
        background: Stack(
          children: [
            Positioned(
              top: -topOffset,
              child: SizedBox(
                height: height,
                width: width,
                child: CachedNetworkImage(
                  imageUrl: deck.identity.imageUrl,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            final db = ref.read(dbProvider);
            final deck = ref.read(deckProvider).deck;
            final deckCardList = ref.read(deckCardListProvider);
            final deckTags = ref.read(deckTagsProvider);
            db.transaction(() async {
              await db.into(db.deck).insertOnConflictUpdate(deck);
              await db.batch((batch) {
                batch.deleteWhere<DeckCard, DeckCardData>(db.deckCard, (tbl) => tbl.deckId.equals(deck.id));
                batch.insertAll<DeckCard, DeckCardData>(db.deckCard, [
                  ...deckCardList.entries.map(
                    (entry) => DeckCardData(
                      deckId: deck.id,
                      cardCode: entry.key.code,
                      quantity: entry.value,
                    ),
                  ),
                ]);
                batch.deleteWhere<DeckTag, DeckTagData>(db.deckTag, (tbl) => tbl.deckId.equals(deck.id));
                batch.insertAll<DeckTag, DeckTagData>(db.deckTag, [
                  ...deckTags.map(
                    (e) => DeckTagData(
                      deckId: deck.id,
                      tag: e,
                    ),
                  ),
                ]);
              });
            });
          },
        ),
      ],
    );
  }
}
