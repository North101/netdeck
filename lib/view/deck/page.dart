import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netrunner_deckbuilder/view/deck/util.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import 'body.dart';
import 'fab.dart';

class DeckPage extends ConsumerWidget {
  const DeckPage({Key? key}) : super(key: key);

  static withOverrides({
    required DeckResult2 deck,
  }) {
    return ProviderScope(
      overrides: [
        deckProvider.overrideWithValue(DeckNotifier(deck)),
        groupedCardListProvider.overrideWithProvider(groupedDeckCardListProvider),
        filterSearchingProvider.overrideWithValue(StateController(false)),
        filterQueryProvider.overrideWithValue(StateController(null)),
        filterCollectionProvider.overrideWithValue(StateController(false)),
        filterPacksProvider.overrideWithValue(StateController(FilterType())),
        filterSidesProvider.overrideWithValue(StateController(FilterType(always: {deck.side.code}))),
        filterFactionsProvider.overrideWithValue(StateController(FilterType())),
        filterTypesProvider.overrideWithValue(StateController(FilterType(never: {deck.identity.typeCode}))),
      ],
      child: const DeckPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final deckNotifier = ref.read(deckProvider.notifier);
        if (!deckNotifier.changed) return true;

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

        final saveLocation = await whereToSave(context, ref);
        if (saveLocation == null) {
          return false;
        } else if (saveLocation == SaveLocation.local) {
          return await save(context, ref);
        } else {
          return await upload(context, ref);
        }
      },
      child: const Scaffold(
        body: DeckBody(),
        floatingActionButton: DeckFloatingActionBar(),
      ),
    );
  }
}
