import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import 'appbar/search_appbar.dart';
import 'appbar/standard_appbar.dart';

class CardListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CardListAppBar({
    this.automaticallyImplyLeading = true,
    required this.title,
    this.color,
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final bool automaticallyImplyLeading;
  final String title;
  final Color? color;

  @override
  final Size preferredSize;

  @override
  Widget build(context, ref) {
    final isSearching = ref.watch(filterSearchingProvider);
    if (isSearching) return const CardSearchAppBar();

    return CardStandardAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      color: color,
    );
  }
}
