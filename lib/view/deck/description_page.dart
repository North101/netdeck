import 'package:flutter/material.dart';

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

class DeckDescriptionPage extends StatefulWidget {
  const DeckDescriptionPage({required this.description, super.key});

  final String description;

  @override
  DeckDescriptionPageState createState() => DeckDescriptionPageState();
}

class DeckDescriptionPageState extends State<DeckDescriptionPage> with RestorationMixin {
  late RestorableTextEditingController controller = RestorableTextEditingController(text: widget.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(controller.value.text);
        return false;
      },
      child: Theme(
        data: SearchTheme.of(context),
        child: Scaffold(
          appBar: AppBar(title: const Text('Description')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: controller.value,
              keyboardType: TextInputType.multiline,
              expands: true,
              minLines: null,
              maxLines: null,
              autofocus: true,
            ),
          ),
        ),
      ),
    );
  }

  @override
  String? restorationId = 'deck_description_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(controller, 'controller');
  }
}
