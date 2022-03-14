import '/util/assets.gen.dart';
import '/db/database.dart';

const factionOrder = [
  'anarch',
  'criminal',
  'shaper',
  'neutral-runner',
  'haas-bioroid',
  'jinteki',
  'nbn',
  'weyland-consortium',
  'neutral-corp',
];

final factionIcon = {
  'adam': Assets.images.adam,
  'anarch': Assets.images.anarch,
  'apex': Assets.images.apex,
  'criminal': Assets.images.criminal,
  'haas-bioroid': Assets.images.haasBioroid,
  'jinteki': Assets.images.jinteki,
  'nbn': Assets.images.nbn,
  'neutral-corp': Assets.images.neutralCorp,
  'neutral-runner': Assets.images.neutralRunner,
  'shaper': Assets.images.shaper,
  'sunny-lebeau': Assets.images.sunnyLebeau,
  'weyland-consortium': Assets.images.weylandConsortium,
};

extension FactionDataEx on FactionData {
  int get order => factionOrder.indexOf(code);

  AssetGenImage? get icon => factionIcon[code];
}
