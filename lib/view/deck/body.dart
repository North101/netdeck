import 'package:chips_input/chips_input.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart' hide Card;
import '/providers.dart';
import '/util.dart';
import '/util/deck_validator.dart';
import '/util/extensions.dart';
import '/util/grouped_card_code_list.dart';
import '/util/header_list.dart';
import '/view/card_gallery_page.dart';
import '/view/card_tile.dart';
import '/view/fab_spacer.dart';
import '/view/format_dropdown.dart';
import '/view/header_list_tile.dart';
import '/view/mwl_dropdown.dart';
import '/view/rotation_dropdown.dart';
import '/view/save_deck_dialog.dart';
import 'appbar.dart';
import 'description_page.dart';

class DeckStatsHeaderDelegate extends SliverPersistentHeaderDelegate {
  const DeckStatsHeaderDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const HeaderListTile(child: DeckStats());
  }

  @override
  final double maxExtent = 50;

  @override
  final double minExtent = 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class DeckBody extends ConsumerStatefulWidget {
  const DeckBody({super.key});

  @override
  DeckBodyState createState() => DeckBodyState();
}

class DeckBodyState extends ConsumerState<DeckBody> with RestorationMixin {
  late RestorableRouteFuture<CardGalleryResult> cardGalleryRoute;

  @override
  void initState() {
    super.initState();

    cardGalleryRoute = RestorableRouteFuture<CardGalleryResult>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        CardGalleryPage.route,
        arguments: arguments,
      ),
      onComplete: (result) {
        final deck = ref.read(deckProvider);
        deck.value = deck.value.copyWith(cards: result.deckCards);
      },
    );
  }

  void showErrors(List<String> errors) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (errors.isEmpty) {
      scaffoldMessenger.hideCurrentMaterialBanner();
      return;
    }

    scaffoldMessenger.showMaterialBanner(MaterialBanner(
      padding: const EdgeInsets.all(4),
      content: ListTile(
        title: Text(
          errors.join('\n'),
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      actions: const [
        TextButton(
          onPressed: null,
          child: Text('DISMISS'),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    return LayoutBuilder(
      builder: (context, constraints) => CustomScrollView(slivers: [
        DeckAppBar(constraints: constraints),
        const SliverPersistentHeader(
          pinned: true,
          delegate: DeckStatsHeaderDelegate(),
        ),
        const SliverList(
          delegate: SliverChildListDelegate.fixed([
            DeckSyncStatus(),
            DeckErrors(),
          ]),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 8),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed([
              DeckIdentity(),
              DeckNameField(),
              DeckDescriptionField(),
              DeckTags(),
              DeckFormatDropdown(),
              DeckRotationDropdown(),
              DeckMwlDropdown(),
            ]),
          ),
        ),
        if (groupedCardList.hasError)
          SliverToBoxAdapter(child: Text(groupedCardList.error!.toString()))
        else if (!groupedCardList.hasValue)
          const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        else
          ...groupedCardList.value!.mapItems((offset, e) {
            return DeckCardHeader(offset, e, cardGalleryRoute);
          }),
        const SliverList(delegate: SliverChildListDelegate.fixed([FloatingActionButtonSpacer()])),
      ]),
    );
  }

  @override
  String? get restorationId => 'deck_body';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cardGalleryRoute, 'cardGalleryRoute');
  }
}

class DeckNameField extends ConsumerStatefulWidget {
  const DeckNameField({super.key});

  @override
  DeckNameFieldState createState() => DeckNameFieldState();
}

class DeckNameFieldState extends ConsumerState<DeckNameField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    setName(ref.read(deckValidatorResultProvider).deck.deck.name);
  }

  void setName(String name) {
    if (controller.text == name) return;

    controller.text = name;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      deckValidatorResultProvider.select((value) => value.deck.deck.name),
      (prevValue, value) => setName(value),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Name'),
        onChanged: (value) {
          final deck = ref.read(deckProvider);
          deck.unsaved = deck.value.copyWith(
            name: value,
          );
        },
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class DeckDescriptionField extends ConsumerStatefulWidget {
  const DeckDescriptionField({super.key});

  @override
  DeckDescriptionFieldState createState() => DeckDescriptionFieldState();
}

class DeckDescriptionFieldState extends ConsumerState<DeckDescriptionField> with RestorationMixin {
  late RestorableRouteFuture<String> deckDescriptionRoute;

  @override
  void initState() {
    super.initState();

    deckDescriptionRoute = RestorableRouteFuture<String>(
      onPresent: (navigator, arguments) => Navigator.of(context).restorablePush(
        DeckDescriptionPage.route,
        arguments: arguments,
      ),
      onComplete: (value) {
        final deck = ref.read(deckProvider);
        deck.value = deck.value.copyWith(
          description: value,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final description = ref.watch(deckValidatorResultProvider.select((value) => value.deck.deck.description));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: TextEditingController(text: description.replaceAll('\n', ' ')),
        focusNode: AlwaysDisabledFocusNode(),
        decoration: const InputDecoration(labelText: 'Description'),
        readOnly: true,
        onTap: () {
          final deck = ref.read(deckProvider);
          deckDescriptionRoute.present(deck.value.description);
        },
      ),
    );
  }

  @override
  String? restorationId = 'deck_description_field';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(deckDescriptionRoute, 'deckDescriptionRoute');
  }
}

class DeckFormatDropdown extends ConsumerWidget {
  const DeckFormatDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(deckValidatorResultProvider.select((value) => value.deck.format));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FormatDropdown.withOverrides(
        format: format,
        onChanged: (value) {
          final deck = ref.read(deckProvider);
          deck.unsaved = deck.value.copyWith(
            formatCode: drift.Value(value?.format.code),
            rotationCode: drift.Value(value?.let((e) => e.currentRotation?.code) ?? deck.value.rotationCode),
            mwlCode: drift.Value(value?.let((e) => e.activeMwl?.code) ?? deck.value.mwlCode),
          );
        },
      ),
    );
  }
}

class DeckRotationDropdown extends ConsumerWidget {
  const DeckRotationDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(deckValidatorResultProvider.select((value) => value.deck.format));
    final rotation = ref.watch(deckValidatorResultProvider.select((value) => value.deck.rotation));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RotationDropdown.withOverrides(
        format: format,
        rotation: rotation,
        onChanged: (value) {
          final deck = ref.read(deckProvider);
          deck.unsaved = deck.value.copyWith(
            rotationCode: drift.Value(value?.code),
          );
        },
      ),
    );
  }
}

class DeckMwlDropdown extends ConsumerWidget {
  const DeckMwlDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(deckValidatorResultProvider.select((value) => value.deck.format));
    final mwl = ref.watch(deckValidatorResultProvider.select((value) => value.deck.mwl));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MwlDropdown.withOverrides(
        format: format,
        mwl: mwl,
        onChanged: (value) {
          final deck = ref.read(deckProvider);
          deck.unsaved = deck.value.copyWith(
            mwlCode: drift.Value(value?.code),
          );
        },
      ),
    );
  }
}

class DeckIdentity extends ConsumerWidget {
  const DeckIdentity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identity = ref.watch(deckValidatorResultProvider.select((value) => value.deck.toCard()));
    return CardTile(
      identity,
      key: ValueKey(identity.code),
      logo: false,
      body: true,
      onTap: () async {
        final navigator = Navigator.of(context);
        final cards = await ref.read(groupedCardListProvider.future);
        final deckCards = ref.read(deckProvider).value.cards;

        navigator.restorablePush(
          CardGalleryPage.route,
          arguments: CardGalleryArguments(
            items: GroupedCardCodeList.fromCardResult(HeaderList([
              HeaderItems(
                identity.type.name,
                [identity],
              ),
              ...cards,
            ])),
            index: 0,
            deckCards: deckCards,
          ).toJson(),
        );
      },
    );
  }
}

class DeckCardHeader extends ConsumerWidget {
  const DeckCardHeader(
    this.indexOffset,
    this.headerList,
    this.cardGalleryRoute, {
    super.key,
  });

  final HeaderItems<CardResult> headerList;
  final int indexOffset;
  final RestorableRouteFuture<CardGalleryResult> cardGalleryRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardList = ref.watch(deckProvider.select((value) => value.value.cards));
    final count = headerList.map<int>((e) => deckCardList[e.code] ?? 0).sum;
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: count),
      sliver: SliverList(
        delegate: SliverChildSeperatedBuilderDelegate(
          (context, index) => DeckCardTile(
            index: indexOffset + index,
            card: headerList[index],
            cardGalleryRoute: cardGalleryRoute,
          ),
          (context, index) => const Divider(),
          childCount: headerList.length,
        ),
      ),
    );
  }
}

class DeckInfluenceStat extends ConsumerWidget {
  const DeckInfluenceStat({
    required this.deckValidator,
    super.key,
  });

  final DeckValidator deckValidator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final influence = deckValidator.influence;
    final maxInfluence = deckValidator.maxInfluence;
    final hasError = deckValidator.influenceError != null;
    return Column(children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$influence',
              style: TextStyle(color: hasError ? theme.colorScheme.error : null),
            ),
            const TextSpan(text: ' / '),
            TextSpan(text: '${maxInfluence ?? '∞'}'),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
      ),
      const Text('Influence'),
    ]);
  }
}

class DeckAgendaStat extends ConsumerWidget {
  const DeckAgendaStat({
    required this.deckValidator,
    super.key,
  });

  final DeckValidator deckValidator;

  static bool visible(DeckValidator deckValidator) => deckValidator.deck.side.code == 'corp';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final agendaPoints = deckValidator.agendaPoints;
    final minAgendaPoints = deckValidator.minAgendaPoints;
    final maxAgendaPoints = deckValidator.maxAgendaPoints;
    final hasError = deckValidator.agendaError != null;
    return Column(children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$agendaPoints',
              style: TextStyle(color: hasError ? theme.colorScheme.error : null),
            ),
            const TextSpan(text: ' / '),
            TextSpan(text: '$minAgendaPoints - $maxAgendaPoints'),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
      ),
      const Text('Agenda Points'),
    ]);
  }
}

class DeckSizeStat extends ConsumerWidget {
  const DeckSizeStat({
    required this.deckValidator,
    super.key,
  });

  final DeckValidator deckValidator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final deckSize = deckValidator.deckSize;
    final minDeckSize = deckValidator.minDeckSize ?? 0;
    final hasError = deckValidator.deckSizeError != null;
    return Column(children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$deckSize',
              style: TextStyle(color: hasError ? theme.colorScheme.error : null),
            ),
            const TextSpan(text: ' / '),
            TextSpan(text: '$minDeckSize'),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
      ),
      const Text('Deck Size'),
    ]);
  }
}

class DeckMwlPointsStat extends ConsumerWidget {
  const DeckMwlPointsStat({
    required this.deckValidator,
    super.key,
  });

  static bool visible(DeckValidator deckValidator) => deckValidator.deck.mwl?.points(deckValidator.deck.side) != null;

  final DeckValidator deckValidator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final points = deckValidator.mwlPoints;
    final maxPoints = deckValidator.maxMwlPoints;
    final hasError = deckValidator.mwlPointsError != null;
    return Column(children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$points',
              style: TextStyle(color: hasError ? theme.colorScheme.error : null),
            ),
            const TextSpan(text: ' / '),
            TextSpan(text: '$maxPoints'),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
      ),
      const Text('MWL Points'),
    ]);
  }
}

class DeckStats extends ConsumerWidget {
  const DeckStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorResultProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DeckSizeStat(deckValidator: deckValidator),
          if (DeckAgendaStat.visible(deckValidator)) DeckAgendaStat(deckValidator: deckValidator),
          DeckInfluenceStat(deckValidator: deckValidator),
          if (DeckMwlPointsStat.visible(deckValidator)) DeckMwlPointsStat(deckValidator: deckValidator),
        ].seperatedBy(const VerticalDivider(color: Colors.black, width: 16)).toList(),
      ),
    );
  }
}

class DeckErrors extends ConsumerWidget {
  const DeckErrors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorResultProvider);
    final allErrors = [
      ...deckValidator.allErrors,
    ];
    if (allErrors.isEmpty) return const SizedBox.shrink();

    return MaterialBanner(
      padding: const EdgeInsets.all(4),
      content: ListTile(
        title: Text(
          allErrors.join('\n'),
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      actions: const [
        SizedBox.shrink(),
      ],
    );
  }
}

class DeckTags extends ConsumerWidget {
  const DeckTags({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final tagList = ref.watch(deckProvider.select((value) => value.value.tags));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ChipsInput<String>(
        initialValue: tagList,
        decoration: const InputDecoration(
          labelText: 'Tags',
        ),
        findSuggestions: (query) async {
          final foundTags = await db.listDistinctDeckTags(where: (deckTag, deck) {
            return deckTag.tag.equals(query) | deckTag.tag.lower().contains(query.toLowerCase());
          }).get();
          final validQuery = query.isNotEmpty && !query.contains(' ') && foundTags.none((result) => result == query);
          return [
            if (validQuery) query,
            ...foundTags,
          ];
        },
        onChanged: (data) {
          final deck = ref.read(deckProvider);
          deck.unsaved = deck.value.copyWith(
            tags: data,
          );
        },
        chipBuilder: (context, state, tag) {
          return InputChip(
            label: Text(tag),
            onDeleted: () => state.deleteChip(tag),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
        optionsViewBuilder: (context, onSelected, tags) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  final String tag = tags.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(tag),
                    child: Material(
                      color: index == 0 ? Theme.of(context).selectedRowColor : null,
                      child: ListTile(title: Text(tag)),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DeckSyncStatus extends ConsumerWidget {
  const DeckSyncStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncIssues = ref.watch(deckValidatorResultProvider.select((value) => value.deck.syncIssues()));
    if (syncIssues == SyncIssues.both) {
      return MaterialBanner(
        content: const Text('Deck has changes to upload and download'),
        leading: const Icon(Icons.error, color: Colors.red),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierResult>(
                context: context,
                barrierDismissible: false,
                builder: (context) => SaveDeckDialog.withOverrides(
                  deck: deckNotifier.value,
                  state: SaveDialogState.saveRemote,
                ),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            },
            child: const Text('Upload'),
          ),
          TextButton(
            onPressed: () async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierResult>(
                context: context,
                barrierDismissible: false,
                builder: (context) => DownloadDeckDialog.withOverrides(deck: deckNotifier.value),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            },
            child: const Text('Download'),
          ),
        ],
      );
    } else if (syncIssues == SyncIssues.remote) {
      return MaterialBanner(
        content: const Text('Deck has changes to download'),
        leading: const Icon(Icons.warning, color: Colors.red),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierResult>(
                context: context,
                barrierDismissible: false,
                builder: (context) => DownloadDeckDialog.withOverrides(deck: deckNotifier.value),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            },
            child: const Text('Download'),
          ),
        ],
      );
    } else if (syncIssues == SyncIssues.local) {
      return MaterialBanner(
        content: const Text('Deck has changes to upload'),
        leading: const Icon(Icons.sync, color: Colors.amber),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final deckNotifier = ref.read(deckProvider);
              final result = await showDialog<DeckNotifierResult>(
                context: context,
                barrierDismissible: false,
                builder: (context) => SaveDeckDialog.withOverrides(
                  deck: deckNotifier.value,
                  state: SaveDialogState.saveRemote,
                ),
              );
              if (result == null) return;

              deckNotifier.saved = result;
            },
            child: const Text('Upload'),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class DeckCardTile extends ConsumerWidget {
  const DeckCardTile({
    required this.index,
    required this.card,
    required this.cardGalleryRoute,
    super.key,
  });

  final int index;
  final CardResult card;
  final RestorableRouteFuture<CardGalleryResult> cardGalleryRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faction = ref.watch(deckValidatorResultProvider.select((value) {
      return value.deck.faction;
    }));
    final count = ref.watch(deckValidatorResultProvider.select((value) {
      return value.deck.cards[card] ?? 0;
    }));
    final cardError = ref.watch(deckValidatorResultProvider.select((value) {
      return value.cardErrorList[card];
    }));
    final mwlCard = ref.watch(deckValidatorResultProvider.select((value) {
      return value.mwlCardMap[card.card.title];
    }));
    return CardTile(
      card,
      key: ValueKey(card.code),
      faction: faction,
      error: cardError,
      mwlCard: mwlCard,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            IconButton(
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.remove_outlined),
              onPressed: () {
                final deck = ref.read(deckProvider);
                deck.decCard(card, keep: true);
              },
            ),
          Text('$count'),
          IconButton(
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              final deck = ref.read(deckProvider);
              deck.incCard(card);
            },
          ),
        ],
      ),
      onTap: () async {
        final identity = ref.read(deckValidatorResultProvider).deck.toCard();
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        final deckCards = ref.read(deckProvider).value.cards;
        cardGalleryRoute.present(CardGalleryArguments(
          items: GroupedCardCodeList.fromCardResult(HeaderList([
            HeaderItems(
              identity.type.name,
              [identity],
            ),
            ...groupedCardList
          ])),
          index: index + 1,
          deckCards: deckCards,
        ).toJson());
      },
    );
  }
}
