import 'package:flutter/material.dart';

class TextScaledBuilder extends StatelessWidget {
  const TextScaledBuilder({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, double height) builder;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final fontSize = DefaultTextStyle.of(context).style.fontSize!;
    return builder(context, textScaleFactor * fontSize);
  }
}
