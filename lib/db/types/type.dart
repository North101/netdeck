import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import 'data.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
class TypeData with _$TypeData, TypeToColumns, DataMixin {
  const TypeData._();

  const factory TypeData({
    required String code,
    required String? sideCode,
    required int position,
    required String name,
    required bool isSubtype,
  }) = _TypeData;

  factory TypeData.fromJson(Map<String, dynamic> json) => _$TypeDataFromJson(json);
}

@freezed
class TypeResult with _$TypeResult {
  const factory TypeResult({
    required TypeData type,
    required SideData? side,
  }) = _TypeResult;

  factory TypeResult.fromJson(Map<String, dynamic> json) => _$TypeResultFromJson(json);
}
