import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/filter_type.dart';
import '/view/deck_compare/page.dart';
import '/view/deck_list/page.dart';
import '/view/deck_tile.dart';
import 'util.dart';

class DeckGroupMenu extends ConsumerWidget {
  const DeckGroupMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckCardGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckCardGroup);
    }));
    return PopupMenuButton<CardGroup>(
      child: const ListTile(
        title: Text('Group By'),
        trailing: Icon(Icons.play_arrow, size: 12),
      ),
      onSelected: (value) => onSelected(context, ref, value),
      itemBuilder: (context) => [
        const PopupMenuItem(
          enabled: false,
          child: Text('Group By'),
        ),
        ...CardGroup.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckCardGroup,
            value: v,
            child: Text(v.name(context)),
          ),
        ),
      ],
    );
  }
}

class DeckSortMenu extends ConsumerWidget {
  const DeckSortMenu({Key? key}) : super(key: key);

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckCardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckCardSort);
    }));
    return PopupMenuButton<CardSort>(
      child: const ListTile(
        title: Text('Sort By'),
        trailing: Icon(Icons.play_arrow, size: 12),
      ),
      onSelected: (value) => onSelected(context, ref, value),
      itemBuilder: (context) => [
        const PopupMenuItem(
          enabled: false,
          child: Text('Sort By'),
        ),
        ...CardSort.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckCardSort,
            value: v,
            child: Text(v.name),
          ),
        ),
      ],
    );
  }
}

class DeckMoreActions extends ConsumerWidget {
  const DeckMoreActions({Key? key}) : super(key: key);

  Future<void> compareTo(BuildContext context, WidgetRef ref) async {
    final deck = ref.read(deckProvider);
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DeckListPage.withOverrides(
        automaticallyImplyLeading: true,
        title: 'Compare To',
        filterFormat: deck.format,
        filterRotation: deck.rotation,
        filterMwl: deck.mwl,
        filterSides: FilterType(always: {deck.side.code}),
        deckTile: (context, ref, index, deck) {
          final compareDeckList = ref.watch(compareDeckListProvider.state);
          final selected = compareDeckList.state.contains(deck);
          return DeckTile(
            deck: deck,
            selected: selected,
            onTap: () {
              compareDeckList.state = {
                ...compareDeckList.state.where((e) => e != deck),
                if (!selected) deck,
              };
            },
          );
        },
        fab: FloatingActionButton(
          child: const Icon(Icons.compare),
          onPressed: () {
            final compareDeckList = ref.read(compareDeckListProvider);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DeckComparePage.withOverrides(
                deckList: {
                  deck,
                  ...compareDeckList,
                },
              );
            }));
          },
        ),
      );
    }));
  }

  Future<void> delete(BuildContext context, WidgetRef ref) async {
    final db = ref.read(dbProvider);
    final deck = ref.read(deckProvider);
    await db.deleteDecks(deckIds: [deck.deck.id]);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton(
        itemBuilder: (_) => <PopupMenuEntry>[
          PopupMenuItem(
            child: const ListTile(title: Text('Compare to')),
            onTap: () => Future(() => compareTo(context, ref)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(child: DeckGroupMenu()),
          const PopupMenuItem(child: DeckSortMenu()),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: const ListTile(title: Text('Delete')),
            onTap: () => Future(() => delete(context, ref)),
          ),
        ],
      ),
    );
  }
}

class DeckAppBar extends ConsumerWidget {
  const DeckAppBar({required this.constraints, Key? key}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);

    const imageHeight = 419;
    const imageWidth = 300;
    const aspectRatio = imageHeight / imageWidth;
    final width = constraints.maxWidth;
    final height = aspectRatio * width;
    final heightRatio = height / imageHeight;
    final bottomOffset = 168 * heightRatio;
    return SliverAppBar(
      pinned: true,
      expandedHeight: min((height - bottomOffset), constraints.maxHeight * 0.8),
      backgroundColor: deck.faction.color,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 48, bottom: 16, end: 48),
        title: Text(deck.deck.name, overflow: TextOverflow.fade, softWrap: false, maxLines: 1),
        background: CachedNetworkImage(
          imageUrl: deck.identity.imageUrl,
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          placeholder: (context, imageUrl) {
            return deck.faction.icon?.image(height: 419) ?? Assets.images.click.image();
          },
          errorWidget: (context, imageUrl, error) {
            return deck.faction.icon?.image(height: 419) ?? Assets.images.interrupt.image();
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: () async {
            final saveLocation = await whereToSave(context, ref);
            if (saveLocation == null) {
              return;
            } else if (saveLocation == SaveLocation.local) {
              await save(context, ref);
            } else {
              await upload(context, ref);
            }
          },
        ),
        const DeckMoreActions(),
      ],
    );
  }
}
