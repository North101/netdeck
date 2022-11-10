import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util.dart';
import '/util/header_list.dart';
import '/util/nrdb/private.dart';
import '/view/async_value_builder.dart';
import '/view/fab_spacer.dart';
import '/view/filter_chips.dart';
import '/view/header_list_tile.dart';
import '/view/tag_chip.dart';

class DeckListFilters extends ConsumerWidget {
  const DeckListFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(hasDeckFilterProvider);
    if (!hasFilters) {
      return const SizedBox();
    }

    final tags = ref.watch(filterTagsProvider).value;
    final countStuff = ref.watch(countStuffProvider);
    return AsyncValueBuilder<CountStuffResult>(
      value: countStuff,
      loading: () => const Center(child: LinearProgressIndicator()),
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
              if (tags.isNotEmpty) ...tags.map((e) => TagChip(e)),
            ],
          ),
        );
      },
    );
  }
}

class DeckHeader extends ConsumerWidget {
  const DeckHeader(this.indexOffset, this.headerList, {super.key});

  final HeaderItems<DeckFullResult> headerList;
  final int indexOffset;

  void onTap(BuildContext context, WidgetRef ref, int index) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckItemBuilder = ref.watch(deckItemBuilderProvider);
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: headerList.length),
      sliver: SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        sliver: SliverList(
          delegate: SliverChildSeperatedBuilderDelegate(
            (context, index) => deckItemBuilder(context, ref, index, headerList[index]),
            (context, index) => const Divider(),
            childCount: headerList.length,
          ),
        ),
      ),
    );
  }
}

class DeckListList extends ConsumerWidget {
  const DeckListList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedDeckList = ref.watch(groupedDeckListProvider);
    return AsyncValueBuilder<HeaderList<DeckFullResult>>(
      value: groupedDeckList,
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No Decks Found'));
        }
        return CustomScrollView(
          controller: ScrollController(),
          slivers: [
            ...data.mapItems(DeckHeader.new).toList(),
            const SliverList(delegate: SliverChildListDelegate.fixed([FloatingActionButtonSpacer()])),
          ],
        );
      },
    );
  }
}

class DeckListBody extends ConsumerWidget {
  const DeckListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            final nrdbAuthState = ref.read(nrdbAuthStateProvider);
            final online = nrdbAuthState.maybeMap(
              online: (state) => state,
              orElse: () => null,
            );
            if (online == null) {
              scaffoldMessenger.showSnackBar(const SnackBar(
                content: Text('You are not online or connected your netrunnerdb account'),
              ));
              return;
            }

            final decks = await online.listDecks();
            if (decks is SuccessHttpResult<List<NrdbDeck>>) {
              final db = ref.read(dbProvider);
              await db.transaction(() async {
                await online.syncDecks(db, decks.value);
              });
            } else {
              scaffoldMessenger.showSnackBar(const SnackBar(
                content: Text('Failed to refresh decks'),
              ));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              DeckListFilters(),
              Expanded(child: DeckListList()),
            ],
          ),
        ),
        const DeckListLoading(),
      ],
    );
  }
}

class DeckListLoading extends ConsumerWidget {
  const DeckListLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(groupedDeckListProvider.select((value) => value.maybeMap(
          data: (data) => data.isLoading,
          orElse: () => false,
        )));
    if (!isLoading) return const SizedBox.shrink();

    return const LinearProgressIndicator();
  }
}
