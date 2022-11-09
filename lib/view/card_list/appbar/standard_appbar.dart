import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import 'actions.dart';

class CardStandardAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CardStandardAppBar({
    required this.automaticallyImplyLeading,
    required this.title,
    this.color,
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final bool automaticallyImplyLeading;
  final String title;
  final Color? color;

  @override
  final Size preferredSize;

  void _startSearch(BuildContext context, WidgetRef ref) {
    final search = ref.read(filterSearchProvider);
    search.value = '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(color: color),
      ),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _startSearch(context, ref),
          ),
          const CardListMoreActions(),
        ],
      ),
    );
  }
}
