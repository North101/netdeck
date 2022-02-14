import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/card_gallery/page.dart';
import '/view/card_tile.dart';
import '/view/floatingactionbutton_spacer.dart';
import '/view/format_dropdown.dart';
import '/view/header_list_tile.dart';
import '/view/mwl_dropdown.dart';
import '/view/rotation_dropdown.dart';
import 'appbar.dart';
import 'description_page.dart';

class DeckBody extends ConsumerWidget {
  const DeckBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedCardList = ref.watch(groupedCardListProvider);
    return groupedCardList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (groupedCardList) => LayoutBuilder(
        builder: (context, constraints) => CustomScrollView(slivers: [
          DeckAppBar(constraints: constraints),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                DeckIdentity(),
                DeckNameField(),
                DeckDescriptionField(),
                DeckFormatDropdown(),
                DeckRotationDropdown(),
                DeckMwlDropdown(),
              ]),
            ),
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
    final deck = ref.watch(deckProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        initialValue: deck.state.deck.name,
        decoration: const InputDecoration(labelText: 'Name'),
        onChanged: (value) {
          deck.state = deck.state.copyWith(
            deck: deck.state.deck.copyWith(name: value),
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
    final deck = ref.watch(deckProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: TextEditingController(text: deck.state.deck.description.replaceAll('\n', ' ')),
        focusNode: AlwaysDisabledFocusNode(),
        decoration: const InputDecoration(labelText: 'Description'),
        readOnly: true,
        onTap: () {
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
    final deck = ref.watch(deckProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FormatDropdown.withOverrides(
        format: deck.state.format,
        onChanged: (value) {
          deck.state = deck.state.copyWith(
            format: drift.Value(value?.format),
            rotation: drift.Value(value?.let((e) => e.currentRotation) ?? deck.state.rotation),
            mwl: drift.Value(value?.let((e) => e.activeMwl) ?? deck.state.mwl),
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
    final deck = ref.watch(deckProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RotationDropdown.withOverrides(
        format: deck.state.format,
        rotation: deck.state.rotation,
        onChanged: (value) {
          deck.state = deck.state.copyWith(
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
    final deck = ref.watch(deckProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MwlDropdown.withOverrides(
        format: deck.state.format,
        mwl: deck.state.mwl,
        onChanged: (value) {
          deck.state = deck.state.copyWith(
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
      logo: false,
      body: true,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          final groupedCardList = ref.read(groupedCardListProvider);
          return CardGalleryPage.withOverrides(
            currentIndex: 0,
            groupedCardList: groupedCardList,
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deckCardList = ref.watch(deckCardListProvider.notifier);
    return SliverStickyHeader(
      header: HeaderListTile.title(title: '${headerList.header} (${headerList.length})'),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final card = headerList[index];
            final count = deckCardList.get(card);
            return CardTile(
              card,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (count > 0)
                    IconButton(
                      icon: const Icon(Icons.remove_outlined),
                      onPressed: () {
                        deckCardList.dec(card);
                        ref.refresh(cardListProvider);
                      },
                    ),
                  if (count > 0) Text('${deckCardList.get(card)}'),
                  IconButton(
                    icon: const Icon(Icons.add_outlined),
                    onPressed: () {
                      deckCardList.inc(card);
                      ref.refresh(cardListProvider);
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  final groupedCardList = ref.watch(groupedCardListProvider);
                  return CardGalleryPage.withOverrides(
                    currentIndex: indexOffset + index,
                    groupedCardList: groupedCardList,
                  );
                }));
              },
            );
          },
          childCount: headerList.length,
        ),
      ),
    );
  }
}
