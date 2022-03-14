import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import 'async_value_builder.dart';

class FilterTagsPage extends ConsumerWidget {
  const FilterTagsPage({super.key});

  static Widget withOverrides({
    required Set<String> tags,
  }) {
    return ProviderScope(
      restorationId: 'filter_tags_page',
      overrides: [
        filterTagsProvider.overrideWithValue(RestorableSet(tags), 'filterTagsProvider'),
      ],
      child: const FilterTagsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagList = ref.watch(distinctTagListProvider);
    final tags = ref.watch(filterTagsProvider);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(tags.value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Filter Tags')),
        body: AsyncValueBuilder<List<String>>(
          value: tagList,
          data: (items) {
            return ListView(
              children: [
                ...items.map(
                  (tag) => CheckboxListTile(
                    tristate: true,
                    value: tags.value.contains(tag),
                    title: Text(tag),
                    onChanged: (selected) {
                      tags.value = {
                        ...tags.value.where((e) => e != tag),
                        if (selected == true) tag,
                      };
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
