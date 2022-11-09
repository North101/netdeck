import 'package:flutter/material.dart';

class HeaderListTile extends StatelessWidget {
  const HeaderListTile({
    required this.child,
    super.key,
  });

  HeaderListTile.title({
    required String title,
    Key? key,
  }) : this(
          child: ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(title),
          ),
          key: key ?? ValueKey(title),
        );

  HeaderListTile.titleCount({
    required String title,
    required int count,
    Key? key,
  }) : this.title(key: key, title: '$title ($count)');

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Theme.of(context).cardColor,
      child: child,
    );
  }
}
