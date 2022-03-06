import 'package:flutter/material.dart';

import '/db/database.dart';
import '/util/extensions.dart';
import '/view/text_scaled_builder.dart';
import 'assets.gen.dart';

String formatText(String text, int count, int total) {
  if (count == 0) {
    return '$text (All)';
  }
  return '$text ($count / $total)';
}

class CardUniquenessSpan extends TextSpan {
  const CardUniquenessSpan() : super(text: '◆');
}

class CardInfluenceSpan extends TextSpan {
  factory CardInfluenceSpan(CardResult card, {FactionData? faction, MwlCardData? mwlCard, TextStyle? style}) {
    final factionCost = mwlCard?.universalFactionCost ?? (card.faction == faction ? 0 : card.card.factionCost);
    final points = mwlCard?.points;
    return CardInfluenceSpan._(
      [
        TextSpan(text: '●' * factionCost),
        TextSpan(text: '○' * (5 - factionCost)),
        if (points != null)
          TextSpan(
            children: [
              const TextSpan(text: ' '),
              TextSpan(text: '●' * points),
              TextSpan(text: '○' * (3 - points)),
            ],
            style: style ?? const TextStyle(),
          ),
      ],
      (style ?? const TextStyle()).copyWith(color: card.faction.color),
    );
  }

  const CardInfluenceSpan._(List<TextSpan> children, TextStyle style)
      : super(
          children: children,
          style: style,
        );
}

TextSpan cardType(CardResult card) {
  return TextSpan(
    children: [
      TextSpan(
        text: '${card.type.name}${card.card.keywords != null ? ':' : ''}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      if (card.card.keywords != null) TextSpan(text: card.card.keywords),
    ].seperatedBy(const TextSpan(text: ' ')).toList(),
  );
}

TextSpan cardInfo(CardResult card) {
  return TextSpan(
    children: [
      if (card.card.baseLink != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.baseLink}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.link.image(height: height);
          })),
        ]),
      if (card.card.influenceLimit != null || card.card.minimumDeckSize != null)
        TextSpan(text: '${card.card.minimumDeckSize ?? 0} / ${card.card.influenceLimit ?? "∞"}'),
      if (card.card.cost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.cost}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.credit.image(height: height);
          })),
        ]),
      if (card.card.trashCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.trashCost}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.trash.image(height: height);
          })),
        ]),
      if (card.card.memoryCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.memoryCost}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.mu.image(height: height);
          })),
        ]),
      if (card.card.strength != null) TextSpan(text: '${card.card.strength} Strength'),
      if (card.card.advancementCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.advancementCost}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.credit.image(height: height);
          })),
        ]),
      if (card.card.agendaPoints != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.agendaPoints}'),
          WidgetSpan(child: TextScaledBuilder(builder: (context, height) {
            return Assets.images.agenda.image(height: height);
          })),
        ]),
    ].seperatedBy(const TextSpan(text: ', ')).toList(),
  );
}

String cardCycle(CardResult card) {
  final buffer = <String>[
    card.faction.name,
    card.cycle.name,
    if (card.pack.name != card.cycle.name) card.pack.name,
  ];
  return '${buffer.join(" / ")} #${card.card.position}';
}
