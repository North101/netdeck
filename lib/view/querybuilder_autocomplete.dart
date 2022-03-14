import 'package:flutter/material.dart'
    hide AutocompleteFieldViewBuilder, RawAutocomplete, AutocompleteOnSelected, AutocompleteHighlightedOption;
import 'package:flutter/scheduler.dart';

import '/db/database.dart';
import '/db/querybuilder.dart';
import 'autocomplete.dart';

class QueryBuilderAutocomplete extends StatelessWidget {
  const QueryBuilderAutocomplete({
    required this.db,
    required this.focusNode,
    required this.textEditingController,
    required this.fieldViewBuilder,
    required this.queryBuilder,
    this.onSelected,
    super.key,
  });

  final Database db;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final AutocompleteFieldViewBuilder fieldViewBuilder;
  final QueryBuilder queryBuilder;
  final void Function(Option option)? onSelected;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Option>(
      focusNode: focusNode,
      textEditingController: textEditingController,
      displayStringForOption: (option) => option.replacement,
      fieldViewBuilder: fieldViewBuilder,
      onSelected: onSelected,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        final text = textEditingValue.text;
        final query = tryParseQuery(textEditingValue.text);
        final position = textEditingValue.selection.base.offset;
        return await queryBuilder.options(db, text, query, position);
      },
      optionsViewBuilder: (_, onSelected, options) {
        final box = context.findRenderObject() as RenderBox?;
        final position = box?.globalToLocal(Offset.zero) ?? Offset.zero;
        return Transform.translate(
          offset: Offset(position.dx, 0),
          child: _AutocompleteOptions(
            onSelected: onSelected,
            options: options,
            maxOptionsHeight: 200,
          ),
        );
      },
    );
  }
}

class _AutocompleteOptions extends StatelessWidget {
  const _AutocompleteOptions({
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
  });

  final AutocompleteOnSelected<Option> onSelected;

  final Iterable<Option> options;
  final double maxOptionsHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SizedBox(
            height: constraints.maxHeight,
            width: MediaQuery.of(context).size.width,
            child: Align(
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
                                SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
                                  Scrollable.ensureVisible(context, alignment: 0.5);
                                });
                              }
                              return ListTile(
                                dense: true,
                                title: option.help != null
                                    ? Text.rich(TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${option.value} ',
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(text: option.help),
                                        ],
                                      ))
                                    : Text(option.value),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
