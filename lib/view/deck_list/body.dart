import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:netrunner_deckbuilder/view/deck_page/loading_page.dart';

import '../card_cycle.dart';
import '../floatingactionbutton_spacer.dart';
import '/db/database.dart';
import '/providers.dart';
import '../filter_chips.dart';
import '../header_list_tile.dart';

class DeckListFilters extends ConsumerWidget {
  const DeckListFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(hasDeckFilterProvider);
    if (!hasFilters) {
      return const SizedBox();
    }

    final countStuff = ref.watch(countStuffProvider);
    return countStuff.when(
      loading: () => const Center(child: LinearProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (data) {
        return SizedBox(
          height: 40,
          child: ListView(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              const RotationChip(),
              const MwlChip(),
              PacksChip(count: data.packCount),
              FactionsChip(count: data.factionCount),
              TypesChip(count: data.typeCount),
            ],
          ),
        );
      },
    );
  }
}

class DeckHeader extends ConsumerWidget {
  const DeckHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final HeaderItems<DeckResult> headerList;
  final int indexOffset;

  void onTap(BuildContext context, WidgetRef ref, int index) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: HeaderListTile.title(title: '${headerList.header} (${headerList.length})'),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final deck = headerList[index];
            return ListTile(
              leading: deck.faction.icon?.image(height: 36),
              title: Text(deck.deck.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(deck.identity.title),
                  CardCycleWidget(deck.toCard()),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return DeckLoaderPage(deckId: deck.deck.id);
                }));
              },
            );
          },
          childCount: headerList.length,
        ),
      ),
    );
  }
}

class DeckListList extends ConsumerWidget {
  const DeckListList({
    this.onDeckPressed,
    Key? key,
  }) : super(key: key);

  final void Function(dynamic)? onDeckPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedDeckList = ref.watch(groupedDeckListProvider);
    return groupedDeckList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Center(child: Text(error.toString())),
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No Decks Found'));
        }
        return CustomScrollView(
          controller: ScrollController(),
          slivers: [
            ...data.map((item) => DeckHeader(data.sumUntilItem(item), item)).toList(),
            const SliverList(delegate: SliverChildListDelegate.fixed([FloatingActionButtonSpacer()])),
          ],
        );
      },
    );
  }
}

class DeckListBody extends ConsumerWidget {
  const DeckListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        DeckListFilters(),
        Expanded(child: DeckListList()),
      ],
    );
  }
}
