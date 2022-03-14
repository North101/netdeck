import 'package:flutter/material.dart';

int compareToChain<T>(T a, T b, Iterable<int Function(T a, T b)> comparables) {
  for (final comparable in comparables) {
    final result = comparable(a, b);
    if (result != 0) return result;
  }
  return 0;
}

final letters = List<int>.generate(26, (index) => index + 65).map((e) => String.fromCharCode(e)).toList();
bool isLetter(String value) => letters.contains(value);

final digits = List<int>.generate(10, (index) => index + 48).map((e) => String.fromCharCode(e)).toList();
bool isDigit(String value) => digits.contains(value);

RelativeRect menuPosition(BuildContext context) {
  final bar = context.findRenderObject()! as RenderBox;
  final overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
  return RelativeRect.fromRect(
    Rect.fromPoints(
      bar.localToGlobal(bar.size.topRight(Offset.zero), ancestor: overlay),
      bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
}

class SliverChildSeperatedBuilderDelegate extends SliverChildBuilderDelegate {
  SliverChildSeperatedBuilderDelegate(
    Widget? Function(BuildContext, int) builder,
    Widget? Function(BuildContext, int) separatedBy, {
    super.findChildIndexCallback,
    int? childCount,
    super.addAutomaticKeepAlives,
    super.addRepaintBoundaries,
    super.addSemanticIndexes,
    super.semanticIndexCallback,
    super.semanticIndexOffset,
  }) : super(
          (context, index) => index.isEven ? builder(context, index ~/ 2) : separatedBy(context, index ~/ 2),
          childCount: childCount != null ? childCount * 2 : 0,
        );
}