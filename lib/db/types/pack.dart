import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'pack.freezed.dart';
part 'pack.g.dart';

@freezed
class PackData with _$PackData, PackToColumns, DataMixin {
  const PackData._();

  const factory PackData({
    required String code,
    required String cycleCode,
    required int position,
    required String name,
    required DateTime? dateRelease,
    required int? size,
  }) = _PackData;

  factory PackData.fromJson(Map<String, dynamic> json) => _$PackDataFromJson(json);
}

@freezed
class PackResult with _$PackResult {
  const PackResult._();

  const factory PackResult({
    required PackData pack,
    required CycleData cycle,
  }) = _PackResult;

  const factory PackResult.collection({
    required PackData pack,
    required CycleData cycle,
    required bool inCollection,
  }) = CollectionResult;

  factory PackResult.fromJson(Map<String, dynamic> json) => _$PackResultFromJson(json);

  bool get hasCycleName => cycle.name == pack.name;
}
