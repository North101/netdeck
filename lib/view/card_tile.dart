import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/card_text.dart';
import 'card_body.dart';
import 'card_cycle.dart';
import 'card_title.dart';

class CardTile extends ConsumerWidget {
  CardTile(
    this.card, {
    this.logo = true,
    this.body = false,
    this.faction,
    this.trailing,
    this.onTap,
    this.error,
    Key? key,
  }) : super(key: key ?? ValueKey(card));

  final CardResult card;
  final bool logo;
  final bool body;
  final FactionData? faction;
  final Widget? trailing;
  final String? error;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: logo ? card.faction.icon?.image(width: 36) : null,
      title: CardTitleWidget(card),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              cardType(card),
              TextSpan(children: [
                const TextSpan(text: ' ('),
                cardInfo(card),
                const TextSpan(text: ')'),
              ]),
            ], style: DefaultTextStyle.of(context).style),
          ),
          if (card.type.code != 'identity')
            RichText(text: CardInfluenceSpan(card, faction: faction, style: DefaultTextStyle.of(context).style)),
          if (body) CardBodyWidget(card),
          CardCycleWidget(card),
          if (error != null) Text(error!, style: TextStyle(color: Theme.of(context).errorColor))
        ],
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
