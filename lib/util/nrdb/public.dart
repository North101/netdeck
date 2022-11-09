import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '/db/database.dart';
import '/util/assets.gen.dart';
import '/util/extensions.dart';

part 'public.freezed.dart';

const headerIfNotModifiedSince = 'if-modified-since';

extension DateTimeUtc on DateTime {
  static DateTime parseUtc(String formattedDate) {
    final value = DateTime.parse(formattedDate);
    if (value.isUtc) return value;

    return value.asUtc();
  }

  static DateTime? tryParseUtc(String formattedDate) {
    final value = DateTime.tryParse(formattedDate);
    if (value == null || value.isUtc) return value;

    return value.asUtc();
  }

  DateTime asUtc() => DateTime.utc(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
}

String currentRotationCode(String formatCode) => '$formatCode@current';

String currentRotationName(String? name) => 'Current (${name ?? 'None'})';

String latestRotationCode(String formatCode) => '$formatCode@latest';

String latestRotationName(String? name) => 'Latest (${name ?? 'None'})';

String latestMwlCode(String formatCode) => '$formatCode@latest';

String latestMwlName(String? name) => 'Latest (${name ?? 'None'})';

String activeMwlCode(String formatCode) => '$formatCode@active';

String activeMwlName(String? name) => 'Active (${name ?? 'None'})';

@freezed
class ApiResult with _$ApiResult {
  const factory ApiResult.unmodified(DateTime lastUpdated) = UnmodifiedApiResult;

  const factory ApiResult.modified({
    required DateTime lastUpdated,
    required List<Map<String, dynamic>> data,
    required Map<String, dynamic> info,
  }) = ModifiedApiResult;

  static ModifiedApiResult fromJson(Map<String, dynamic> json) {
    return ModifiedApiResult(
      lastUpdated: DateTime.parse(json['last_updated']),
      data: (json['data'] as List).cast(),
      info: {
        for (final entry in json.entries)
          if (!const ['last_updated', 'data'].contains(entry.key)) entry.key: entry.value
      },
    );
  }
}

class NrdbDeck {
  NrdbDeck({
    required this.id,
    required this.name,
    required this.description,
    required this.mwlCode,
    required this.dateCreation,
    required this.dateUpdate,
    required this.cards,
    required this.tags,
  });

  factory NrdbDeck.fromJson(Map<String, dynamic> json) {
    return NrdbDeck(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      mwlCode: json['mwl_code'],
      dateCreation: DateTime.parse(json['date_creation']),
      dateUpdate: DateTime.parse(json['date_update']),
      cards: (json['cards'] as Map).cast<String, int>(),
      tags: (json['tags'] as String?)?.split(' ').where((e) => e.isNotEmpty).toList() ?? [],
    );
  }

  final Map<String, int> cards;
  final DateTime dateCreation;
  final DateTime dateUpdate;
  final String description;
  final int id;
  final String? mwlCode;
  final String name;
  final List<String> tags;
}

class NrdbPublicApi {
  NrdbPublicApi(this._db);

  static final fetchCardsEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/cards');
  static final fetchCyclesEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/cycles');
  static final fetchFactionsEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/factions');
  static final fetchFormatsEndpoint =
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck/master/assets/nrdb/formats.json');
  static final fetchRotationsEndpoint =
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck/master/assets/nrdb/rotations.json');
  static final fetchMwlEndpoint =
      Uri.parse('https://raw.githubusercontent.com/North101/netdeck/master/assets/nrdb/mwl.json');
  static final fetchPacksEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/packs');
  static final fetchSidesEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/sides');
  static final fetchTypesEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/types');

  final Database _db;

  Future<ModifiedApiResult> loadData(String key) async {
    final results = json.decode(await rootBundle.loadString(key));
    return ApiResult.fromJson(results);
  }

  Future<ApiResult> fetchData(Uri url, DateTime lastModified, [bool force = false]) async {
    final response = await http.get(url, headers: {
      if (!force) headerIfNotModifiedSince: lastModified.toIso8601String(),
    });
    if (response.statusCode == 304) return ApiResult.unmodified(lastModified);

    final data = json.decode(response.body);
    final lastUpdated = DateTime.parse(data['last_updated']);
    if (!lastUpdated.isAfter(lastModified)) return ApiResult.unmodified(lastModified);

    return ApiResult.fromJson(data);
  }

  Future<ModifiedApiResult> initCycles() async {
    final data = await loadData(Assets.nrdb.cycles);
    await updateCycles(data);
    return data;
  }

  Future<ApiResult> fetchCycles(DateTime lastUpdated) async {
    final data = await fetchData(fetchCyclesEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateCycles(data);
    return data;
  }

  Future<void> updateCycles(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Cycle, CycleData>(_db.cycle);
      b.insertAll(
        _db.cycle,
        result.data.map<CycleData>((item) => CycleData.fromJson(item.cast())).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initPacks() async {
    final data = await loadData(Assets.nrdb.packs);
    await updatePacks(data);
    return data;
  }

  Future<ApiResult> fetchPacks(DateTime lastUpdated) async {
    final data = await fetchData(fetchPacksEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updatePacks(data);
    return data;
  }

  Future<void> updatePacks(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Pack, PackData>(_db.pack);
      b.insertAll(
        _db.pack,
        result.data.map<PackData>((result) {
          return PackData.fromJson({
            ...result,
            'date_release': result['date_release'],
          });
        }).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initSides() async {
    final data = await loadData(Assets.nrdb.sides);
    await updateSides(data);
    return data;
  }

  Future<ApiResult> fetchSides(DateTime lastUpdated) async {
    final data = await fetchData(fetchSidesEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateSides(data);
    return data;
  }

  Future<void> updateSides(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Side, SideData>(_db.side);
      b.insertAll(
        _db.side,
        result.data.map<SideData>((item) => SideData.fromJson(item)).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initFactions() async {
    final data = await loadData(Assets.nrdb.factions);
    await updateFactions(data);
    return data;
  }

  Future<ApiResult> fetchFactions(DateTime lastUpdated) async {
    final data = await fetchData(fetchFactionsEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateFactions(data);
    return data;
  }

  Future<void> updateFactions(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Faction, FactionData>(_db.faction);
      b.insertAll(
        _db.faction,
        result.data.map<FactionData>((result) {
          return FactionData.fromJson({
            ...result,
            'color': int.parse(result['color'], radix: 16) + 0xFF000000,
          });
        }).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initTypes() async {
    final data = await loadData(Assets.nrdb.types);
    await updateTypes(data);
    return data;
  }

  Future<ApiResult> fetchTypes(DateTime lastUpdated) async {
    final data = await fetchData(fetchTypesEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateTypes(data);
    return data;
  }

  Future<void> updateTypes(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Type, TypeData>(_db.type);
      b.insertAll(
        _db.type,
        result.data.map<TypeData>((result) => TypeData.fromJson(result)).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initCards() async {
    final data = await loadData(Assets.nrdb.cards);
    await updateCards(data);
    return data;
  }

  Future<ApiResult> fetchCards(DateTime lastUpdated) async {
    final data = await fetchData(fetchCardsEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateCards(data);
    return data;
  }

  Future<void> updateCards(ModifiedApiResult result) async {
    final String imageUrlTemplate = result.info['imageUrlTemplate'];
    await _db.batch((b) {
      b.deleteAll<Card, CardData>(_db.card);
      b.insertAll<Card, CardData>(
        _db.card,
        result.data.map<CardData>((result) {
          return CardData.fromJson({
            ...result,
            'body': result['text'],
            'image_url': imageUrlTemplate.replaceAll('{code}', result['code']),
          });
        }).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initFormats() async {
    final data = await loadData(Assets.nrdb.formats);
    await updateFormats(data);
    return data;
  }

  Future<ApiResult> fetchFormats(DateTime lastUpdated) async {
    final data = await fetchData(fetchFormatsEndpoint, lastUpdated);
    if (data is! ModifiedApiResult) return data;

    await updateFormats(data);
    return data;
  }

  Future<void> updateFormats(ModifiedApiResult result) async {
    await _db.batch((b) {
      b.deleteAll<Format, FormatData>(_db.format);
      b.insertAll<Format, FormatData>(
        _db.format,
        result.data.mapIndexed<FormatData>((index, result) {
          return FormatData.fromJson({
            ...result,
            'id': index,
          });
        }).toList(),
      );
    });
  }

  Future<ModifiedApiResult> initRotations() async {
    final data = await loadData(Assets.nrdb.rotations);
    await updateRotations(data);
    return data;
  }

  Future<ApiResult> fetchRotations(DateTime lastUpdated, [bool force = false]) async {
    final data = await fetchData(fetchRotationsEndpoint, lastUpdated, force);
    if (data is! ModifiedApiResult) return data;

    await updateRotations(data);
    return data;
  }

  Future<void> updateRotations(ModifiedApiResult result) async {
    final formats = await _db.listFormats().map((e) => e.format).get();
    final rotations = {
      for (final format in formats)
        currentRotationCode(format.code): {
          'code': currentRotationCode(format.code),
          'format_code': format.code,
          'name': currentRotationName(null),
          'type': const RotationTypeConverter().toJson(RotationType.current),
          'rotated': [],
        },
      for (final e in result.data)
        if (e['current'])
          currentRotationCode(e['format_code']): {
            ...e,
            'code': currentRotationCode(e['format_code']),
            'name': currentRotationName(e['name']!),
            'type': const RotationTypeConverter().toJson(RotationType.current),
          },
      for (final format in formats)
        latestRotationCode(format.code): {
          'code': latestRotationCode(format.code),
          'format_code': format.code,
          'name': latestRotationName(null),
          'type': const RotationTypeConverter().toJson(RotationType.latest),
          'rotated': [],
        },
      for (final e in result.data)
        if (e['latest'])
          latestRotationCode(e['format_code']): {
            ...e,
            'code': latestRotationCode(e['format_code']),
            'name': latestRotationName(e['name']!),
            'type': const RotationTypeConverter().toJson(RotationType.latest),
          },
      for (final e in result.data) e['code']: e,
    }.values;
    await _db.batch((b) async {
      b.deleteAll<Rotation, RotationData>(_db.rotation);
      b.insertAll<Rotation, RotationData>(
        _db.rotation,
        rotations.map<RotationData>((result) {
          print(result);
          return RotationData.fromJson({
            ...result,
            'date_start': result['date_start'],
          });
        }).toList(),
      );

      final rotationCycles = rotations.map((result) {
        final rotationCode = result['code'] as String;
        return MapEntry(rotationCode, (result['rotated'] as List).cast<String>());
      }).toMap();
      b.deleteAll<RotationCycle, RotationCycleData>(_db.rotationCycle);
      b.insertAll(
        _db.rotationCycle,
        rotationCycles.entries
            .map<Iterable<RotationCycleData>>((rotation) {
              return rotation.value.map((cycleCode) => RotationCycleData(
                    rotationCode: rotation.key,
                    cycleCode: cycleCode,
                  ));
            })
            .flattened
            .toList(),
      );
    });
  }

  Future<ModifiedApiResult> initMwl() async {
    final data = await loadData(Assets.nrdb.mwl);
    await updateMwl(data);
    return data;
  }

  Future<ApiResult> fetchMwl(DateTime lastUpdated, [bool force = false]) async {
    final data = await fetchData(fetchMwlEndpoint, lastUpdated, force);
    if (data is! ModifiedApiResult) return data;

    await updateMwl(data);
    return data;
  }

  Future<void> updateMwl(ModifiedApiResult result) async {
    final formats = await _db.listFormats().map((e) => e.format).get();
    final mwl = {
      for (final format in formats)
        activeMwlCode(format.code): {
          'code': activeMwlCode(format.code),
          'format_code': format.code,
          'name': activeMwlName(null),
          'type': const MwlTypeConverter().toJson(MwlType.active),
          'cards': {},
        },
      for (final e in result.data)
        if (e['active'])
          activeMwlCode(e['format_code']): {
            ...e,
            'code': activeMwlCode(e['format_code']),
            'name': activeMwlName(e['name']!),
            'type': const MwlTypeConverter().toJson(MwlType.active),
          },
      for (final format in formats)
        latestRotationCode(format.code): {
          'code': latestRotationCode(format.code),
          'format_code': format.code,
          'name': latestRotationName(null),
          'type': const MwlTypeConverter().toJson(MwlType.latest),
          'cards': {},
        },
      for (final e in result.data)
        if (e['latest'])
          latestRotationCode(e['format_code']): {
            ...e,
            'code': latestRotationCode(e['format_code']),
            'name': latestRotationName(e['name']!),
            'type': const MwlTypeConverter().toJson(MwlType.latest),
          },
      for (final e in result.data) e['code']: e,
    }.values;
    await _db.batch((b) {
      b.deleteAll<Mwl, MwlData>(_db.mwl);
      b.insertAll<Mwl, MwlData>(
        _db.mwl,
        mwl.map<MwlData>((result) {
          result = result.cast<String, dynamic>();
          return MwlData.fromJson({
            ...result,
            'date_start': result['date_start'],
          });
        }).toList(),
      );

      final mwlCards = mwl.map((result) {
        final mwlCode = result['code'] as String;
        return MapEntry(mwlCode, (result['cards'] as Map).cast<String, Map>());
      }).toMap();
      b.deleteAll<MwlCard, MwlCardData>(_db.mwlCard);
      b.insertAll(
        _db.mwlCard,
        mwlCards.entries
            .map<Iterable<MwlCardData>>((mwl) {
              return mwl.value.cast<String, Map>().entries.map<MwlCardData>((e) {
                return MwlCardData.fromJson({
                  ...e.value,
                  'mwl_code': mwl.key,
                  'card_code': e.key,
                  'is_restricted': e.value['is_restricted'] == 1,
                });
              });
            })
            .flattened
            .toList(),
      );
    });
  }

  Future<NrdbData> initDatabase(DateTime now) async {
    final cycleResult = await initCycles();
    final packResult = await initPacks();
    final sideResult = await initSides();
    final factionResult = await initFactions();
    final typeResult = await initTypes();
    final cardResult = await initCards();
    final formatResult = await initFormats();
    final rotationResult = await initRotations();
    final mwlResult = await initMwl();

    return NrdbData(
      id: true,
      expires: now.add(const Duration(days: 1)),
      cycleLastUpdated: cycleResult.lastUpdated,
      packLastUpdated: packResult.lastUpdated,
      sideLastUpdated: sideResult.lastUpdated,
      factionLastUpdated: factionResult.lastUpdated,
      typeLastUpdated: typeResult.lastUpdated,
      cardLastUpdated: cardResult.lastUpdated,
      formatLastUpdated: formatResult.lastUpdated,
      rotationLastUpdated: rotationResult.lastUpdated,
      mwlLastUpdated: mwlResult.lastUpdated,
    );
  }

  Future<DateTime> updateDatabase({bool force = false}) async {
    final now = DateTime.now().toUtc();
    return await _db.transaction(() async {
      var nrdb = await _db.getNrdb().getSingleOrNull() ?? await initDatabase(now);

      final expired = force || nrdb.expires.isBefore(now);
      if (!expired) return now;

      final cycleResult = await fetchCycles(nrdb.cycleLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.cycleLastUpdated);
      });
      final packResult = await fetchPacks(nrdb.packLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.packLastUpdated);
      });
      final sideResult = await fetchSides(nrdb.sideLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.sideLastUpdated);
      });
      final factionResult = await fetchFactions(nrdb.factionLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.factionLastUpdated);
      });
      final typeResult = await fetchTypes(nrdb.typeLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.typeLastUpdated);
      });
      final cardResult = await fetchCards(nrdb.cardLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.cardLastUpdated);
      });
      final formatResult = await fetchFormats(nrdb.formatLastUpdated).catchError((e) {
        return ApiResult.unmodified(nrdb.formatLastUpdated);
      });
      final formatChanged = formatResult.map(unmodified: (v) => false, modified: (v) => true);
      final rotationResult = await fetchRotations(nrdb.rotationLastUpdated, formatChanged).catchError((e) {
        return ApiResult.unmodified(nrdb.rotationLastUpdated);
      });
      final mwlResult = await fetchMwl(nrdb.mwlLastUpdated, formatChanged).catchError((e) {
        return ApiResult.unmodified(nrdb.mwlLastUpdated);
      });

      await _db.delete(_db.nrdb).go();
      await _db.into(_db.nrdb).insert(NrdbData(
            id: true,
            expires: now.add(const Duration(days: 1)),
            cycleLastUpdated: cycleResult.lastUpdated,
            packLastUpdated: packResult.lastUpdated,
            sideLastUpdated: sideResult.lastUpdated,
            factionLastUpdated: factionResult.lastUpdated,
            typeLastUpdated: typeResult.lastUpdated,
            cardLastUpdated: cardResult.lastUpdated,
            formatLastUpdated: formatResult.lastUpdated,
            rotationLastUpdated: rotationResult.lastUpdated,
            mwlLastUpdated: mwlResult.lastUpdated,
          ));
      return now;
    });
  }
}

class NrdbPublicApiNotifier extends RestorableDateTimeN {
  NrdbPublicApiNotifier(this.api) : super(null);

  final NrdbPublicApi api;

  void update({bool force = false}) async {
    value = null;
    value = await api.updateDatabase(force: force);
  }
}
