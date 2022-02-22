import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import 'stream_builder_wrapper.dart';

class FilterTagsPage extends ConsumerWidget {
  const FilterTagsPage({Key? key}) : super(key: key);

  static withOverrides({
    required StateController<Set<String>> tags,
  }) {
    return ProviderScope(
      overrides: [
        filterTagsProvider.overrideWithValue(tags),
      ],
      child: const FilterTagsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);
    final tagList = db.listDistinctDeckTags().watch();
    final tags = ref.watch(filterTagsProvider.state);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Tags')),
      body: tagList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (items) {
          return ListView(
            children: [
              ...items.map(
                (tag) => CheckboxListTile(
                  tristate: true,
                  value: tags.state.contains(tag),
                  title: Text(tag),
                  onChanged: (selected) {
                    tags.state = {
                      ...tags.state.where((e) => e != tag),
                      if (selected == true) tag,
                    };
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
