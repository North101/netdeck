import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/querybuilder.dart';
import '/providers.dart';
import '/util/filter_type.dart';
import '/view/querybuilder_autocomplete.dart';
import '/view/search_theme.dart';
import 'actions.dart';

class CardSearchAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const CardSearchAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  CardSearchAppBarState createState() => CardSearchAppBarState();
}

class CardSearchAppBarState extends ConsumerState<CardSearchAppBar> {
  final focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final value = ref.read(filterSearchProvider).value;
    controller.text = value ?? '';
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
    final subtype = db.type.createAlias('subtype');
    final theme = SearchTheme.of(context);
    final queryBuilder = ref.watch(cardQueryBuilderProvider(CardFilterState(
      card: db.card,
      pack: db.pack,
      cycle: db.cycle,
      faction: db.faction,
      side: db.side,
      type: db.type,
      subtype: subtype,
      mwlCard: db.mwlCardTitle,
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
              return TextFormField(
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
            const CardListMoreActions(),
          ],
        ),
      ),
    );
  }
}
