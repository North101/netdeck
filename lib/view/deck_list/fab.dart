import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/card_gallery_page.dart';
import '/view/card_list/page.dart';
import '/view/card_tile.dart';
import '/view/deck/page.dart';

class DeckListFloatingActionBar extends ConsumerWidget {
  const DeckListFloatingActionBar({Key? key}) : super(key: key);

  Widget cardItemBuilder(BuildContext context, WidgetRef ref, int index, CardResult card) {
    final mwlCardMap = ref.watch(mwlCardMapProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    return CardTile(
      card,
      key: ValueKey(card),
      mwlCard: mwlCardMap?[card.code],
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DeckPage.withOverrides(
            deck: card.toDeck(
              deck: DeckData(
                id: const Uuid().v4(),
                identityCode: card.code,
                name: card.card.title,
                description: '',
                created: DateTime.now(),
                updated: DateTime.now(),
                deleted: false,
              ),
              cards: {},
              tags: [],
            ),
          );
        })),
      ),
      onTap: () async {
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardGalleryPage.withOverrides(
            groupedCardList: groupedCardList,
            currentIndex: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.maybeWhen(
      data: (settings) => FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CardListPage.withOverrides(
              title: 'Identity',
              filterCollection: StateController(settings.settings.filterCollection),
              filterFormat: StateController(settings.filterFormat),
              filterRotation: StateController(settings.filterRotation),
              filterMwl: StateController(settings.filterMwl),
              filterTypes: StateController(FilterType(
                visible: false,
                always: {'identity'},
              )),
              itemBuilder: cardItemBuilder,
            );
          }));
        },
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
