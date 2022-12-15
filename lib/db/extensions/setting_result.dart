import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';

extension SettingResultEx on SettingResult {
  static fromJson(Map<String, dynamic> data) {
    return SettingResult(
      settings: SettingsData.fromJson((data['settings'] as Map).cast()),
      filterFormat: (data['filter_format'] as Map?)?.let((e) => FormatData.fromJson(e.cast())),
      filterRotation: (data['filter_rotation'] as Map?)?.let((e) => RotationViewData.fromJson(e.cast())),
      filterMwl: (data['filter_mwl'] as Map?)?.let((e) => MwlViewData.fromJson(e.cast())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'settings': settings.toJson(),
      'filter_format': filterFormat?.toJson(),
      'filter_rotation': filterRotation?.toJson(),
      'filter_mwl': filterMwl?.toJson(),
    };
  }
}
