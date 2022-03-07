import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import '/util/nrdb/private.dart';
import '/view/fab_spacer.dart';
import '/view/filter_chips.dart';
import '/view/header_list_tile.dart';
import '/view/tag_chip.dart';

class DeckListFilters extends ConsumerWidget {
  const DeckListFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(hasDeckFilterProvider);
    if (!hasFilters) {
      return const SizedBox();
    }

    final tags = ref.watch(filterTagsProvider);
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
              if (tags.isNotEmpty) ...tags.map((e) => TagChip(e)),
            ],
          ),
        );
      },
    );
  }
}

class DeckHeader extends ConsumerWidget {
  const DeckHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final HeaderItems<DeckResult2> headerList;
  final int indexOffset;

  void onTap(BuildContext context, WidgetRef ref, int index) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckItemBuilder = ref.watch(deckItemBuilderProvider);
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: headerList.length),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index.isEven) {
              final realIndex = index ~/ 2;
              return deckItemBuilder(context, ref, realIndex, headerList[realIndex]);
            } else {
              return const Divider();
            }
          },
          childCount: headerList.length * 2,
        ),
      ),
    );
  }
}

class DeckListList extends ConsumerWidget {
  const DeckListList({Key? key}) : super(key: key);

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
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            final nrdbAuthState = ref.read(nrdbAuthStateProvider);
            final online = nrdbAuthState.maybeMap(
              online: (state) => state,
              orElse: () => null,
            );
            if (online == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You are not online or connected your netrunnerdb account'),
              ));
              return;
            }

            final decks = await online.listDecks();
            if (decks is SuccessHttpResult<List<NrdbDeck>>) {
              final db = ref.read(dbProvider);
              await online.syncDecks(db, decks.value);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Fail to refresh decks'),
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
  const DeckListLoading({Key? key}) : super(key: key);

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
