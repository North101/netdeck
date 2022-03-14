import 'package:flutter/material.dart';

import '/db/database.dart';

class CardTypeWidget extends StatelessWidget {
  const CardTypeWidget(this.card, {super.key});

  final CardResult card;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: card.type.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      if (card.card.keywords != null)
        const TextSpan(
          text: ': ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      if (card.card.keywords != null) TextSpan(text: card.card.keywords),
    ]));
  }
}
