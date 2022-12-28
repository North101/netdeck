import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class SettingsData with _$SettingsData, SettingsToColumns, DataMixin {
  const SettingsData._();

  const factory SettingsData({
    required bool id,
    required String? filterFormatCode,
    required String? filterRotationCode,
    required String? filterMwlCode,
    required bool filterCollection,
    required CardSort cardSort,
    required CardGroup cardGroup,
    required DeckSort deckSort,
    required DeckGroup deckGroup,
    required CardSort deckCardSort,
    required CardGroup deckCardGroup,
    required CardSort compareCardSort,
    required bool apexResources,
    required CardGalleryPageView cardGalleryView,
  }) = _SettingsData;

  const factory SettingsData.result({
    required bool id,
    required String? filterFormatCode,
    required String? filterRotationCode,
    required String? filterMwlCode,
    required bool filterCollection,
    required CardSort cardSort,
    required CardGroup cardGroup,
    required DeckSort deckSort,
    required DeckGroup deckGroup,
    required CardSort deckCardSort,
    required CardGroup deckCardGroup,
    required CardSort compareCardSort,
    required bool apexResources,
    required CardGalleryPageView cardGalleryView,
    required FormatData? filterFormat,
    required RotationViewData? filterRotation,
    required MwlViewData? filterMwl,
  }) = SettingsResult;

  factory SettingsData.fromJson(Map<String, dynamic> json) => _$SettingsDataFromJson(json);
}
