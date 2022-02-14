/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get adam => const AssetGenImage('assets/images/adam.png');
  AssetGenImage get agenda => const AssetGenImage('assets/images/agenda.png');
  AssetGenImage get anarch => const AssetGenImage('assets/images/anarch.png');
  AssetGenImage get apex => const AssetGenImage('assets/images/apex.png');
  AssetGenImage get click => const AssetGenImage('assets/images/click.png');
  AssetGenImage get credit => const AssetGenImage('assets/images/credit.png');
  AssetGenImage get criminal =>
      const AssetGenImage('assets/images/criminal.png');
  AssetGenImage get haasBioroid =>
      const AssetGenImage('assets/images/haas-bioroid.png');
  AssetGenImage get interrupt =>
      const AssetGenImage('assets/images/interrupt.png');
  AssetGenImage get jinteki => const AssetGenImage('assets/images/jinteki.png');
  AssetGenImage get link => const AssetGenImage('assets/images/link.png');
  AssetGenImage get mu => const AssetGenImage('assets/images/mu.png');
  AssetGenImage get nbn => const AssetGenImage('assets/images/nbn.png');
  AssetGenImage get netrunnerdb =>
      const AssetGenImage('assets/images/netrunnerdb.png');
  AssetGenImage get neutralCorp =>
      const AssetGenImage('assets/images/neutral-corp.png');
  AssetGenImage get neutralRunner =>
      const AssetGenImage('assets/images/neutral-runner.png');
  AssetGenImage get recurringCredit =>
      const AssetGenImage('assets/images/recurring-credit.png');
  AssetGenImage get rez => const AssetGenImage('assets/images/rez.png');
  AssetGenImage get shaper => const AssetGenImage('assets/images/shaper.png');
  AssetGenImage get signal => const AssetGenImage('assets/images/signal.png');
  AssetGenImage get subroutine =>
      const AssetGenImage('assets/images/subroutine.png');
  AssetGenImage get sunnyLebeau =>
      const AssetGenImage('assets/images/sunny-lebeau.png');
  AssetGenImage get trash => const AssetGenImage('assets/images/trash.png');
  AssetGenImage get weylandConsortium =>
      const AssetGenImage('assets/images/weyland-consortium.png');
}

class $AssetsNrdbGen {
  const $AssetsNrdbGen();

  String get cards => 'assets/nrdb/cards.json';
  String get cycles => 'assets/nrdb/cycles.json';
  String get factions => 'assets/nrdb/factions.json';
  String get formats => 'assets/nrdb/formats.json';
  String get mwl => 'assets/nrdb/mwl.json';
  String get packs => 'assets/nrdb/packs.json';
  String get rotations => 'assets/nrdb/rotations.json';
  String get sides => 'assets/nrdb/sides.json';
  String get types => 'assets/nrdb/types.json';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsNrdbGen nrdb = $AssetsNrdbGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
