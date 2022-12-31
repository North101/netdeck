import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netrunner_deckbuilder/db/database.dart';

import 'data.dart';

part 'rotation.freezed.dart';
part 'rotation.g.dart';

@freezed
class RotationData with _$RotationData, RotationToColumns, DataMixin {
  const RotationData._();

  const factory RotationData({
    required String code,
    required String formatCode,
    required String name,
    required DateTime? dateStart,
  }) = _RotationData;

  const factory RotationData.view({
    required String code,
    required String? rotationCode,
    required String formatCode,
    required String name,
    required DateTime? dateStart,
    required String? type,
  }) = RotationViewData;

  factory RotationData.fromJson(Map<String, dynamic> json) => _$RotationDataFromJson(json);
}

@freezed
class RotationCycleData with _$RotationCycleData, RotationCycleToColumns {
  const RotationCycleData._();

  const factory RotationCycleData({
    required String rotationCode,
    required String cycleCode,
  }) = _RotationCycleData;

  factory RotationCycleData.fromJson(Map<String, dynamic> json) => _$RotationCycleDataFromJson(json);
}