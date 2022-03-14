import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class FormatDropdown extends ConsumerWidget {
  const FormatDropdown({required this.onChanged, super.key});

  static Widget withOverrides({
    required FormatData? format,
    required void Function(FormatResult? value)? onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
      ],
      child: FormatDropdown(onChanged: onChanged),
    );
  }

  final void Function(FormatResult? value)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final formatList = ref.watch(formatListProvider);
    return DropdownButtonFormField<FormatResult>(
      isExpanded: true,
      value: formatList.whenOrNull<FormatResult?>(
        data: (items) => items.firstWhereOrNull((e) => e.format == format),
      ),
      decoration: const InputDecoration(
        labelText: 'Format',
      ),
      onChanged: formatList.whenOrNull<void Function(FormatResult?)?>(
        data: (items) => onChanged,
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      selectedItemBuilder: formatList.maybeWhen(
        data: (items) => (context) => items
            .map(
              (item) => Row(
                children: [
                  Expanded(child: Text(item.format.name)),
                  IconButton(
                    padding: EdgeInsets.zero,
                    color: Theme.of(context).iconTheme.color,
                    iconSize: 16,
                    icon: const Icon(Icons.clear),
                    onPressed: onChanged != null ? () => onChanged!(null) : null,
                  ),
                ],
              ),
            )
            .toList(),
        orElse: () => null,
      ),
      items: formatList.maybeWhen(
        data: (items) => items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.format.name),
              ),
            )
            .toList(),
        orElse: () => const [],
      ),
    );
  }
}
