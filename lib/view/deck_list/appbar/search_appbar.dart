import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/querybuilder.dart';
import '/providers.dart';
import '/view/querybuilder_autocomplete.dart';
import '/view/search_theme.dart';
import 'actions.dart';

class DeckSearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  DeckSearchAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final controller = TextEditingController();

  void _clearSearchQuery(BuildContext context, WidgetRef ref) {
    controller.clear();
    _updateSearchQuery(context, ref, '');
  }

  void _updateSearchQuery(BuildContext context, WidgetRef ref, String newQuery) {
    final cardQuery = ref.read(filterQueryProvider.state);
    cardQuery.state = tryParseQuery(newQuery);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = SearchTheme.of(context);
    final queryBuilder = ref.watch(deckQueryBuilderProvider);
    return WillPopScope(
      onWillPop: () async {
        final isSearching = ref.read(filterSearchingProvider.state);
        isSearching.state = false;

        final cardQuery = ref.read(filterQueryProvider.state);
        cardQuery.state = null;
        return false;
      },
      child: Theme(
        data: theme,
        child: AppBar(
          leading: const BackButton(),
          title: QueryBuilderAutocomplete(
            queryBuilder: queryBuilder,
            fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                autofocus: true,
                focusNode: focusNode,
                controller: controller,
                style: theme.textTheme.headline6,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (newQuery) => _updateSearchQuery(context, ref, newQuery),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (controller.text.isEmpty) {
                  Navigator.pop(context);
                  return;
                }
                _clearSearchQuery(context, ref);
              },
            ),
            const DeckListMoreActions(),
          ],
        ),
      ),
    );
  }
}
