import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/filter_type.dart';
import '/view/deck_compare/page.dart';
import '/view/deck_list/page.dart';
import '/view/deck_tile.dart';
import '/view/save_deck_dialog.dart';

class DeckGroupMenu extends ConsumerWidget {
  const DeckGroupMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckCardGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.deckCardGroup);
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
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class DeckSortMenu extends ConsumerWidget {
  const DeckSortMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckCardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.deckCardSort);
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
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class CompareDeckListFloatingActionButton extends ConsumerWidget {
  const CompareDeckListFloatingActionButton({
    required this.deck,
    super.key,
  });

  final DeckFullResult deck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      child: const Icon(Icons.compare),
      onPressed: () {
        final deckList = ref.read(selectedCompareDeckListProvider);
        Navigator.of(context).restorablePush(
          DeckComparePage.route,
          arguments: DeckCompareArguments({
            deck.toDeckCompare(),
            ...deckList.value,
          }).toJson(),
        );
      },
    );
  }
}

class DeckMoreActions extends ConsumerWidget {
  const DeckMoreActions({super.key});

  static Route<void> openDeckListPage(BuildContext context, Object? arguments) {
    final deck = DeckFullResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return RestorableProviderScope(
        restorationId: 'compare_deck_list_page_wrapper',
        overrides: [
          selectedCompareDeckListProvider.overrideWith((ref) => RestorableDeckMicroResultSet({})),
        ],
        child: DeckListPage.withOverrides(
          restorationId: 'compare_deck_list_page',
          automaticallyImplyLeading: true,
          title: 'Compare To',
          filterFormat: deck.format,
          filterRotation: deck.rotation,
          filterMwl: deck.mwl,
          filterSides: FilterType(always: {deck.side.code}),
          itemBuilder: (context, ref, index, deck) => CompareDeckTile(
            index: index,
            deck: deck,
          ),
          fab: CompareDeckListFloatingActionButton(deck: deck),
        ),
      );
    });
  }

  void compareTo(BuildContext context, WidgetRef ref) {
    final changed = ref.read(deckProvider).value.state != DeckSaveState.isSaved;
    final deck = ref.read(deckValidatorResultProvider).deck;
    Navigator.of(context).restorablePush(
      openDeckListPage,
      arguments: changed
          ? deck.copyWith(deck: deck.deck.copyWith(name: '${deck.deck.name} (Unsaved)')).toJson()
          : deck.toJson(),
    );
  }

  Future<void> delete(BuildContext context, WidgetRef ref) async {
    final navigator = Navigator.of(context);
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete deck?'),
        content: const Text('Are you sure you want to delete this deck?'),
        actions: [
          MaterialButton(
            onPressed: () => navigator.pop(false),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () => navigator.pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (result != true) return;

    final db = ref.read(dbProvider);
    final deck = ref.read(deckProvider).value;
    await db.deleteDecks(deckIds: [deck.id]);

    navigator.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSynced = ref.watch(deckProvider.select((value) => value.value.synced != null));
    final isConnected = ref.watch(nrdbAuthStateProvider.select((value) => value.isConnected));
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton<Never>(
        itemBuilder: (_) => [
          PopupMenuItem(
            child: const ListTile(title: Text('Compare to')),
            onTap: () => Future(() => compareTo(context, ref)),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(child: DeckGroupMenu()),
          const PopupMenuItem(child: DeckSortMenu()),
          const PopupMenuDivider(),
          PopupMenuItem(
            enabled: isConnected,
            child: ListTile(enabled: isConnected, title: const Text('Upload')),
            onTap: () => Future(() async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierData>(
                context: context,
                barrierDismissible: false,
                builder: (context) => SaveDeckDialog.withOverrides(
                  deck: deckNotifier.value,
                  state: SaveDialogState.askToUpload,
                ),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            }),
          ),
          PopupMenuItem(
            enabled: isConnected && isSynced,
            child: ListTile(enabled: isConnected && isSynced, title: const Text('Download')),
            onTap: () => Future(() async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierData>(
                context: context,
                barrierDismissible: false,
                builder: (context) => DownloadDeckDialog.withOverrides(deck: deckNotifier.value),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            }),
          ),
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
  const DeckAppBar({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckValidatorResultProvider).deck;

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
            final deckNotifier = ref.read(deckProvider);
            final result = await showDialog<DeckNotifierData>(
              context: context,
              barrierDismissible: false,
              builder: (context) => SaveDeckDialog.withOverrides(
                deck: deckNotifier.value,
              ),
            );
            if (result == null) return;

            deckNotifier.saved = result;
          },
        ),
        const DeckMoreActions(),
      ],
    );
  }
}

class CompareDeckTile extends ConsumerWidget {
  const CompareDeckTile({
    required this.index,
    required this.deck,
    super.key,
  });

  final int index;
  final DeckFullResult deck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckList = ref.watch(selectedCompareDeckListProvider);
    final selected = deckList.value.any((e) => e.id == deck.deck.id);
    return DeckTile(
      deck: deck,
      selected: selected,
      onTap: () {
        deckList.value = {
          ...deckList.value.where((e) => e.id != deck.deck.id),
          if (!selected) deck.toDeckCompare(),
        };
      },
    );
  }
}
