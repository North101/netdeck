import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/deck_filter_page.dart';

class DeckListGroupMenu extends ConsumerWidget {
  const DeckListGroupMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckGroup);
    }));
    return PopupMenuButton<DeckGroup>(
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
        ...DeckGroup.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckGroup,
            value: v,
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class DeckListSortMenu extends ConsumerWidget {
  const DeckListSortMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, DeckSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          deckSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.deckSort);
    }));
    return PopupMenuButton<DeckSort>(
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
        ...DeckSort.values.map(
          (v) => CheckedPopupMenuItem(
            checked: v == deckSort,
            value: v,
            child: Text(v.name),
          ),
        ),
      ],
    );
  }
}

class DeckListMoreActions extends ConsumerStatefulWidget {
  const DeckListMoreActions({super.key});

  @override
  DeckListMoreActionsState createState() => DeckListMoreActionsState();
}

class DeckListMoreActionsState extends ConsumerState<DeckListMoreActions> with RestorationMixin {
  late RestorableRouteFuture<DeckFilterResult> deckFilterRoute;

  @override
  void initState() {
    super.initState();

    deckFilterRoute = RestorableRouteFuture(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openDeckFilterRoute,
        arguments: arguments,
      ),
      onComplete: (result) {
        final format = ref.read(filterFormatProvider);
        format.value = result.format;

        final rotation = ref.read(filterRotationProvider);
        rotation.value = result.rotation;

        final mwl = ref.read(filterMwlProvider);
        mwl.value = result.mwl;

        final packs = ref.read(filterPacksProvider);
        packs.value = result.packs;

        final sides = ref.read(filterSidesProvider);
        sides.value = result.sides;

        final factions = ref.read(filterFactionsProvider);
        factions.value = result.factions;

        final types = ref.read(filterTypesProvider);
        types.value = result.types;

        final tags = ref.read(filterTagsProvider);
        tags.value = result.tags;
      },
    );
  }

  static Route<void> openDeckFilterRoute(BuildContext context, Object? arguments) {
    final result = DeckFilterResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute<DeckFilterResult>(builder: (context) {
      return DeckFilterPage.withOverrides(
        format: result.format,
        rotation: result.rotation,
        mwl: result.mwl,
        packs: result.packs,
        sides: result.sides,
        factions: result.factions,
        types: result.types,
        tags: result.tags,
      );
    });
  }

  void openCardFilterPage(BuildContext context, WidgetRef ref) {
    final format = ref.read(filterFormatProvider);
    final rotation = ref.read(filterRotationProvider);
    final mwl = ref.read(filterMwlProvider);
    final packs = ref.read(filterPacksProvider);
    final sides = ref.read(filterSidesProvider);
    final factions = ref.read(filterFactionsProvider);
    final types = ref.read(filterTypesProvider);
    final tags = ref.read(filterTagsProvider);

    final result = DeckFilterResult(
      format: format.value,
      rotation: rotation.value,
      mwl: mwl.value,
      packs: packs.value,
      sides: sides.value,
      factions: factions.value,
      types: types.value,
      tags: tags.value,
    );
    deckFilterRoute.present(result.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stacktrace) => const SizedBox.shrink(),
      data: (settings) => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const ListTile(title: Text('Filter By')),
            onTap: () => Future(() => openCardFilterPage(context, ref)),
          ),
          const PopupMenuItem(child: DeckListGroupMenu()),
          const PopupMenuItem(child: DeckListSortMenu()),
        ],
      ),
    );
  }

  @override
  String? restorationId = 'deck_list_more_actions';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(deckFilterRoute, 'deckFilterRoute');
  }
}
