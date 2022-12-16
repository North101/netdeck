import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netrunner_deckbuilder/db/database.dart';

part 'public_data.freezed.dart';
part 'public_data.g.dart';

@Freezed(fromJson: true, toJson: false)
class ApiResult with _$ApiResult {
  const factory ApiResult.unmodified(DateTime lastUpdated) = UnmodifiedApiResult;

  const factory ApiResult.modified(DateTime lastUpdated, Map<String, dynamic> data) = ModifiedApiResult;
}

@Freezed(toJson: false)
class CardApi with _$CardApi {
  const factory CardApi({
    @JsonKey(name: 'imageUrlTemplate') required String imageUrlTemplate,
    required List<CardApiData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _CardApi;

  factory CardApi.fromJson(Map<String, dynamic> json) => _$CardApiFromJson(json);
}

@Freezed(toJson: false)
class CardApiData with _$CardApiData {
  const factory CardApiData({
    required String code,
    required int deckLimit,
    required String factionCode,
    required int factionCost,
    required String? flavor,
    required String? illustrator,
    required int? influenceLimit,
    required String? keywords,
    required int? minimumDeckSize,
    required String packCode,
    required int position,
    required int quantity,
    required String sideCode,
    required String? strippedText,
    required String strippedTitle,
    required String? text,
    required String title,
    required String typeCode,
    required bool uniqueness,
    required int? baseLink,
    required int? cost,
    required int? memoryCost,
    required int? strength,
    required int? advancementCost,
    required int? agendaPoints,
    required int? trashCost,
  }) = _CardApiData;

  factory CardApiData.fromJson(Map<String, dynamic> json) => _$CardApiDataFromJson(json);
}

@Freezed(toJson: false)
class CycleApi with _$CycleApi {
  const factory CycleApi({
    @JsonKey(fromJson: CycleApi.cycleFromJson) required List<CycleData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _CycleApi;

  factory CycleApi.fromJson(Map<String, dynamic> json) => _$CycleApiFromJson(json);

  static List<CycleData> cycleFromJson(List<dynamic> data) => data.map((e) => CycleData.fromJson(e)).toList();
}

@Freezed(toJson: false)
class FactionApi with _$FactionApi {
  const factory FactionApi({
    required List<FactionApiData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _FactionApi;

  factory FactionApi.fromJson(Map<String, dynamic> json) => _$FactionApiFromJson(json);
}

@Freezed(toJson: false)
class FactionApiData with _$FactionApiData {
  const factory FactionApiData({
    required String code,
    @JsonKey(fromJson: FactionApiData.colorFromJson) required int color,
    required bool isMini,
    required String name,
    required String sideCode,
  }) = _FactionApiData;

  factory FactionApiData.fromJson(Map<String, dynamic> json) => _$FactionApiDataFromJson(json);

  static int colorFromJson(String value) => int.parse(value, radix: 16) + 0xFF000000;
}

@Freezed(toJson: false)
class FormatApi with _$FormatApi {
  const factory FormatApi({
    required List<FormatApiData> data,
    required DateTime lastUpdated,
  }) = _FormatApi;

  factory FormatApi.fromJson(Map<String, dynamic> json) => _$FormatApiFromJson(json);
}

@Freezed(toJson: false)
class FormatApiData with _$FormatApiData {
  const factory FormatApiData({
    required String code,
    required String name,
  }) = _FormatApiData;

  factory FormatApiData.fromJson(Map<String, dynamic> json) => _$FormatApiDataFromJson(json);
}

@Freezed(toJson: false)
class PackApi with _$PackApi {
  const factory PackApi({
    @JsonKey(fromJson: PackApi.packFromJson) required List<PackData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _PackApi;

  factory PackApi.fromJson(Map<String, dynamic> json) => _$PackApiFromJson(json);

  static List<PackData> packFromJson(List<dynamic> data) => data.map((e) => PackData.fromJson(e)).toList();
}

@Freezed(toJson: false)
class SideApi with _$SideApi {
  const factory SideApi({
    @JsonKey(fromJson: SideApi.sideFromJson) required List<SideData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _SideApi;

  factory SideApi.fromJson(Map<String, dynamic> json) => _$SideApiFromJson(json);

  static List<SideData> sideFromJson(List<dynamic> data) => data.map((e) => SideData.fromJson(e)).toList();
}

@Freezed(toJson: false)
class TypeApi with _$TypeApi {
  const factory TypeApi({
    @JsonKey(fromJson: TypeApi.typeFromJson) required List<TypeData> data,
    required int total,
    required bool success,
    required String versionNumber,
    required DateTime lastUpdated,
  }) = _TypeApi;

  factory TypeApi.fromJson(Map<String, dynamic> json) => _$TypeApiFromJson(json);

  static List<TypeData> typeFromJson(List<dynamic> data) => data.map((e) => TypeData.fromJson(e)).toList();
}

@Freezed(toJson: false)
class RotationApi with _$RotationApi {
  const factory RotationApi({
    required List<RotationApiData> data,
    required DateTime lastUpdated,
  }) = _RotationApi;

  factory RotationApi.fromJson(Map<String, dynamic> json) => _$RotationApiFromJson(json);
}

@Freezed(toJson: false)
class RotationApiData with _$RotationApiData {
  const factory RotationApiData({
    required String code,
    required DateTime? dateStart,
    required String formatCode,
    required String name,
    required bool current,
    required bool latest,
    required List<String> rotated,
  }) = _RotationApiData;

  factory RotationApiData.fromJson(Map<String, dynamic> json) => _$RotationApiDataFromJson(json);
}

@Freezed(toJson: false)
class MwlApi with _$MwlApi {
  const factory MwlApi({
    required List<MwlApiData> data,
    required DateTime lastUpdated,
  }) = _MwlApi;

  factory MwlApi.fromJson(Map<String, dynamic> json) => _$MwlApiFromJson(json);
}

@Freezed(toJson: false)
class MwlApiData with _$MwlApiData {
  const factory MwlApiData({
    required String code,
    required String name,
    required String formatCode,
    required DateTime? dateStart,
    required bool active,
    required bool latest,
    required Map<String, MwlCardApiData> cards,
    required Map<String, MwlCardApiData> cardTitles,
    required int? runnerPoints,
    required int? corpPoints,
  }) = _MwlApiData;

  factory MwlApiData.fromJson(Map<String, dynamic> json) => _$MwlApiDataFromJson(json);
}

@Freezed(toJson: false)
class MwlCardApiData with _$MwlCardApiData {
  const factory MwlCardApiData({
    required int? globalPenalty,
    required int? universalFactionCost,
    required int? isRestricted,
    required int? points,
    required int? deckLimit,
  }) = _MwlCardApiData;

  factory MwlCardApiData.fromJson(Map<String, dynamic> json) => _$MwlCardApiDataFromJson(json);
}
