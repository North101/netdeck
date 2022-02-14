import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class FormatDropdown extends ConsumerWidget {
  const FormatDropdown({Key? key, required this.onChanged}) : super(key: key);

  static withOverrides({
    required FormatData? format,
    required void Function(FormatResult? value) onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
      ],
      child: FormatDropdown(onChanged: onChanged),
    );
  }

  final void Function(FormatResult? value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final formatList = ref.watch(formatListProvider);
    return formatList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (items) => DropdownButtonFormField<FormatResult>(
        isExpanded: true,
        value: items.firstWhereOrNull((e) => e.format == format),
        decoration: const InputDecoration(
          labelText: 'Format',
        ),
        onChanged: (value) {
          FocusScope.of(context).requestFocus(FocusNode());
          onChanged(value);
        },
        selectedItemBuilder: (context) => items
            .map(
              (item) => Row(
                children: [
                  Expanded(child: Text(item.format.name)),
                  IconButton(
                    padding: EdgeInsets.zero,
                    color: Theme.of(context).iconTheme.color,
                    iconSize: 16,
                    icon: const Icon(Icons.clear),
                    onPressed: () => onChanged(null),
                  ),
                ],
              ),
            )
            .toList(),
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.format.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
