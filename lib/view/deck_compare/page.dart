import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import '/providers.dart';
import 'appbar.dart';
import 'body.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
class DeckCompareArguments with _$DeckCompareArguments {
  const factory DeckCompareArguments(
    Set<DeckCompareResult> deckList,
  ) = _DeckCompareArguments;

  factory DeckCompareArguments.fromJson(Map<String, dynamic> json) => _$DeckCompareArgumentsFromJson(json);
}

class DeckComparePage extends ConsumerWidget {
  const DeckComparePage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    final args = DeckCompareArguments.fromJson((arguments as Map).cast());
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
