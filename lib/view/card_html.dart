import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '/util/assets.gen.dart';

CustomRenderMatcher errataMatcher() => (context) => context.tree.element?.localName == 'errata';
CustomRender errataRender = CustomRender.widget(widget: (context, buildChildren) {
  return Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(
      context.tree.element?.text ?? '',
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
  );
});

class CardHtmlWidget extends StatelessWidget {
  const CardHtmlWidget(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final fontSize = DefaultTextStyle.of(context).style.fontSize!;

    var data = this.data;
    final replacements = {
      '\n': '<br>',
      '[adam]': '<img src="asset:${Assets.images.adam.path}"/>',
      '[agenda]': '<img src="asset:${Assets.images.agenda.path}"/>',
      '[anarch]': '<img src="asset:${Assets.images.anarch.path}"/>',
      '[apex]': '<img src="asset:${Assets.images.apex.path}"/>',
      '[click]': '<img src="asset:${Assets.images.click.path}"/>',
      '[credit]': '<img src="asset:${Assets.images.credit.path}"/>',
      '[criminal]': '<img src="asset:${Assets.images.criminal.path}"/>',
      '[haas-bioroid]': '<img src="asset:${Assets.images.haasBioroid.path}"/>',
      '[interrupt]': '<img src="asset:${Assets.images.interrupt.path}"/>',
      '[jinteki]': '<img src="asset:${Assets.images.jinteki.path}"/>',
      '[link]': '<img src="asset:${Assets.images.link.path}"/>',
      '[mu]': '<img src="asset:${Assets.images.mu.path}"/>',
      '[nbn]': '<img src="asset:${Assets.images.nbn.path}"/>',
      '[neutral-corp]': '<img src="asset:${Assets.images.neutralCorp.path}"/>',
      '[neutral-runner]': '<img src="asset:${Assets.images.neutralRunner.path}"/>',
      '[recurring-credit]': '<img src="asset:${Assets.images.recurringCredit.path}"/>',
      '[rez]': '<img src="asset:${Assets.images.rez.path}"/>',
      '[shaper]': '<img src="asset:${Assets.images.shaper.path}"/>',
      '[signal]': '<img src="asset:${Assets.images.signal.path}"/>',
      '[subroutine]': '<img src="asset:${Assets.images.subroutine.path}"/>',
      '[sunny-lebeau]': '<img src="asset:${Assets.images.sunnyLebeau.path}"/>',
      '[trash]': '<img src="asset:${Assets.images.trash.path}"/>',
      '[weyland-consortium]': '<img src="asset:${Assets.images.weylandConsortium.path}"/>',
    };
    for (final entry in replacements.entries) {
      data = data.replaceAll(entry.key, entry.value);
    }
    return Html(
      data: data,
      customRenders: {
        errataMatcher(): errataRender,
        assetUriMatcher(): assetImageRender(height: textScaleFactor * fontSize),
      },
      style: {
        'body': Style(margin: const EdgeInsets.all(0)),
      },
    );
  }
}
