import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class DeckCompareSortMenu extends ConsumerWidget {
  const DeckCompareSortMenu(this.settings, {super.key});

  final SettingsResult settings;

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          compareCardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compareCardSort = settings.compareCardSort;
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
            checked: v == compareCardSort,
            value: v,
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class DeckCompareMoreActions extends ConsumerWidget {
  const DeckCompareMoreActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton<Never>(
        itemBuilder: (context) => [
          PopupMenuItem(child: DeckCompareSortMenu(settings)),
        ],
      ),
    );
  }
}

class DeckCompareAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DeckCompareAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(context, ref) {
    return AppBar(
      title: const Text('Compare Decks'),
      actions: const [
        DeckCompareMoreActions(),
      ],
    );
  }
}
