import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/providers.dart';
import '/util/grouped_card_code_list.dart';
import 'card_gallery_list_page.dart';
import 'card_gallery_swipe_page.dart';

class CardGalleryArguments {
  const CardGalleryArguments({
    required this.items,
    required this.index,
    this.deckCards,
  });

  factory CardGalleryArguments.fromJson(Map<String, dynamic> data) {
    return CardGalleryArguments(
      items: GroupedCardCodeList.fromJson((data['items'] as List).cast()),
      index: data['index'] as int?,
      deckCards: (data['deckCards'] as Map?)?.let((e) => e.cast()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.toJson(),
      'index': index,
      'deckCards': deckCards,
    };
  }

  final GroupedCardCodeList items;
  final int? index;
  final Map<String, int>? deckCards;
}

class CardGalleryResult {
  const CardGalleryResult({
    required this.deckCards,
  });

  final Map<String, int>? deckCards;
}

class CardGalleryPage extends ConsumerWidget {
  const CardGalleryPage({super.key});

  static Route<CardGalleryResult> route(BuildContext context, Object? arguments) {
    final args = CardGalleryArguments.fromJson((arguments as Map).cast());
    return MaterialPageRoute<CardGalleryResult>(builder: (context) {
      return CardGalleryPage.withOverrides(args);
    });
  }

  static Widget withOverrides(CardGalleryArguments args) => RestorableProviderScope(
        restorationId: 'card_gallery_page',
        overrides: [
          cardGalleryIndexProvider.overrideWith((ref) => RestorableIntN(args.index)),
          cardGalleryDeckCardCodesProvider
              .overrideWith((ref) => args.deckCards != null ? DeckCardsNotifier(args.deckCards!) : null),
          cardGalleryGroupedCardCodeListProvider.overrideWithValue(args.items),
        ],
        child: const CardGalleryPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(cardGalleryIndexProvider).value;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(CardGalleryResult(
          deckCards: ref.read(cardGalleryDeckCardCodesProvider)?.value,
        ));
        return false;
      },
      child: index == null ? CardGalleryListPage() : const CardGallerySwipePage(),
    );
  }
}
