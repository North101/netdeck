import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netrunner_deckbuilder/db/database.dart';

import 'data.dart';

part 'side.freezed.dart';
part 'side.g.dart';

const sideOrder = [
  'runner',
  'corp',
];

@freezed
class SideData with _$SideData, SideToColumns, DataMixin {
  const SideData._();

  const factory SideData({
    required String code,
    required String name,
  }) = _SideData;

  factory SideData.fromJson(Map<String, dynamic> json) => _$SideDataFromJson(json);

  int get order => sideOrder.indexOf(code);
}
