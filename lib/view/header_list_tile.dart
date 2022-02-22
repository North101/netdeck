import 'package:flutter/material.dart';

class HeaderListTile extends StatelessWidget {
  const HeaderListTile({
    Key? key,
    required this.child,
  }) : super(key: key);

  HeaderListTile.title({
    Key? key,
    required String title,
  }) : this(
          child: ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(title),
          ),
          key: key ?? ValueKey(title),
        );

  HeaderListTile.titleCount({
    Key? key,
    required String title,
    required int count,
  }) : this.title(key: key, title: '$title ($count)');

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Theme.of(context).canvasColor,
      child: child,
    );
  }
}
