import 'package:flutter/material.dart';

import '/db/database.dart';
import 'card_html.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget(this.card, {Key? key}) : super(key: key);

  final CardResult card;

  @override
  Widget build(BuildContext context) {
    final card = this.card.card;
    final info = <String>[
      if (card.baseLink != null) '${card.baseLink}[link]',
      if (card.influenceLimit != null || card.minimumDeckSize != null)
        '${card.minimumDeckSize ?? 0} / ${card.influenceLimit ?? "∞"}',
      if (card.cost != null) '${card.cost}[credit]',
      if (card.trashCost != null) '${card.trashCost}[trash]',
      if (card.memoryCost != null) '${card.memoryCost}[mu]',
      if (card.strength != null) '${card.strength} Strength',
      if (card.advancementCost != null) '${card.advancementCost}[credit]',
      if (card.agendaPoints != null) '${card.agendaPoints}[agenda]',
    ];
    if (info.isEmpty) return const SizedBox();

    return CardHtmlWidget(info.join(' '));
  }
}
