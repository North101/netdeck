import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/util/grouped_card_code_list.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';
import '/view/deck/page.dart';

class DeckListFloatingActionBar extends ConsumerWidget {
  const DeckListFloatingActionBar({super.key});

  static Route<void> openIdentityRoute(BuildContext context, Object? arguments) {
    final settings = SettingsResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return CardListPage.withOverrides(
        restorationId: 'idetnity_list_page',
        title: 'Identity',
        filterCollection: settings.filterCollection,
        filterFormat: settings.filterFormat,
        filterRotation: settings.filterRotation,
        filterMwl: settings.filterMwl,
        filterTypes: FilterType(
          visible: false,
          always: {'identity'},
        ),
        itemBuilder: (context, ref, index, card) => IdentityTile(
          index: index,
          card: card,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.maybeWhen(
      data: (settings) => FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).restorablePush(
          openIdentityRoute,
          arguments: settings.toJson(),
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class IdentityTile extends ConsumerWidget {
  const IdentityTile({
    required this.index,
    required this.card,
    super.key,
  });

  final int index;
  final CardResult card;

  static Route<void> openDeckRoute(BuildContext context, Object? argument) {
    final card = CardResult.fromJson((argument as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return DeckPage.withOverrides(
        deck: DeckNotifierData(
          id: const Uuid().v4(),
          identityCode: card.card.code,
          name: card.card.title,
          description: '',
          formatCode: null,
          rotationCode: null,
          mwlCode: null,
          created: DateTime.now(),
          updated: DateTime.now(),
          remoteUpdated: null,
          synced: null,
          deleted: false,
          cards: {},
          tags: [],
          state: DeckSaveState.isNew,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mwlCard = ref.watch(mwlCardMapProvider.select((value) {
      return value.whenOrNull(data: (data) => data[card.card.title]);
    }));
    return CardTile(
      card,
      key: ValueKey(card),
      mwlCard: mwlCard,
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).restorablePushReplacement(
          openDeckRoute,
          arguments: card.toJson(),
        ),
      ),
      onTap: () async {
        final navigator = Navigator.of(context);
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        navigator.restorablePush(
          CardGalleryPage.route,
          arguments: CardGalleryArguments(
            items: GroupedCardCodeList.fromCardResult(groupedCardList),
            index: index,
            deckCards: null,
          ).toJson(),
        );
      },
    );
  }
}
