// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnmodifiedApiResult _$$UnmodifiedApiResultFromJson(Map json) =>
    _$UnmodifiedApiResult(
      DateTime.parse(json['last_updated'] as String),
      $type: json['runtimeType'] as String?,
    );

_$ModifiedApiResult _$$ModifiedApiResultFromJson(Map json) =>
    _$ModifiedApiResult(
      DateTime.parse(json['last_updated'] as String),
      Map<String, dynamic>.from(json['data'] as Map),
      $type: json['runtimeType'] as String?,
    );

_$_CardApi _$$_CardApiFromJson(Map json) => _$_CardApi(
      imageUrlTemplate: json['imageUrlTemplate'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CardApiData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_CardApiData _$$_CardApiDataFromJson(Map json) => _$_CardApiData(
      code: json['code'] as String,
      deckLimit: json['deck_limit'] as int,
      factionCode: json['faction_code'] as String,
      factionCost: json['faction_cost'] as int,
      flavor: json['flavor'] as String?,
      illustrator: json['illustrator'] as String?,
      influenceLimit: json['influence_limit'] as int?,
      keywords: json['keywords'] as String?,
      minimumDeckSize: json['minimum_deck_size'] as int?,
      packCode: json['pack_code'] as String,
      position: json['position'] as int,
      quantity: json['quantity'] as int,
      sideCode: json['side_code'] as String,
      strippedText: json['stripped_text'] as String?,
      strippedTitle: json['stripped_title'] as String,
      text: json['text'] as String?,
      title: json['title'] as String,
      typeCode: json['type_code'] as String,
      uniqueness: json['uniqueness'] as bool,
      baseLink: json['base_link'] as int?,
      cost: json['cost'] as int?,
      memoryCost: json['memory_cost'] as int?,
      strength: json['strength'] as int?,
      advancementCost: json['advancement_cost'] as int?,
      agendaPoints: json['agenda_points'] as int?,
      trashCost: json['trash_cost'] as int?,
    );

_$_CycleApi _$$_CycleApiFromJson(Map json) => _$_CycleApi(
      data: CycleApi.cycleFromJson(json['data'] as List),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_FactionApi _$$_FactionApiFromJson(Map json) => _$_FactionApi(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              FactionApiData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_FactionApiData _$$_FactionApiDataFromJson(Map json) => _$_FactionApiData(
      code: json['code'] as String,
      color: FactionApiData.colorFromJson(json['color'] as String),
      isMini: json['is_mini'] as bool,
      name: json['name'] as String,
      sideCode: json['side_code'] as String,
    );

_$_FormatApi _$$_FormatApiFromJson(Map json) => _$_FormatApi(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              FormatApiData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_FormatApiData _$$_FormatApiDataFromJson(Map json) => _$_FormatApiData(
      code: json['code'] as String,
      name: json['name'] as String,
    );

_$_PackApi _$$_PackApiFromJson(Map json) => _$_PackApi(
      data: PackApi.packFromJson(json['data'] as List),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_SideApi _$$_SideApiFromJson(Map json) => _$_SideApi(
      data: SideApi.sideFromJson(json['data'] as List),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_TypeApi _$$_TypeApiFromJson(Map json) => _$_TypeApi(
      data: TypeApi.typeFromJson(json['data'] as List),
      total: json['total'] as int,
      success: json['success'] as bool,
      versionNumber: json['version_number'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_RotationApi _$$_RotationApiFromJson(Map json) => _$_RotationApi(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              RotationApiData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_RotationApiData _$$_RotationApiDataFromJson(Map json) => _$_RotationApiData(
      code: json['code'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      formatCode: json['format_code'] as String,
      name: json['name'] as String,
      current: json['current'] as bool,
      latest: json['latest'] as bool,
      rotated:
          (json['rotated'] as List<dynamic>).map((e) => e as String).toList(),
    );

_$_MwlApi _$$_MwlApiFromJson(Map json) => _$_MwlApi(
      data: (json['data'] as List<dynamic>)
          .map((e) => MwlApiData.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

_$_MwlApiData _$$_MwlApiDataFromJson(Map json) => _$_MwlApiData(
      code: json['code'] as String,
      name: json['name'] as String,
      formatCode: json['format_code'] as String,
      dateStart: json['date_start'] == null
          ? null
          : DateTime.parse(json['date_start'] as String),
      active: json['active'] as bool,
      latest: json['latest'] as bool,
      cards: (json['cards'] as Map).map(
        (k, e) => MapEntry(k as String,
            MwlCardApiData.fromJson(Map<String, dynamic>.from(e as Map))),
      ),
      cardTitles: (json['card_titles'] as Map).map(
        (k, e) => MapEntry(k as String,
            MwlCardApiData.fromJson(Map<String, dynamic>.from(e as Map))),
      ),
      runnerPoints: json['runner_points'] as int?,
      corpPoints: json['corp_points'] as int?,
    );

_$_MwlCardApiData _$$_MwlCardApiDataFromJson(Map json) => _$_MwlCardApiData(
      globalPenalty: json['global_penalty'] as int?,
      universalFactionCost: json['universal_faction_cost'] as int?,
      isRestricted: json['is_restricted'] as int?,
      points: json['points'] as int?,
      deckLimit: json['deck_limit'] as int?,
    );
