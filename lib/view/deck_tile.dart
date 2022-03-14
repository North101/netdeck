import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/db/database.dart';
import 'text_scaled_builder.dart';

class DeckTile extends StatelessWidget {
  DeckTile({
    required this.deck,
    required this.selected,
    this.trailing,
    this.selectedTags = const {},
    this.onTap,
    this.onLongPress,
    this.onTagTap,
    Key? key,
  }) : super(key: key ?? ValueKey(deck));

  final DeckFullResult deck;
  final bool selected;
  final Set<String> selectedTags;
  final Widget? trailing;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(String tag, bool selected)? onTagTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedColor: Colors.black,
      selectedTileColor: deck.faction.color.withOpacity(0.4),
      leading: deck.faction.icon?.image(height: 36),
      title: Text(deck.deck.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(deck.identity.title),
          Text.rich(TextSpan(children: [
            if (deck.deck.synced != null)
              if (deck.syncIssues() == SyncIssues.both)
                WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
                  return Icon(Icons.error, size: height, color: Colors.red);
                }))
              else if (deck.syncIssues() == SyncIssues.remote)
                WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
                  return Icon(Icons.warning, size: height, color: Colors.red);
                }))
              else if (deck.syncIssues() == SyncIssues.local)
                WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
                  return Icon(Icons.sync, size: height, color: Colors.amber);
                }))
              else
                WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
                  return Icon(Icons.sync, size: height, color: Colors.green);
                })),
            TextSpan(text: 'Updated: ${timeago.format(deck.deck.updated)}')
          ])),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Wrap(
              spacing: 2,
              runSpacing: 2,
              children: deck.tags.map((e) {
                return ChoiceChip(
                  selected: selectedTags.contains(e),
                  label: Text(e),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onSelected: (value) => onTagTap?.call(e, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      trailing: trailing,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
