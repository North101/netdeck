import 'package:flutter/material.dart';

import '/db/database.dart';
import 'card_html.dart';

class CardBodyWidget extends StatelessWidget {
  const CardBodyWidget(this.card, {Key? key}) : super(key: key);

  final CardResult card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: card.faction.color, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: CardHtmlWidget([
        if (card.card.body != null) card.card.body,
        if (card.card.flavor != null) '<i>${card.card.flavor}</i>',
        if (card.card.illustrator != null) 'Illustrated by ${card.card.illustrator}',
      ].join('<br><br>')),
    );
  }
}
