import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/util/extensions.dart';
import '/util/header_list.dart';
import 'card_list.dart';
import 'db.dart';

final cardGalleryIndexProvider = RestorableProvider<RestorableIntN>(
  (ref) => throw UnimplementedError(),
  restorationId: 'cardGalleryIndexProvider',
);

final cardGalleryGroupedCardCodeListProvider = Provider<HeaderList<String>>((ref) => throw UnimplementedError());

final cardGalleryGroupedCardListProvider = StreamProvider<HeaderList<CardResult>>((ref) {
  final db = ref.watch(dbProvider);
  final groupedCardCodeList = ref.watch(cardGalleryGroupedCardCodeListProvider);
  final cardList = db.listCards(where: (card, pack, cycle, faction, side, type, subtype, mwlCard) {
    return card.code.isIn(groupedCardCodeList.allItems);
  }).watch();
  return cardList.map<HeaderList<CardResult>>((event) {
    final cardMap = event.map((e) => MapEntry(e.card.code, e)).toMap();
    return HeaderList(groupedCardCodeList.map((headerItems) {
      return HeaderItems(
          headerItems.header,
          headerItems.items.map((code) {
            return cardMap[code]!;
          }).toList());
    }).toList());
  });
}, dependencies: [dbProvider, cardGalleryGroupedCardCodeListProvider]);

final cardGalleryDeckCardCodesProvider = RestorableProvider<DeckCardsNotifier?>(
  (ref) => throw UnimplementedError(),
  restorationId: 'cardGalleryDeckCardCodesProvider',
);
