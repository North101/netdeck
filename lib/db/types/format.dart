import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'format.freezed.dart';
part 'format.g.dart';

@freezed
class FormatData with _$FormatData, FormatToColumns, DataMixin {
  const FormatData._();

  const factory FormatData({
    required int id,
    required String code,
    required String name,
  }) = _FormatData;

  factory FormatData.fromJson(Map<String, dynamic> json) => _$FormatDataFromJson(json);
}

@freezed
class FormatResult with _$FormatResult {
  const factory FormatResult({
    required FormatData format,
    required RotationViewData currentRotation,
    required MwlViewData activeMwl,
  }) = _FormatResult;

  factory FormatResult.fromJson(Map<String, dynamic> json) => _$FormatResultFromJson(json);
}
