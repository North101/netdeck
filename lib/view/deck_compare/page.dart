import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import 'appbar.dart';
import 'body.dart';

class DeckComparePage extends ConsumerWidget {
  const DeckComparePage({Key? key}) : super(key: key);

  static withOverrides({
    required Set<DeckResult2> deckList,
  }) {
    return ProviderScope(
      overrides: [
        deckCompareListProvider.overrideWithValue(deckList),
      ],
      child: const DeckComparePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: DeckCompareAppBar(),
      body: DeckCompareBody(),
    );
  }
}
