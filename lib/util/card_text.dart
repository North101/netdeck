import 'dart:ui';

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
  factory CardInfluenceSpan(CardResult card, {FactionData? faction, MwlCardTitleData? mwlCard, TextStyle? style}) {
    final factionCost = mwlCard?.universalFactionCost ?? (card.faction == faction ? 0 : card.card.factionCost);
    return CardInfluenceSpan._(
      children: [
        TextSpan(text: '●' * factionCost),
        TextSpan(text: '○' * (5 - factionCost)),
      ],
      style: (style ?? const TextStyle()).copyWith(color: card.faction.color),
    );
  }

  const CardInfluenceSpan._({super.children, super.style});
}

class CardPointsSpan extends TextSpan {
  factory CardPointsSpan(MwlCardTitleData mwlCard, {TextStyle? style}) {
    final points = mwlCard.points;
    if (points == null) return const CardPointsSpan._(children: [], style: TextStyle());

    return CardPointsSpan._(
      children: [
        TextSpan(text: '●' * points),
        TextSpan(text: '○' * (3 - points)),
      ],
      style: style ?? const TextStyle(),
    );
  }

  const CardPointsSpan._({super.children, super.style});
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
          TextScaledSpan((context, height) => Assets.images.link.image(height: height)),
        ]),
      if (card.card.influenceLimit != null || card.card.minimumDeckSize != null)
        TextSpan(text: '${card.card.minimumDeckSize ?? 0} / ${card.card.influenceLimit ?? "∞"}'),
      if (card.card.cost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.cost}'),
          TextScaledSpan((context, height) => Assets.images.credit.image(height: height)),
        ]),
      if (card.card.trashCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.trashCost}'),
          TextScaledSpan((context, height) => Assets.images.trash.image(height: height)),
        ]),
      if (card.card.memoryCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.memoryCost}'),
          TextScaledSpan((context, height) => Assets.images.mu.image(height: height)),
        ]),
      if (card.card.strength != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.strength}'),
          TextScaledSpan((context, height) => Assets.images.strength.image(height: height)),
        ]),
      if (card.card.advancementCost != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.advancementCost}'),
          TextScaledSpan((context, height) => Assets.images.credit.image(height: height)),
        ]),
      if (card.card.agendaPoints != null)
        TextSpan(children: [
          TextSpan(text: '${card.card.agendaPoints}'),
          TextScaledSpan((context, height) => Assets.images.agenda.image(height: height)),
        ]),
    ].seperatedBy(const TextSpan(text: ', ')).toList(),
  );
}

class CloseAngleBracketParser extends TextParser {
  CloseAngleBracketParser(super.text, this.tag);

  final String tag;

  InlineSpan toSpan(List<InlineSpan> children) {
    switch (tag) {
      case 'trace':
      case 'strong':
        return TextSpan(
          children: children,
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
      case 'i':
      case 'errata':
      case 'em':
        return TextSpan(
          children: children,
          style: const TextStyle(fontStyle: FontStyle.italic),
        );
      case 'ul':
        return TextSpan(children: children);
      case 'li':
        return TextSpan(
          children: [
            const TextSpan(text: '\n'),
            const TextSpan(text: '•'),
            ...children,
          ],
        );
    }

    return TextSpan(children: [
      TextSpan(text: '<$tag>'),
      ...children,
      TextSpan(text: '</$tag>'),
    ]);
  }

  @override
  InlineSpan parse() {
    while (text.next()) {
      final c = text.current;
      if (c == '<') {
        flush();
        if (text.substring(text.index + tag.length + 3) == '</$tag>') {
          text.index += tag.length + 2;
          return toSpan(children);
        } else {
          final parser = OpenAngleBracketParser(text);
          children.add(parser.parse());
        }
      } else if (c == '[') {
        flush();
        final parser = SquareBracketParser(text);
        children.add(parser.parse());
      } else {
        buffer.write(c);
      }
    }

    flush();
    return TextSpan(children: [
      TextSpan(text: '<$tag>'),
      ...children,
    ]);
  }
}

class OpenAngleBracketParser extends TextParser {
  OpenAngleBracketParser(super.text);

  @override
  InlineSpan parse() {
    while (text.next()) {
      final c = text.current;
      if (c == '>') {
        final tag = buffer.toString();
        final parser = CloseAngleBracketParser(text, tag);
        return parser.parse();
      } else {
        buffer.write(c);
      }
    }
    flush();
    return TextSpan(children: [
      const TextSpan(text: '<'),
      ...children,
    ]);
  }
}

class SquareBracketParser extends TextParser {
  SquareBracketParser(super.text);

  InlineSpan toSpan(String value) {
    if (value == 'X' || int.tryParse(value) != null) {
      return TextSpan(text: value, style: const TextStyle(fontFeatures: [FontFeature.superscripts()]));
    }
    switch (value) {
      case 'adam':
        return TextScaledSpan((context, height) => Assets.images.adam.image(height: height));
      case 'agenda':
        return TextScaledSpan((context, height) => Assets.images.agenda.image(height: height));
      case 'anarch':
        return TextScaledSpan((context, height) => Assets.images.anarch.image(height: height));
      case 'apex':
        return TextScaledSpan((context, height) => Assets.images.apex.image(height: height));
      case 'click':
        return TextScaledSpan((context, height) => Assets.images.click.image(height: height));
      case 'credit':
        return TextScaledSpan((context, height) => Assets.images.credit.image(height: height));
      case 'credits':
        return TextScaledSpan((context, height) => Assets.images.credit.image(height: height));
      case 'criminal':
        return TextScaledSpan((context, height) => Assets.images.criminal.image(height: height));
      case 'haas-bioroid':
        return TextScaledSpan((context, height) => Assets.images.haasBioroid.image(height: height));
      case 'interrupt':
        return TextScaledSpan((context, height) => Assets.images.interrupt.image(height: height));
      case 'jinteki':
        return TextScaledSpan((context, height) => Assets.images.jinteki.image(height: height));
      case 'link':
        return TextScaledSpan((context, height) => Assets.images.link.image(height: height));
      case 'mu':
        return TextScaledSpan((context, height) => Assets.images.mu.image(height: height));
      case 'nbn':
        return TextScaledSpan((context, height) => Assets.images.nbn.image(height: height));
      case 'neutral-corp':
        return TextScaledSpan((context, height) => Assets.images.neutralCorp.image(height: height));
      case 'neutral-runner':
        return TextScaledSpan((context, height) => Assets.images.neutralRunner.image(height: height));
      case 'recurring-credit':
        return TextScaledSpan((context, height) => Assets.images.recurringCredit.image(height: height));
      case 'rez':
        return TextScaledSpan((context, height) => Assets.images.rez.image(height: height));
      case 'shaper':
        return TextScaledSpan((context, height) => Assets.images.shaper.image(height: height));
      case 'strength':
        return TextScaledSpan((context, height) => Assets.images.strength.image(height: height));
      case 'subroutine':
        return TextScaledSpan((context, height) => Assets.images.subroutine.image(height: height));
      case 'sunny-lebeau':
        return TextScaledSpan((context, height) => Assets.images.sunnyLebeau.image(height: height));
      case 'trash':
        return TextScaledSpan((context, height) => Assets.images.trash.image(height: height));
      case 'weyland-consortium':
        return TextScaledSpan((context, height) => Assets.images.weylandConsortium.image(height: height));
    }
    return TextSpan(text: '[$value]');
  }

  @override
  InlineSpan parse() {
    while (text.next()) {
      final c = text.current;
      if (c == ']') {
        return toSpan(buffer.toString());
      } else {
        buffer.write(c);
      }
    }

    flush();
    return TextSpan(children: [
      const TextSpan(text: '['),
      ...children,
    ]);
  }
}

class TextParser {
  TextParser(this.text);

  final TextIterator text;
  final StringBuffer buffer = StringBuffer();
  final children = <InlineSpan>[];

  void flush() {
    if (buffer.isEmpty) return;

    children.add(TextSpan(text: buffer.toString()));
    buffer.clear();
  }

  InlineSpan parse() {
    while (text.next()) {
      final c = text.current;
      if (c == '[') {
        flush();
        final parser = SquareBracketParser(text);
        children.add(parser.parse());
      } else if (c == '<') {
        flush();
        final parser = OpenAngleBracketParser(text);
        children.add(parser.parse());
      } else {
        buffer.write(c);
      }
    }

    flush();
    return TextSpan(children: children);
  }
}

class TextIterator {
  TextIterator(this.text);

  final String text;
  int index = -1;

  bool next() => ++index < text.length;

  String get current => text[index];

  String substring([int? end]) => text.substring(index, end);
}
