import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/querybuilder.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/querybuilder_autocomplete.dart';
import '/view/search_theme.dart';
import 'actions.dart';

class DeckSearchAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const DeckSearchAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  DeckSearchAppBarState createState() => DeckSearchAppBarState();
}

class DeckSearchAppBarState extends ConsumerState<DeckSearchAppBar> {
  final focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final query = ref.read(filterSearchProvider).value;
    controller.text = query ?? '';
  }

  void _clearSearchQuery() {
    controller.clear();
    _updateSearchQuery('');
  }

  void _updateSearchQuery(String newQuery) {
    final search = ref.read(filterSearchProvider);
    search.value = newQuery;
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(dbProvider);
    final theme = SearchTheme.of(context);
    final queryBuilder = ref.watch(deckQueryBuilderProvider(DeckFilterState(
      deck: db.deck,
      identity: db.card.createAlias('identity'),
      cycle: db.cycle,
      pack: db.pack,
      faction: db.faction,
      side: db.side,
      type: db.type,
      subtype: db.type.createAlias('subtype'),
      format: db.format,
      rotation: db.rotationView,
      mwl: db.mwlView,
    )));
    return WillPopScope(
      onWillPop: () async {
        final search = ref.read(filterSearchProvider);
        search.value = null;
        return false;
      },
      child: Theme(
        data: theme,
        child: AppBar(
          leading: const BackButton(),
          title: QueryBuilderAutocomplete(
            db: db,
            focusNode: focusNode,
            textEditingController: controller,
            queryBuilder: queryBuilder,
            fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                autofocus: true,
                focusNode: focusNode,
                controller: controller,
                style: theme.textTheme.titleLarge,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: _updateSearchQuery,
              );
            },
            onSelected: (Option option) => _updateSearchQuery(option.replacement),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (controller.text.isEmpty) {
                  final search = ref.read(filterSearchProvider);
                  search.value = null;
                  return;
                }
                _clearSearchQuery();
              },
            ),
            const DeckListMoreActions(),
          ],
        ),
      ),
    );
  }
}
