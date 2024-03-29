import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class RotationDropdown extends ConsumerWidget {
  const RotationDropdown({super.key, required this.onChanged});

  static Widget withOverrides({
    required FormatData? format,
    required RotationViewData? rotation,
    required void Function(RotationViewData? value)? onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
        rotationProvider.overrideWithValue(rotation),
      ],
      child: RotationDropdown(onChanged: onChanged),
    );
  }

  final void Function(RotationViewData? value)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final rotation = ref.watch(rotationProvider);
    final rotationList = ref.watch(rotationListProvider(format));
    return DropdownButtonFormField<RotationViewData>(
      isExpanded: true,
      value: rotationList.whenOrNull<RotationViewData?>(
        data: (items) => items.firstWhereOrNull((e) => e == rotation),
      ),
      decoration: const InputDecoration(
        labelText: 'Rotation',
      ),
      onChanged: rotationList.whenOrNull<void Function(RotationViewData?)?>(
        data: (items) => onChanged,
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      selectedItemBuilder: rotationList.whenOrNull(
        data: (items) => (context) {
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
                    onPressed: onChanged != null ? () => onChanged!(null) : null,
                  ),
                ],
              ),
            ),
          ];
        },
      ),
      items: rotationList.whenOrNull(
        data: (items) => [
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
