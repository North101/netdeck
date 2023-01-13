import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/providers.dart';
import '/util/grouped_card_code_list.dart';
import 'card_gallery_list_page.dart';
import 'card_gallery_swipe_page.dart';

part 'card_gallery_page.freezed.dart';
part 'card_gallery_page.g.dart';

GroupedCardCodeList itemsFromJson(List<dynamic> value) => GroupedCardCodeList.fromJson(value.cast());
List<dynamic> itemsToJson(GroupedCardCodeList value) => value.toJson();

@freezed
class CardGalleryArguments with _$CardGalleryArguments {
  const factory CardGalleryArguments({
    @JsonKey(fromJson: itemsFromJson, toJson: itemsToJson) required GroupedCardCodeList items,
    required int? index,
    required Map<String, int>? deckCards,
  }) = _CardGalleryArguments;

  factory CardGalleryArguments.fromJson(Map<String, dynamic> json) => _$CardGalleryArgumentsFromJson(json);
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
