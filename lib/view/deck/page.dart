import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/deck_validator.dart';
import '/util/filter_type.dart';
import '/util/header_list.dart';
import '/view/async_value_builder.dart';
import '/view/save_deck_dialog.dart';
import 'body.dart';
import 'fab.dart';

class DeckPage extends ConsumerWidget {
  const DeckPage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    final deck = DeckFullResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return DeckPage.withOverrides(
        deck: deck.toNotifierResult(DeckSaveState.isSaved),
      );
    });
  }

  static Widget withOverrides({
    required DeckNotifierData deck,
  }) {
    return RestorableProviderScope(
      restorationId: 'deck_page',
      overrides: [
        deckProvider.overrideWith((ref) => DeckNotifier(deck)),
        filterSearchProvider.overrideWith((ref) => RestorableStringN(null)),
        filterCollectionProvider.overrideWith((ref) => RestorableBool(false)),
        filterPacksProvider.overrideWith((ref) => RestorableFilterType(FilterType())),
        filterSidesProvider.overrideWith((ref) => RestorableFilterType(FilterType())),
        filterFactionsProvider.overrideWith((ref) => RestorableFilterType(FilterType())),
        filterTypesProvider.overrideWith((ref) => RestorableFilterType(FilterType())),
      ],
      child: const DeckPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckResultStream = ref.watch(deckValidatorStreamProvider);
    return AsyncValueBuilder<DeckValidator>(
      value: deckResultStream,
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text(error.toString())),
      ),
      data: (deckValidator) => ProviderScope(
        overrides: [
          deckValidatorResultProvider.overrideWithValue(deckValidator),
          groupedCardListProvider.overrideWith((ref) async* {
            final settings = await ref.watch(settingProvider.future);
            final deckCardList = ref.watch(deckValidatorResultProvider.select((value) {
              return value.deck.cards.keys;
            }));

            final groupBy = settings.deckCardGroup;
            final sortBy = settings.deckCardSort;
            yield HeaderList([
              ...groupBy(sortBy(deckCardList)),
            ]);
          }),
        ],
        child: const DeckResultPage(),
      ),
    );
  }
}

class DeckResultPage extends ConsumerWidget {
  const DeckResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final deck = ref.read(deckProvider).value;
        final changed = deck.state != DeckSaveState.isSaved;
        if (!changed) return true;

        final result = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Save deck changes?'),
            content: const Text('There are unsaved changes to your deck.'),
            actions: [
              MaterialButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              MaterialButton(
                child: const Text('Discard'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              MaterialButton(
                child: const Text('Save'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        if (result != true) return result != null;

        if (!context.mounted) return false;
        final saveResult = await showDialog<DeckNotifierData>(
          context: context,
          barrierDismissible: false,
          builder: (context) => SaveDeckDialog.withOverrides(deck: deck),
        );
        return saveResult != null;
      },
      child: const Scaffold(
        body: DeckBody(),
        floatingActionButton: DeckFloatingActionBar(),
      ),
    );
  }
}
