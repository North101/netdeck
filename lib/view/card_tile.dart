import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/card_text.dart';
import 'card_body.dart';
import 'card_cycle.dart';
import 'card_title.dart';

class CardTile extends ConsumerWidget {
  const CardTile(
    this.card, {
    this.logo = true,
    this.body = false,
    this.trailing,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final CardResult card;
  final bool logo;
  final bool body;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: logo ? card.faction.icon?.image(width: 36) : null,
      title: CardTitleWidget(card),
      subtitle: Column(
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
            RichText(
              textScaleFactor: 1,
              text: CardInfluenceSpan(card, style: DefaultTextStyle.of(context).style),
            ),
          if (body) CardBodyWidget(card),
          CardCycleWidget(card),
        ],
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
