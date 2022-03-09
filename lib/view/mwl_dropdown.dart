import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/providers.dart';
import 'async_value_builder.dart';

class MwlDropdown extends ConsumerWidget {
  const MwlDropdown({Key? key, required this.onChanged}) : super(key: key);

  static withOverrides({
    required FormatData? format,
    required MwlData? mwl,
    required void Function(MwlData? value) onChanged,
  }) {
    return ProviderScope(
      overrides: [
        formatProvider.overrideWithValue(format),
        mwlProvider.overrideWithValue(mwl),
      ],
      child: MwlDropdown(onChanged: onChanged),
    );
  }

  final void Function(MwlData? value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final format = ref.watch(formatProvider);
    final mwl = ref.watch(mwlProvider);
    final mwlList = ref.watch(mwlListProvider(format));
    return AsyncValueBuilder<List<MwlData>>(
      value: mwlList,
      data: (items) {
        items = [
          if (mwl != null && !items.contains(mwl)) mwl,
          ...items,
        ];
        return DropdownButtonFormField<MwlData>(
          isExpanded: true,
          value: mwl,
          decoration: const InputDecoration(
            labelText: 'Most Wanted',
          ),
          onChanged: (value) {
            FocusScope.of(context).requestFocus(FocusNode());
            onChanged(value);
          },
          selectedItemBuilder: (context) => items
              .map((item) => Row(
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
                  ))
              .toList(),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.name),
                  ))
              .toList(),
        );
      },
    );
  }
}
