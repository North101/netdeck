import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netrunner_deckbuilder/db/database.dart';

import 'data.dart';

part 'cycle.freezed.dart';
part 'cycle.g.dart';

@freezed
class CycleData with _$CycleData, CycleToColumns, DataMixin {
  const CycleData._();

  const factory CycleData({
    required String code,
    required int position,
    required String name,
    required int size,
    required bool rotated,
  }) = _CycleData;

  factory CycleData.fromJson(Map<String, dynamic> json) => _$CycleDataFromJson(json);
}
