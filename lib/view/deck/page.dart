import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/deck_validator.dart';
import '/util/filter_type.dart';
import '/view/async_value_builder.dart';
import '/view/save_deck_dialog.dart';
import 'body.dart';
import 'fab.dart';

class DeckPage extends ConsumerWidget {
  const DeckPage({super.key});

  static Widget withOverrides({
    required DeckNotifierResult deck,
  }) {
    return ProviderScope(
      restorationId: 'deck_page',
      overrides: [
        deckProvider.overrideWithValue(DeckNotifier(deck), 'deckProvider'),
        filterSearchingProvider.overrideWithValue(RestorableBool(false), 'filterSearchingProvider'),
        filterQueryProvider.overrideWithValue(RestorableQuery(null), 'filterQueryProvider'),
        filterCollectionProvider.overrideWithValue(RestorableBool(false), 'filterCollectionProvider'),
        filterPacksProvider.overrideWithValue(RestorableFilterType(FilterType()), 'filterPacksProvider'),
        filterSidesProvider.overrideWithValue(RestorableFilterType(FilterType()), 'filterSidesProvider'),
        filterFactionsProvider.overrideWithValue(RestorableFilterType(FilterType()), 'filterFactionsProvider'),
        filterTypesProvider.overrideWithValue(RestorableFilterType(FilterType()), 'filterTypesProvider'),
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
          groupedCardListProvider.overrideWithProvider(groupedDeckCardListProvider),
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

        final saveResult = await showDialog<DeckNotifierResult>(
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
