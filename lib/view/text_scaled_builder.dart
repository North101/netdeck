import 'package:flutter/material.dart';

class TextScaledBuilder extends StatelessWidget {
  const TextScaledBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, double height) builder;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final fontSize = DefaultTextStyle.of(context).style.fontSize!;
    return builder(context, textScaleFactor * fontSize);
  }
}

class TextScaledSpan extends WidgetSpan {
  TextScaledSpan(Widget Function(BuildContext context, double height) builder)
      : super(
          child: TextScaledBuilder(builder: builder),
          alignment: PlaceholderAlignment.middle,
        );
}
