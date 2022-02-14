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
          child: ListTile(title: Text(title)),
          key: key,
        );

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
