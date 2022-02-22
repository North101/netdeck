import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '/db/database.dart';
import '/util/assets.gen.dart';
import '/util/extensions.dart';

const headerIfNotModifiedSince = 'if-modified-since';

class ApiResults {
  const ApiResults(
    this.results,
    this.modified,
  );

  factory ApiResults.fromJson(dynamic json) {
    return ApiResults((json['data'] as List).cast<Map>(), DateTime.parse(json['last_updated']));
  }

  final DateTime modified;
  final List<Map>? results;
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
  //static final fetchMwlEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/mwl');
  static final fetchPacksEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/packs');

  static final fetchSidesEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/sides');
  static final fetchTypesEndpoint = Uri.parse('https://netrunnerdb.com/api/2.0/public/types');

  final Database _db;

  Future<ApiResults> loadData(String key) async {
    final results = json.decode(await rootBundle.loadString(key));
    return ApiResults.fromJson(results);
  }

  Future<ApiResults> fetchData(Uri url, DateTime lastModified) async {
    final response = await http.get(url, headers: {
      headerIfNotModifiedSince: lastModified.toIso8601String(),
    });
    if (response.statusCode == 304) {
      return ApiResults(
        null,
        lastModified,
      );
    }

    return ApiResults.fromJson(json.decode(response.body));
  }

  Future<DateTime> initCycles() async {
    final data = await loadData(Assets.nrdb.cycles);
    await updateCycles(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchCycles(DateTime lastUpdated) async {
    final data = await fetchData(fetchCyclesEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updateCycles(data.results!);
    return data.modified;
  }

  Future<void> updateCycles(List results) async {
    await _db.batch((b) {
      b.deleteAll<Cycle, CycleData>(_db.cycle);
      b.insertAll(
        _db.cycle,
        results.map<CycleData>((result) => CycleData.fromJson(result)).toList(),
      );
    });
  }

  Future<DateTime> initPacks() async {
    final data = await loadData(Assets.nrdb.packs);
    await updatePacks(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchPacks(DateTime lastUpdated) async {
    final data = await fetchData(fetchPacksEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updatePacks(data.results!);
    return data.modified;
  }

  Future<void> updatePacks(List results) async {
    await _db.batch((b) {
      b.deleteAll<Pack, PackData>(_db.pack);
      b.insertAll(
        _db.pack,
        results.map<PackData>((result) {
          return PackData.fromJson({
            ...result,
            'date_release':
                result['date_release'] != null ? DateTime.parse(result['date_release']).millisecondsSinceEpoch : null,
          });
        }).toList(),
      );
    });
  }

  Future<DateTime> initSides() async {
    final data = await loadData(Assets.nrdb.sides);
    await updateSides(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchSides(DateTime lastUpdated) async {
    final data = await fetchData(fetchSidesEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updateSides(data.results!);
    return data.modified;
  }

  Future<void> updateSides(List results) async {
    await _db.batch((b) {
      b.deleteAll<Side, SideData>(_db.side);
      b.insertAll(
        _db.side,
        results.map<SideData>((result) => SideData.fromJson(result)).toList(),
      );
    });
  }

  Future<DateTime> initFactions() async {
    final data = await loadData(Assets.nrdb.factions);
    await updateFactions(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchFactions(DateTime lastUpdated) async {
    final data = await fetchData(fetchFactionsEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updateFactions(data.results!);
    return data.modified;
  }

  Future<void> updateFactions(List results) async {
    await _db.batch((b) {
      b.deleteAll<Faction, FactionData>(_db.faction);
      b.insertAll(
        _db.faction,
        results.map<FactionData>((result) {
          return FactionData.fromJson({
            ...result,
            'color': Color(int.parse(result['color'], radix: 16) + 0xFF000000),
          });
        }).toList(),
      );
    });
  }

  Future<DateTime> initTypes() async {
    final data = await loadData(Assets.nrdb.types);
    await updateTypes(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchTypes(DateTime lastUpdated) async {
    final data = await fetchData(fetchTypesEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updateTypes(data.results!);
    return data.modified;
  }

  Future<void> updateTypes(List results) async {
    await _db.batch((b) {
      b.deleteAll<Type, TypeData>(_db.type);
      b.insertAll(
        _db.type,
        results.map<TypeData>((result) => TypeData.fromJson(result)).toList(),
      );
    });
  }

  Future<DateTime> initCards() async {
    final data = await loadData(Assets.nrdb.cards);
    await updateCards(data.results!);
    return data.modified;
  }

  Future<DateTime> fetchCards(DateTime lastUpdated) async {
    final data = await fetchData(fetchCardsEndpoint, lastUpdated);
    if (data.results == null) return lastUpdated;

    await updateCards(data.results!);
    return data.modified;
  }

  Future<void> updateCards(List results) async {
    await _db.batch((b) {
      b.deleteAll<Card, CardData>(_db.card);
      b.insertAll<Card, CardData>(
        _db.card,
        results.map<CardData>((result) {
          return CardData.fromJson({
            ...result,
            'body': result['text'],
            'stripped_body': result['stripped_text'],
          });
        }).toList(),
      );
    });
  }

  Future<DateTime> initFormat() async {
    final data = await loadData(Assets.nrdb.formats);
    await updateFormat(data.results!);
    return data.modified;
  }

  // Future<DateTime> fetchFormat(DateTime lastUpdated) async {
  //   final data = await fetchData(fetchFormatEndpoint, lastUpdated);
  //   if (data.results == null) return lastUpdated;

  //   await updateFormat(data.results!);
  //   return data.modified;
  // }

  Future<void> updateFormat(List results) async {
    await _db.batch((b) {
      b.deleteAll<Format, FormatData>(_db.format);
      b.insertAll<Format, FormatData>(
        _db.format,
        results.mapIndexed<FormatData>((index, result) {
          return FormatData.fromJson({
            ...result,
            'id': index,
          });
        }).toList(),
      );
    });
  }

  Future<DateTime> initRotation() async {
    final data = await loadData(Assets.nrdb.rotations);
    await updateRotation(data.results!);
    return data.modified;
  }

  // Future<DateTime> fetchRotation(DateTime lastUpdated) async {
  //   final data = await fetchData(fetchRotationEndpoint, lastUpdated);
  //   if (data.results == null) return lastUpdated;

  //   await updateRotation(data.results!);
  //   return data.modified;
  // }

  Future<void> updateRotation(List results) async {
    final rotations = [
      ...results.where((e) => e['current']).map((e) => {
            ...e,
            'code': '${e['format_code']}@current',
            'name': 'Current (${e['name']})',
            'current': true,
            'latest': false,
          }),
      ...results.where((e) => e['latest']).map((e) => {
            ...e,
            'code': '${e['format_code']}@latest',
            'name': 'Latest (${e['name']})',
            'current': false,
            'latest': true,
          }),
      ...results.map((e) => {
            ...e,
            'current': false,
            'latest': false,
          })
    ];
    await _db.batch((b) async {
      b.deleteAll<Rotation, RotationData>(_db.rotation);
      b.insertAll<Rotation, RotationData>(
        _db.rotation,
        rotations.map<RotationData>((result) {
          return RotationData.fromJson({
            ...result,
            'date_start': DateTime.parse(result['date_start']).millisecondsSinceEpoch,
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

  Future<DateTime> initMwl() async {
    final data = await loadData(Assets.nrdb.mwl);
    await updateMwl(data.results!);
    return data.modified;
  }

  // Future<DateTime> fetchMwl(DateTime lastUpdated) async {
  //   final data = await fetchData(fetchMwlEndpoint, lastUpdated);
  //   if (data.results == null) return lastUpdated;

  //   await updateMwl(data.results!);
  //   return data.modified;
  // }

  Future<void> updateMwl(List<Map> results) async {
    final mwl = [
      ...results.where((e) => e['active']).map((e) => {
            ...e,
            'code': '${e['format_code']}@active',
            'name': 'Active (${e['name']})',
            'active': true,
            'latest': false,
          }),
      ...results.where((e) => e['latest']).map((e) => {
            ...e,
            'code': '${e['format_code']}@latest',
            'name': 'Latest (${e['name']})',
            'active': false,
            'latest': true,
          }),
      ...results.map((e) => {
            ...e,
            'active': false,
            'latest': false,
          })
    ];
    await _db.batch((b) {
      b.deleteAll<Mwl, MwlData>(_db.mwl);
      b.insertAll<Mwl, MwlData>(
        _db.mwl,
        mwl.map<MwlData>((result) {
          result = result.cast<String, dynamic>();
          return MwlData.fromJson({
            ...result,
            'date_start': DateTime.parse(result['date_start']).millisecondsSinceEpoch,
          });
        }).toList(),
      );

      b.deleteAll<MwlCard, MwlCardData>(_db.mwlCard);
      b.insertAll(
        _db.mwlCard,
        mwl
            .map<Iterable<MwlCardData>>((result) {
              final mwlCode = result['code'];
              return (result['cards'] as Map).cast<String, Map>().entries.map<MwlCardData>((e) {
                return MwlCardData.fromJson({
                  ...e.value,
                  'mwl_code': mwlCode,
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

  Future<DateTime> updateDatabase({bool force = false}) async {
    final now = DateTime.now().toUtc();
    return await _db.transaction(() async {
      var nrdb = await _db.getNrdb().getSingleOrNull();
      if (nrdb != null) {
        final expired = force || nrdb.expires.isBefore(now);
        if (!expired) {
          return now;
        }
      } else {
        final cycleLastUpdated = await initCycles();
        final packLastUpdated = await initPacks();
        final sideLastUpdated = await initSides();
        final factionLastUpdated = await initFactions();
        final typeLastUpdated = await initTypes();
        final cardLastUpdated = await initCards();
        final formatLastUpdated = await initFormat();
        final rotationLastUpdated = await initRotation();
        final mwlLastUpdated = await initMwl();

        nrdb = NrdbData(
          id: true,
          expires: now.add(const Duration(days: 1)),
          cycleLastUpdated: cycleLastUpdated,
          packLastUpdated: packLastUpdated,
          sideLastUpdated: sideLastUpdated,
          factionLastUpdated: factionLastUpdated,
          typeLastUpdated: typeLastUpdated,
          cardLastUpdated: cardLastUpdated,
          formatLastUpdated: formatLastUpdated,
          rotationLastUpdated: rotationLastUpdated,
          mwlLastUpdated: mwlLastUpdated,
        );
      }

      final cycleLastUpdated = await fetchCycles(nrdb.cycleLastUpdated).catchError((e) => nrdb!.cycleLastUpdated);
      final packLastUpdated = await fetchPacks(nrdb.packLastUpdated).catchError((e) => nrdb!.packLastUpdated);
      final sideLastUpdated = await fetchSides(nrdb.sideLastUpdated).catchError((e) => nrdb!.sideLastUpdated);
      final factionLastUpdated =
          await fetchFactions(nrdb.factionLastUpdated).catchError((e) => nrdb!.factionLastUpdated);
      final typeLastUpdated = await fetchTypes(nrdb.typeLastUpdated).catchError((e) => nrdb!.typeLastUpdated);
      final cardLastUpdated = await fetchCards(nrdb.cardLastUpdated).catchError((e) => nrdb!.cardLastUpdated);
      //final formatLastUpdated = await fetchMwl(nrdb.formatLastUpdated);
      //final rotationLastUpdated = await fetchMwl(nrdb.rotationLastUpdated);
      //final mwlLastUpdated = await fetchMwl(nrdb.mwlLastUpdated);

      await _db.delete(_db.nrdb).go();
      await _db.into(_db.nrdb).insert(NrdbData(
            id: true,
            expires: now.add(const Duration(days: 1)),
            cycleLastUpdated: cycleLastUpdated,
            packLastUpdated: packLastUpdated,
            sideLastUpdated: sideLastUpdated,
            factionLastUpdated: factionLastUpdated,
            typeLastUpdated: typeLastUpdated,
            cardLastUpdated: cardLastUpdated,
            formatLastUpdated: nrdb.formatLastUpdated,
            rotationLastUpdated: nrdb.rotationLastUpdated,
            mwlLastUpdated: nrdb.mwlLastUpdated,
          ));
      return now;
    });
  }
}

class NrdbPublicApiNotifier extends StateNotifier<AsyncValue<DateTime>> {
  NrdbPublicApiNotifier(this.api) : super(const AsyncValue.loading()) {
    update();
  }

  final NrdbPublicApi api;

  void update({bool force = false}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => api.updateDatabase(force: force));
  }
}
