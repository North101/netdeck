import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import 'card_gallery_list_page.dart';
import 'card_gallery_swipe_page.dart';

class CardGalleryPage extends ConsumerWidget {
  const CardGalleryPage({Key? key}) : super(key: key);

  static withOverrides({
    required AsyncValue<HeaderList<CardResult>> groupedCardList,
    required int? currentIndex,
  }) {
    return ProviderScope(
      overrides: [
        groupedCardListProvider.overrideWithValue(groupedCardList),
        cardGalleryIndexProvider.overrideWithValue(StateController(currentIndex)),
      ],
      child: const CardGalleryPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(cardGalleryIndexProvider);
    if (currentIndex == null) {
      return const CardGalleryListPage();
    } else {
      return const CardGallerySwipePage();
    }
  }
}
