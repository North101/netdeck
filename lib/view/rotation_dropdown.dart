import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class RotationDropdown extends ConsumerWidget {
  const RotationDropdown({Key? key, required this.onChanged}) : super(key: key);

  static withOverrides({
    required FormatData? format,
    required RotationData? rotation,
    required void Function(RotationData? value) onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
        rotationProvider.overrideWithValue(rotation),
      ],
      child: RotationDropdown(onChanged: onChanged),
    );
  }

  final void Function(RotationData? value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final rotation = ref.watch(rotationProvider);
    final rotationList = ref.watch(rotationListProvider(format));
    return rotationList.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) => Text(error.toString()),
      data: (items) => DropdownButtonFormField<RotationData>(
        isExpanded: true,
        value: items.firstWhereOrNull((e) => e == rotation),
        decoration: const InputDecoration(
          labelText: 'Rotation',
        ),
        onChanged: (value) {
          FocusScope.of(context).requestFocus(FocusNode());
          onChanged(value);
        },
        selectedItemBuilder: (context) {
          return [
            ...items.map(
              (item) => Row(
                children: [
                  Expanded(child: Text(item.name)),
                  IconButton(
                    padding: EdgeInsets.zero,
                    color: Theme.of(context).iconTheme.color,
                    iconSize: 16,
                    icon: const Icon(Icons.clear),
                    onPressed: () => onChanged(null),
                  ),
                ],
              ),
            ),
          ];
        },
        items: [
          ...items.map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item.name),
            ),
          ),
        ],
      ),
    );
  }
}
