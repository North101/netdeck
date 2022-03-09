import 'package:chips_input/chips_input.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart' hide Card;
import '/providers.dart';
import '/util/extensions.dart';
import '/util/header_list.dart';
import '/view/async_value_builder.dart';
import '/view/card_gallery_page.dart';
import '/view/card_tile.dart';
import '/view/fab_spacer.dart';
import '/view/format_dropdown.dart';
import '/view/header_list_tile.dart';
import '/view/mwl_dropdown.dart';
import '/view/rotation_dropdown.dart';
import 'appbar.dart';
import 'description_page.dart';
import 'util.dart';

class DeckBody extends ConsumerWidget {
  const DeckBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    return AsyncValueBuilder<HeaderList<CardResult>>(
      value: groupedCardList,
      data: (groupedCardList) => LayoutBuilder(
        builder: (context, constraints) => CustomScrollView(slivers: [
          DeckAppBar(constraints: constraints),
          const SliverList(
            delegate: SliverChildListDelegate.fixed([
              DeckSyncStatus(),
              DeckErrors(),
              DeckStats(),
              DeckIdentity(),
              DeckNameField(),
              DeckDescriptionField(),
              DeckTags(),
              DeckFormatDropdown(),
              DeckRotationDropdown(),
              DeckMwlDropdown(),
            ]),
          ),
          ...groupedCardList.skip(1).map((e) => DeckCardHeader(groupedCardList.sumUntilItem(e), e)),
          const SliverList(delegate: SliverChildListDelegate.fixed([FloatingActionButtonSpacer()])),
        ]),
      ),
    );
  }
}

class DeckNameField extends ConsumerWidget {
  const DeckNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        initialValue: deck.deck.name,
        decoration: const InputDecoration(labelText: 'Name'),
        onChanged: (value) {
          final deck = ref.read(deckProvider.notifier);
          deck.value = deck.value.copyWith(
            deck: deck.value.deck.copyWith(name: value),
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

class DeckDescriptionField extends ConsumerWidget {
  const DeckDescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: TextEditingController(text: deck.deck.description.replaceAll('\n', ' ')),
        focusNode: AlwaysDisabledFocusNode(),
        decoration: const InputDecoration(labelText: 'Description'),
        readOnly: true,
        onTap: () {
          final deck = ref.read(deckProvider.notifier);
          Navigator.of(context).push(DeckDescriptionRoute(DeckDescriptionPage.withOverrides(
            deck: deck,
          )));
        },
      ),
    );
  }
}

class DeckFormatDropdown extends ConsumerWidget {
  const DeckFormatDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FormatDropdown.withOverrides(
        format: deck.format,
        onChanged: (value) {
          final deck = ref.read(deckProvider.notifier);
          deck.value = deck.value.copyWith(
            format: drift.Value(value?.format),
            rotation: drift.Value(value?.let((e) => e.currentRotation) ?? deck.value.rotation),
            mwl: drift.Value(value?.let((e) => e.activeMwl) ?? deck.value.mwl),
          );
        },
      ),
    );
  }
}

class DeckRotationDropdown extends ConsumerWidget {
  const DeckRotationDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RotationDropdown.withOverrides(
        format: deck.format,
        rotation: deck.rotation,
        onChanged: (value) {
          final deck = ref.read(deckProvider.notifier);
          deck.value = deck.value.copyWith(
            rotation: drift.Value(value),
          );
        },
      ),
    );
  }
}

class DeckMwlDropdown extends ConsumerWidget {
  const DeckMwlDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MwlDropdown.withOverrides(
        format: deck.format,
        mwl: deck.mwl,
        onChanged: (value) {
          final deck = ref.read(deckProvider.notifier);
          deck.value = deck.value.copyWith(
            mwl: drift.Value(value),
          );
        },
      ),
    );
  }
}

class DeckIdentity extends ConsumerWidget {
  const DeckIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return CardTile(
      deck.toCard(),
      key: ValueKey(deck),
      logo: false,
      body: true,
      onTap: () async {
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardGalleryPage.withOverrides(
            groupedCardList: groupedCardList,
            currentIndex: 0,
          );
        }));
      },
    );
  }
}

class DeckCardHeader extends ConsumerWidget {
  const DeckCardHeader(this.indexOffset, this.headerList, {Key? key}) : super(key: key);

  final HeaderItems<CardResult> headerList;
  final int indexOffset;

  void onTap(BuildContext context, WidgetRef ref, int index) {}

  Widget cardItemBuilder(BuildContext context, WidgetRef ref, int index, CardResult card) {
    final deck = ref.watch(deckProvider);
    final deckCardList = ref.watch(deckProvider.select((value) => value.cards));
    final count = deckCardList[card] ?? 0;
    final deckValidator = ref.watch(deckValidatorProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    final cardError = deckValidator?.cardErrorList[card];
    return CardTile(
      card,
      key: ValueKey(card),
      faction: deck.faction,
      error: cardError,
      mwlCard: deckValidator?.mwlCardMap[card.code],
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            IconButton(
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.remove_outlined),
              onPressed: () {
                final deck = ref.read(deckProvider.notifier);
                deck.decCard(card);
              },
            ),
          if (count > 0) Text('${deckCardList[card] ?? 0}'),
          IconButton(
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              final deck = ref.read(deckProvider.notifier);
              deck.incCard(card);
            },
          ),
        ],
      ),
      onTap: () async {
        final groupedCardList = await ref.read(groupedCardListProvider.future);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CardGalleryPage.withOverrides(
            groupedCardList: groupedCardList,
            currentIndex: index,
          );
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardList = ref.watch(deckProvider.select((value) => value.cards));
    final count = headerList.fold<int>(0, (value, entry) => value += (deckCardList[entry] ?? 0));
    return SliverStickyHeader(
      header: HeaderListTile.titleCount(title: headerList.header, count: count),
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

class DeckInfluenceStat extends ConsumerWidget {
  const DeckInfluenceStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorProvider);
    return deckValidator.when(
      loading: () => const SizedBox.shrink(),
      error: (error, strackTrace) => const SizedBox.shrink(),
      data: (deckValidator) {
        final theme = Theme.of(context);
        final influence = deckValidator.influence;
        final maxInfluence = deckValidator.maxInfluence;
        final hasError = deckValidator.influenceError != null;
        return Column(children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$influence',
                  style: TextStyle(color: hasError ? theme.errorColor : null),
                ),
                const TextSpan(text: ' / '),
                TextSpan(text: '${maxInfluence ?? '∞'}'),
              ],
              style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold),
            ),
            textAlign: TextAlign.center,
          ),
          const Text('Influence'),
        ]);
      },
    );
  }
}

class DeckAgendaStat extends ConsumerWidget {
  const DeckAgendaStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorProvider);
    return deckValidator.when(
      loading: () => const SizedBox.shrink(),
      error: (error, strackTrace) => const SizedBox.shrink(),
      data: (deckValidator) {
        final theme = Theme.of(context);
        final agendaPoints = deckValidator.agendaPoints;
        final minAgendaPoints = deckValidator.minAgendaPoints;
        final maxAgendaPoints = deckValidator.maxAgendaPoints;
        final hasError = deckValidator.agendaError != null;
        return Column(children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$agendaPoints',
                  style: TextStyle(color: hasError ? theme.errorColor : null),
                ),
                const TextSpan(text: ' / '),
                TextSpan(text: '$minAgendaPoints - $maxAgendaPoints'),
              ],
              style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold),
            ),
            textAlign: TextAlign.center,
          ),
          const Text('Agenda Points'),
        ]);
      },
    );
  }
}

class DeckSizeStat extends ConsumerWidget {
  const DeckSizeStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorProvider);
    return deckValidator.when(
      loading: () => const SizedBox.shrink(),
      error: (error, strackTrace) => const SizedBox.shrink(),
      data: (deckValidator) {
        final theme = Theme.of(context);
        final deckSize = deckValidator.deckSize;
        final minDeckSize = deckValidator.minDeckSize ?? 0;
        final hasError = deckValidator.deckSizeError != null;
        return Column(children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$deckSize',
                  style: TextStyle(color: hasError ? theme.errorColor : null),
                ),
                const TextSpan(text: ' / '),
                TextSpan(text: '$minDeckSize'),
              ],
              style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold),
            ),
            textAlign: TextAlign.center,
          ),
          const Text('Deck Size'),
        ]);
      },
    );
  }
}

class DeckMwlPointsStat extends ConsumerWidget {
  const DeckMwlPointsStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorProvider);
    return deckValidator.when(
      loading: () => const SizedBox.shrink(),
      error: (error, strackTrace) => const SizedBox.shrink(),
      data: (deckValidator) {
        final theme = Theme.of(context);
        final points = deckValidator.mwlPoints;
        final maxPoints = deckValidator.maxMwlPoints;
        final hasError = deckValidator.mwlPointsError != null;
        return Column(children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$points',
                  style: TextStyle(color: hasError ? theme.errorColor : null),
                ),
                const TextSpan(text: ' / '),
                TextSpan(text: '$maxPoints'),
              ],
              style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold),
            ),
            textAlign: TextAlign.center,
          ),
          const Text('MWL Points'),
        ]);
      },
    );
  }
}

class DeckStats extends ConsumerWidget {
  const DeckStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const DeckSizeStat(),
            if (deck.side.code == 'corp') const DeckAgendaStat(),
            const DeckInfluenceStat(),
            if (deck.mwl?.points(deck.side) != null) const DeckMwlPointsStat(),
          ].seperatedBy(const VerticalDivider(color: Colors.black, width: 16)).toList(),
        ),
      ),
    );
  }
}

class DeckErrors extends ConsumerWidget {
  const DeckErrors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckValidator = ref.watch(deckValidatorProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    if (deckValidator == null) return const SizedBox.shrink();

    final allErrors = [
      ...deckValidator.allErrors,
    ];
    if (allErrors.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        color: const Color(0xFFF2DEDE),
        child: ListTile(
          title: Text(allErrors.join('\n'),
              style: TextStyle(
                color: Theme.of(context).errorColor,
              )),
        ),
      ),
    );
  }
}

class DeckTags extends ConsumerWidget {
  const DeckTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final tagList = ref.watch(deckProvider.select((value) => value.tags));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ChipsInput<String>(
        initialValue: tagList,
        decoration: const InputDecoration(
          labelText: 'Tags',
        ),
        findSuggestions: (query) async {
          final foundTags = await db
              .listDistinctDeckTags(
                where: db.deckTag.tag.equals(query) | db.deckTag.tag.lower().contains(query.toLowerCase()),
              )
              .get();
          final validQuery = query.isNotEmpty && !query.contains(' ') && foundTags.none((result) => result == query);
          return [
            if (validQuery) query,
            ...foundTags,
          ];
        },
        onChanged: (data) {
          final deck = ref.read(deckProvider.notifier);
          deck.value = deck.value.copyWith(
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
  const DeckSyncStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    final syncIssues = deck.syncIssues();
    if (syncIssues == SyncIssues.both) {
      return MaterialBanner(
        content: const Text('Deck has changes to upload and download'),
        leading: const Icon(Icons.error, color: Colors.red),
        actions: <Widget>[
          TextButton(
            onPressed: () => upload(context, ref),
            child: const Text('Upload'),
          ),
          TextButton(
            onPressed: () => download(context, ref),
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
            onPressed: () => download(context, ref),
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
            onPressed: () => upload(context, ref),
            child: const Text('Upload'),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
