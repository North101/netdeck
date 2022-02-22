import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';

class TagChip extends ConsumerWidget {
  const TagChip(this.tag, {Key? key}) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(tag),
        onDeleted: () {
          final tags = ref.read(filterTagsProvider.state);
          tags.state = tags.state = {
            ...tags.state.where((e) => e != tag),
          };
        },
      ),
    );
  }
}
