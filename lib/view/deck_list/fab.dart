import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../card_gallery/page.dart';
import '../card_tile.dart';
import '/db/database.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/card_list/page.dart';
import '../deck_page/page.dart';

class DeckListFloatingActionBar extends ConsumerWidget {
  const DeckListFloatingActionBar({Key? key}) : super(key: key);

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
              filterCollection: settings.settings.filterCollection,
              filterFormat: settings.filterFormat,
              filterRotation: settings.filterRotation,
              filterMwl: settings.filterMwl,
              filterTypes: FilterType(
                visible: false,
                always: {'identity'},
              ),
              cardTile: (context, ref, index, card) => CardTile(
                card,
                trailing: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return DeckPage.withOverrides(
                      deck: card.toDeck(
                        DeckData(
                          id: const Uuid().v4(),
                          identityCode: card.code,
                          name: card.card.title,
                          description: '',
                          created: DateTime.now(),
                          updated: DateTime.now(),
                          state: DeckState.local,
                        ),
                        null,
                        null,
                      ),
                      cards: {},
                      tags: [],
                    );
                  })),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return CardGalleryPage.withOverrides(
                    groupedCardList: ref.read(groupedCardListProvider),
                    currentIndex: index,
                  );
                })),
              ),
            );
          }));
        },
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
