import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/querybuilder.dart';
import '/providers.dart';
import '/view/querybuilder_autocomplete.dart';
import '/view/search_theme.dart';
import 'actions.dart';

class CardSearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  CardSearchAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  final focusNode = FocusNode();
  final controller = TextEditingController();

  void _clearSearchQuery(WidgetRef ref) {
    controller.clear();
    _updateSearchQuery(ref, '');
  }

  void _updateSearchQuery(WidgetRef ref, String newQuery) {
    final cardQuery = ref.read(filterQueryProvider);
    cardQuery.value = tryParseQuery(newQuery);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final theme = SearchTheme.of(context);
    final queryBuilder = ref.watch(cardQueryBuilderProvider);
    return WillPopScope(
      onWillPop: () async {
        final isSearching = ref.read(filterSearchingProvider);
        isSearching.value = false;

        final cardQuery = ref.read(filterQueryProvider);
        cardQuery.value = null;
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
                style: theme.textTheme.headline6,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (newQuery) => _updateSearchQuery(ref, newQuery),
              );
            },
            onSelected: (Option option) => _updateSearchQuery(ref, option.replacement),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (controller.text.isEmpty) {
                  final isSearching = ref.read(filterSearchingProvider);
                  isSearching.value = false;

                  final cardQuery = ref.read(filterQueryProvider);
                  cardQuery.value = null;
                  return;
                }
                _clearSearchQuery(ref);
              },
            ),
            const CardListMoreActions(),
          ],
        ),
      ),
    );
  }
}
