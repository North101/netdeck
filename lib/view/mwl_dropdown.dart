import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';

class MwlDropdown extends ConsumerWidget {
  const MwlDropdown({super.key, required this.onChanged});

  static Widget withOverrides({
    required FormatData? format,
    required MwlViewData? mwl,
    required void Function(MwlViewData? value)? onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
        mwlProvider.overrideWithValue(mwl),
      ],
      child: MwlDropdown(onChanged: onChanged),
    );
  }

  final void Function(MwlViewData? value)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final mwl = ref.watch(mwlProvider);
    final mwlList = ref.watch(mwlListProvider(format)).whenData((items) {
      return [
        if (mwl != null && !items.contains(mwl)) mwl,
        ...items,
      ];
    });
    return DropdownButtonFormField<MwlViewData>(
      isExpanded: true,
      value: mwl,
      decoration: const InputDecoration(
        labelText: 'Banlist',
      ),
      onChanged: mwlList.whenOrNull<void Function(MwlViewData?)?>(
        data: (items) => onChanged,
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      selectedItemBuilder: mwlList.whenOrNull(
        data: (items) => (context) => items
            .map((item) => Row(
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
                ))
            .toList(),
      ),
      items: mwlList.whenOrNull(
        data: (items) => items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item.name),
                ))
            .toList(),
      ),
    );
  }
}
