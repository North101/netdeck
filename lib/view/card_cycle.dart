import 'package:flutter/material.dart';

import '/db/database.dart';

class CardCycleWidget extends StatelessWidget {
  const CardCycleWidget(this.card, {Key? key}) : super(key: key);

  final CardResult card;

  @override
  Widget build(BuildContext context) {
    final buffer = <String>[
      card.faction.name,
      card.cycle.name,
      if (card.pack.name != card.cycle.name) card.pack.name,
    ];
    return Text(
      '${buffer.join(" / ")} #${card.card.position}',
      style: const TextStyle(fontSize: 12),
    );
  }
}
