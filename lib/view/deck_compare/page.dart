import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import 'appbar.dart';
import 'body.dart';

class DeckCompareArguments {
  const DeckCompareArguments(this.deckList);

  factory DeckCompareArguments.fromJson(List<dynamic> data) {
    return DeckCompareArguments(
      data.map((e) => DeckMicroResult.fromJson((e as Map).cast())).toSet(),
    );
  }

  List<dynamic> toJson() {
    return deckList.map((e) => e.toJson()).toList();
  }

  final Set<DeckMicroResult> deckList;
}

class DeckComparePage extends ConsumerWidget {
  const DeckComparePage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    final args = DeckCompareArguments.fromJson(arguments as List);
    return MaterialPageRoute(builder: (context) {
      return DeckComparePage.withOverrides(args);
    });
  }

  static Widget withOverrides(DeckCompareArguments args) {
    return ProviderScope(
      overrides: [
        compareDeckListProvider.overrideWithValue(args.deckList),
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
