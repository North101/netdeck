import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/db/querybuilder.dart';

class QueryBuilderAutocomplete extends StatelessWidget {
  const QueryBuilderAutocomplete({
    required this.fieldViewBuilder,
    required this.queryBuilder,
    Key? key,
  }) : super(key: key);

  final AutocompleteFieldViewBuilder fieldViewBuilder;
  final QueryBuilder queryBuilder;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<MapEntry<String, QueryBuilder>>(
      displayStringForOption: (option) => '${option.key}:',
      fieldViewBuilder: fieldViewBuilder,
      optionsBuilder: (TextEditingValue textEditingValue) {
        final text = textEditingValue.text;
        final startOption = text
            .substring(0, textEditingValue.selection.start)
            .characters
            .toList()
            .reversed
            .takeWhile((c) => c != ':' && c != ' ')
            .toList()
            .reversed;
        final endOption =
            text.substring(textEditingValue.selection.start).characters.toList().takeWhile((c) => c != ':' && c != ' ');
        final option = startOption.followedBy(endOption).join('');
        return [
          for (final entry in queryBuilder.fields.entries)
            if (option.isEmpty || entry.key.contains(option)) entry,
          for (final entry in queryBuilder.extraFields.entries)
            if (option.isEmpty || entry.key.contains(option)) entry,
        ];
      },
      optionsViewBuilder: (context, onSelected, options) {
        return _AutocompleteOptions(
          onSelected: onSelected,
          options: options,
          maxOptionsHeight: 200,
        );
      },
    );
  }
}

class _AutocompleteOptions extends StatelessWidget {
  const _AutocompleteOptions({
    Key? key,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
  }) : super(key: key);

  final AutocompleteOnSelected<MapEntry<String, QueryBuilder>> onSelected;

  final Iterable<MapEntry<String, QueryBuilder>> options;
  final double maxOptionsHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              dense: true,
              enabled: false,
              title: Text('Advanced Search'),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxOptionsHeight),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option),
                    child: Builder(builder: (BuildContext context) {
                      final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                      if (highlight) {
                        SchedulerBinding.instance!.addPostFrameCallback((Duration timeStamp) {
                          Scrollable.ensureVisible(context, alignment: 0.5);
                        });
                      }
                      return ListTile(
                        dense: true,
                        title: Text('${option.key}: ${option.value.help}'),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
