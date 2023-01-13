import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/types.dart';

part 'rotation_pack.freezed.dart';
part 'rotation_pack.g.dart';

@freezed
class RotationPackResult with _$RotationPackResult {
  const factory RotationPackResult({
    required FormatData format,
    required RotationViewData rotation,
    required PackData pack,
    required CycleData cycle,
  }) = _RotationPackResult;

  const factory RotationPackResult.cards({
    required FormatData format,
    required RotationViewData rotation,
    required PackData pack,
    required CycleData cycle,
    required CardData card,
  }) = RotationCardResult;

  factory RotationPackResult.fromJson(Map<String, dynamic> json) => _$RotationPackResultFromJson(json);
}
