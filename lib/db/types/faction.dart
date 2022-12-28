import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import '/util/assets.gen.dart';
import 'data.dart';

part 'faction.freezed.dart';
part 'faction.g.dart';

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

Color colorFromJson(int value) => Color(value);
int colorToJson(Color value) => value.value;

@freezed
class FactionData with _$FactionData, FactionToColumns, DataMixin {
  const FactionData._();

  const factory FactionData({
    required String code,
    required String sideCode,
    required String name,
    @JsonKey(fromJson: colorFromJson, toJson: colorToJson) required Color color,
    required bool isMini,
  }) = _FactionData;

  factory FactionData.fromJson(Map<String, dynamic> json) => _$FactionDataFromJson(json);

  int get order => factionOrder.indexOf(code);

  AssetGenImage? get icon => factionIcon[code];
}

@freezed
class FactionResult with _$FactionResult {
  const factory FactionResult({
    required FactionData faction,
    required SideData side,
  }) = _FactionResult;

  factory FactionResult.fromJson(Map<String, dynamic> json) => _$FactionResultFromJson(json);
}
