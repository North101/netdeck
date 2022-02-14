import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/db/database.dart';

class DeckDescriptionRoute<T> extends PageRoute<T> {
  DeckDescriptionRoute(this.child);

  final Widget child;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      child;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class DeckDescriptionPage extends ConsumerWidget {
  const DeckDescriptionPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<DeckResult> deck,
  }) {
    return ProviderScope(
      overrides: [
        deckProvider.overrideWithValue(deck),
      ],
      child: const DeckDescriptionPage(),
    );
  }

  ThemeData theme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        titleTextStyle: theme.textTheme.headline6?.copyWith(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.inputDecorationTheme.hintStyle,
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider.state);
    return Theme(
      data: theme(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Description')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            initialValue: deck.state.deck.description,
            keyboardType: TextInputType.multiline,
            expands: true,
            minLines: null,
            maxLines: null,
            autofocus: true,
            onChanged: (value) {
              deck.state = deck.state.copyWith(
                deck: deck.state.deck.copyWith(description: value),
              );
            },
          ),
        ),
      ),
    );
  }
}