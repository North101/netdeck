import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/card_filter_page.dart';

class CardListGroupMenu extends ConsumerWidget {
  const CardListGroupMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardGroup value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardGroup: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardGroup = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardGroup);
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
            checked: v == cardGroup,
            value: v,
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class CardListSortMenu extends ConsumerWidget {
  const CardListSortMenu({super.key});

  Future<void> onSelected(BuildContext context, WidgetRef ref, CardSort value) async {
    final db = ref.read(dbProvider);
    await db.update(db.settings).write(SettingsCompanion(
          cardSort: drift.Value(value),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSort = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data.settings.cardSort);
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
            checked: v == cardSort,
            value: v,
            child: Text(v.title),
          ),
        ),
      ],
    );
  }
}

class CardListMoreActions extends ConsumerStatefulWidget {
  const CardListMoreActions({super.key});

  @override
  CardListMoreActionsState createState() => CardListMoreActionsState();
}

class CardListMoreActionsState extends ConsumerState<CardListMoreActions> with RestorationMixin {
  late RestorableRouteFuture<CardFilterResult> cardListFilterRoute;

  @override
  void initState() {
    super.initState();

    cardListFilterRoute = RestorableRouteFuture<CardFilterResult>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        openCardFilterRoute,
        arguments: arguments,
      ),
      onComplete: (result) {
        final format = ref.read(filterFormatProvider);
        format.value = result.format;

        final collection = ref.read(filterCollectionProvider);
        collection.value = result.collection;

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
      },
    );
  }

  static Route<void> openCardFilterRoute(BuildContext context, Object? arguments) {
    final result = CardFilterResult.fromJson((arguments as Map).cast());
    return MaterialPageRoute<CardFilterResult>(builder: (context) {
      return CardFilterPage.withOverrides(
        format: result.format,
        rotation: result.rotation,
        mwl: result.mwl,
        collection: result.collection,
        packs: result.packs,
        sides: result.sides,
        factions: result.factions,
        types: result.types,
      );
    });
  }

  void openCardFilterPage(BuildContext context, WidgetRef ref) {
    final format = ref.read(filterFormatProvider);
    final collection = ref.read(filterCollectionProvider);
    final rotation = ref.read(filterRotationProvider);
    final mwl = ref.read(filterMwlProvider);
    final packs = ref.read(filterPacksProvider);
    final sides = ref.read(filterSidesProvider);
    final factions = ref.read(filterFactionsProvider);
    final types = ref.read(filterTypesProvider);

    final result = CardFilterResult(
      format: format.value,
      collection: collection.value,
      rotation: rotation.value,
      mwl: mwl.value,
      packs: packs.value,
      sides: sides.value,
      factions: factions.value,
      types: types.value,
    );
    cardListFilterRoute.present(result.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const ListTile(title: Text('Filter By')),
          onTap: () => Future(() => openCardFilterPage(context, ref)),
        ),
        const PopupMenuItem(child: CardListGroupMenu()),
        const PopupMenuItem(child: CardListSortMenu()),
      ],
    );
  }

  @override
  String? restorationId = 'card_list_more_actions';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cardListFilterRoute, 'cardListFilterRoute');
  }
}
