import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'mwl.freezed.dart';
part 'mwl.g.dart';

@freezed
class MwlData with _$MwlData, MwlToColumns, DataMixin {
  const MwlData._();

  const factory MwlData({
    required String code,
    required String formatCode,
    required String name,
    required DateTime? dateStart,
    required int? runnerPoints,
    required int? corpPoints,
  }) = _MwlData;

  factory MwlData.fromJson(Map<String, dynamic> json) => _$MwlDataFromJson(json);
}

@freezed
class MwlViewData with _$MwlViewData, MwlToColumns, DataMixin {
  const MwlViewData._();

  const factory MwlViewData({
    required String code,
    required String? mwlCode,
    required String formatCode,
    required String name,
    required DateTime? dateStart,
    required int? runnerPoints,
    required int? corpPoints,
    required MwlType? type,
  }) = _MwlViewData;

  factory MwlViewData.fromJson(Map<String, dynamic> json) => _$MwlViewDataFromJson(json);

  int? points(SideData side) {
    switch (side.code) {
      case 'corp':
        return corpPoints;
      case 'runner':
        return runnerPoints;
      default:
        return null;
    }
  }
}
