import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/header_list.dart';
import '/view/filter_chips.dart';
import '/view/header_list_tile.dart';

typedef OnCardTap = void Function(BuildContext context, WidgetRef ref, int index, CardResult card);

class CardListFilters extends ConsumerWidget {
  const CardListFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(hasCardFilterProvider);
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
              const MyCollectionChip(),
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

class CardHeader extends ConsumerWidget {
  const CardHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final int indexOffset;
  final HeaderItems<CardResult> headerList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardItemBuilder = ref.watch(cardItemBuilderProvider);
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: headerList.length),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index.isEven) {
              final realIndex = index ~/ 2;
              return cardItemBuilder(context, ref, indexOffset + realIndex, headerList[realIndex]);
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

class CardListList extends ConsumerWidget {
  const CardListList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    return groupedCardList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Center(child: Text(error.toString())),
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No Cards Found'));
        }
        return CustomScrollView(
          controller: ScrollController(),
          slivers: data.map((item) => CardHeader(data.sumUntilItem(item), item)).toList(),
        );
      },
    );
  }
}

class CardListBody extends ConsumerWidget {
  const CardListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            CardListFilters(),
            Expanded(child: CardListList()),
          ],
        ),
        const CardListLoading(),
      ],
    );
  }
}

class CardListLoading extends ConsumerWidget {
  const CardListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(groupedCardListProvider.select((value) => value.maybeMap(
          data: (data) => data.isLoading,
          orElse: () => false,
        )));
    if (!isLoading) return const SizedBox.shrink();

    return const LinearProgressIndicator();
  }
}
