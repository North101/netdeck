import 'package:flutter/material.dart';

import '/db/database.dart';
import '/util/card_text.dart';
import '/util/extensions.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget(this.card, {super.key});

  final CardResult card;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (card.card.uniqueness) const CardUniquenessSpan(),
          TextSpan(text: card.card.title),
        ].seperatedBy(const TextSpan(text: ' ')).toList(),
      ),
      maxLines: 3,
    );
  }
}
