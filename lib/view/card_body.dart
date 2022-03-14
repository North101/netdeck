import 'package:flutter/material.dart';

import '/db/database.dart';
import '/util/card_text.dart';
import '/util/extensions.dart';

class CardBodyWidget extends StatelessWidget {
  const CardBodyWidget(this.card, {super.key});

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
      child: Text.rich(TextSpan(
        children: [
          if (card.card.body != null) TextParser(TextIterator(card.card.body!)).parse(),
          if (card.card.flavor != null) TextParser(TextIterator('<i>${card.card.flavor!}</i>')).parse(),
          if (card.card.illustrator != null)
            TextParser(TextIterator('Illustrated by ${card.card.illustrator!}')).parse(),
        ].seperatedBy(const TextSpan(text: '\n\n')).toList(),
      )),
    );
  }
}
