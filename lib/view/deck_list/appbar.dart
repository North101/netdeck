import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import 'appbar/search_appbar.dart';
import 'appbar/selected_appbar.dart';
import 'appbar/standard_appbar.dart';

class DeckListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DeckListAppBar({
    this.automaticallyImplyLeading = true,
    required this.title,
    this.color,
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final bool automaticallyImplyLeading;
  final String title;
  final Color? color;

  @override
  final Size preferredSize;

  @override
  Widget build(context, ref) {
    final isSelected = ref.watch(selectedDecksProvider.select((value) => value.isNotEmpty));
    final isSearching = ref.watch(filterSearchingProvider);
    if (isSelected) {
      return const DeckSelectedAppBar();
    } else if (isSearching) {
      return DeckSearchAppBar();
    }
    return DeckStandardAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      color: color,
    );
  }
}
