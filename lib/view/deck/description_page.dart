import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/view/search_theme.dart';

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
    required DeckNotifier deck,
  }) {
    return ProviderScope(
      overrides: [
        deckProvider.overrideWithValue(deck),
      ],
      child: const DeckDescriptionPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(deckProvider);
    return Theme(
      data: SearchTheme.of(context),
      child: Scaffold(
        appBar: AppBar(title: const Text('Description')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            initialValue: deck.deck.description,
            keyboardType: TextInputType.multiline,
            expands: true,
            minLines: null,
            maxLines: null,
            autofocus: true,
            onChanged: (value) {
              final deck = ref.watch(deckProvider.notifier);
              deck.unsaved = deck.value.copyWith(
                deck: deck.value.deck.copyWith(description: value),
              );
            },
          ),
        ),
      ),
    );
  }
}