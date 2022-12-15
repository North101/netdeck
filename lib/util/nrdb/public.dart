import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '/db/database.dart';
import '/util/assets.gen.dart';
import 'public_data.dart';

const headerIfNotModifiedSince = 'if-modified-since';

String currentFormatCode(String formatCode) => '$formatCode@current';

String currentFormatName(String name, String? subName) => '$name Current (${subName ?? 'None'})';

String latestFormatCode(String formatCode) => '$formatCode@latest';

String latestFormatName(String name, String? subName) => '$name Latest (${subName ?? 'None'})';

String activeFormatCode(String formatCode) => '$formatCode@active';

String activeFormatName(String name, String? subName) => '$name Active (${subName ?? 'None'})';

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
    final lastUpdated = DateTime.parse(results['last_updated']);
    return ModifiedApiResult(lastUpdated, results);
  }

  Future<ApiResult> fetchData(Uri url, DateTime lastModified, [bool force = false]) async {
    final response = await http.get(url, headers: {
      if (!force) headerIfNotModifiedSince: lastModified.toIso8601String(),
    });
    if (response.statusCode == 304) return ApiResult.unmodified(lastModified);

    final results = json.decode(response.body);
    final lastUpdated = DateTime.parse(results['last_updated']);
    if (!lastUpdated.isAfter(lastModified)) return ApiResult.unmodified(lastModified);

    return ApiResult.modified(lastUpdated, results);
  }

  Future<ModifiedApiResult> initCycles() async {
    final result = await loadData(Assets.nrdb.cycles);
    await updateCycles(CycleApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchCycles(DateTime lastUpdated) async {
    final result = await fetchData(fetchCyclesEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateCycles(CycleApi.fromJson(result.data));
    return result;
  }

  Future<void> updateCycles(CycleApi result) async {
    await _db.batch((b) {
      b.deleteAll<Cycle, CycleData>(_db.cycle);
      b.insertAll(
        _db.cycle,
        result.data,
      );
    });
  }

  Future<ModifiedApiResult> initPacks() async {
    final result = await loadData(Assets.nrdb.packs);
    await updatePacks(PackApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchPacks(DateTime lastUpdated) async {
    final result = await fetchData(fetchPacksEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updatePacks(PackApi.fromJson(result.data));
    return result;
  }

  Future<void> updatePacks(PackApi result) async {
    await _db.batch((b) {
      b.deleteAll<Pack, PackData>(_db.pack);
      b.insertAll(
        _db.pack,
        result.data,
      );
    });
  }

  Future<ModifiedApiResult> initSides() async {
    final result = await loadData(Assets.nrdb.sides);
    await updateSides(SideApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchSides(DateTime lastUpdated) async {
    final result = await fetchData(fetchSidesEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateSides(SideApi.fromJson(result.data));
    return result;
  }

  Future<void> updateSides(SideApi result) async {
    await _db.batch((b) {
      b.deleteAll<Side, SideData>(_db.side);
      b.insertAll(
        _db.side,
        result.data,
      );
    });
  }

  Future<ModifiedApiResult> initFactions() async {
    final result = await loadData(Assets.nrdb.factions);
    await updateFactions(FactionApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchFactions(DateTime lastUpdated) async {
    final result = await fetchData(fetchFactionsEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateFactions(FactionApi.fromJson(result.data));
    return result;
  }

  Future<void> updateFactions(FactionApi result) async {
    await _db.batch((b) {
      b.deleteAll<Faction, FactionData>(_db.faction);
      b.insertAll(
        _db.faction,
        result.data
            .map<FactionData>((e) => FactionData(
                  code: e.code,
                  sideCode: e.sideCode,
                  name: e.name,
                  color: Color(e.color),
                  isMini: e.isMini,
                ))
            .toList(),
      );
    });
  }

  Future<ModifiedApiResult> initTypes() async {
    final result = await loadData(Assets.nrdb.types);
    await updateTypes(TypeApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchTypes(DateTime lastUpdated) async {
    final result = await fetchData(fetchTypesEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateTypes(TypeApi.fromJson(result.data));
    return result;
  }

  Future<void> updateTypes(TypeApi result) async {
    await _db.batch((b) {
      b.deleteAll<Type, TypeData>(_db.type);
      b.insertAll(
        _db.type,
        result.data,
      );
    });
  }

  Future<ModifiedApiResult> initCards() async {
    final result = await loadData(Assets.nrdb.cards);
    await updateCards(CardApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchCards(DateTime lastUpdated) async {
    final result = await fetchData(fetchCardsEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateCards(CardApi.fromJson(result.data));
    return result;
  }

  Future<void> updateCards(CardApi result) async {
    final String imageUrlTemplate = result.imageUrlTemplate;
    await _db.batch((b) {
      b.deleteAll<Card, CardData>(_db.card);
      b.insertAll<Card, CardData>(
        _db.card,
        result.data
            .map<CardData>((e) => CardData(
                  code: e.code,
                  packCode: e.packCode,
                  factionCode: e.factionCode,
                  typeCode: e.typeCode,
                  position: e.position,
                  title: e.title,
                  body: e.text,
                  keywords: e.keywords,
                  quantity: e.quantity,
                  cost: e.cost,
                  deckLimit: e.deckLimit,
                  factionCost: e.factionCost,
                  uniqueness: e.uniqueness,
                  strength: e.strength,
                  agendaPoints: e.agendaPoints,
                  memoryCost: e.memoryCost,
                  advancementCost: e.advancementCost,
                  trashCost: e.trashCost,
                  baseLink: e.baseLink,
                  influenceLimit: e.influenceLimit,
                  minimumDeckSize: e.minimumDeckSize,
                  flavor: e.flavor,
                  illustrator: e.illustrator,
                  imageUrl: imageUrlTemplate.replaceAll('{code}', e.code),
                ))
            .toList(),
      );
    });
  }

  Future<ModifiedApiResult> initFormats() async {
    final result = await loadData(Assets.nrdb.formats);
    await updateFormats(FormatApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchFormats(DateTime lastUpdated) async {
    final result = await fetchData(fetchFormatsEndpoint, lastUpdated);
    if (result is! ModifiedApiResult) return result;

    await updateFormats(FormatApi.fromJson(result.data));
    return result;
  }

  Future<void> updateFormats(FormatApi result) async {
    await _db.batch((b) {
      b.deleteAll<Format, FormatData>(_db.format);
      b.insertAll<Format, FormatData>(
        _db.format,
        result.data
            .mapIndexed<FormatData>((index, e) => FormatData(
                  id: index,
                  code: e.code,
                  name: e.name,
                ))
            .toList(),
      );
    });
  }

  Future<ModifiedApiResult> initRotations() async {
    final result = await loadData(Assets.nrdb.rotations);
    await updateRotations(RotationApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchRotations(DateTime lastUpdated, [bool force = false]) async {
    final result = await fetchData(fetchRotationsEndpoint, lastUpdated, force);
    if (result is! ModifiedApiResult) return result;

    await updateRotations(RotationApi.fromJson(result.data));
    return result;
  }

  RotationApiData currentRotationData(FormatData format, List<RotationApiData> rotations) {
    final rotation = rotations.where((e) => e.formatCode == format.code && e.current).singleOrNull;
    return RotationApiData(
      code: currentFormatCode(format.code),
      name: currentFormatName(format.name, rotation?.name),
      formatCode: format.code,
      dateStart: rotation?.dateStart,
      current: true,
      latest: false,
      rotated: rotation?.rotated ?? const [],
    );
  }

  RotationApiData latestRotationData(FormatData format, List<RotationApiData> rotations) {
    final rotation = rotations.where((e) => e.formatCode == format.code && e.latest).singleOrNull;
    return RotationApiData(
      code: latestFormatCode(format.code),
      name: latestFormatName(format.name, rotation?.name),
      formatCode: format.code,
      dateStart: rotation?.dateStart,
      current: false,
      latest: true,
      rotated: rotation?.rotated ?? const [],
    );
  }

  Future<void> updateRotations(RotationApi result) async {
    final formats = await _db.listFormats().map((e) => e.format).get();
    final rotations = {
      for (final format in formats) currentFormatCode(format.code): currentRotationData(format, result.data),
      for (final format in formats) latestFormatCode(format.code): latestRotationData(format, result.data),
      for (final e in result.data)
        e.code: e.copyWith(
          current: false,
          latest: false,
        ),
    };
    await _db.batch((b) async {
      b.deleteAll<Rotation, RotationData>(_db.rotation);
      b.insertAll<Rotation, RotationData>(
        _db.rotation,
        rotations.values.map((e) => RotationData(
              code: e.code,
              formatCode: e.formatCode,
              name: e.name,
              dateStart: e.dateStart,
              type: e.latest
                  ? RotationType.latest
                  : e.current
                      ? RotationType.current
                      : null,
            )),
      );

      b.deleteAll<RotationCycle, RotationCycleData>(_db.rotationCycle);
      b.insertAll(
        _db.rotationCycle,
        [
          for (final rotation in rotations.entries)
            for (final cycleCode in rotation.value.rotated)
              RotationCycleData(
                rotationCode: rotation.key,
                cycleCode: cycleCode,
              ),
        ],
      );
    });
  }

  Future<ModifiedApiResult> initMwl() async {
    final result = await loadData(Assets.nrdb.mwl);
    await updateMwl(MwlApi.fromJson(result.data));
    return result;
  }

  Future<ApiResult> fetchMwl(DateTime lastUpdated, [bool force = false]) async {
    final result = await fetchData(fetchMwlEndpoint, lastUpdated, force);
    if (result is! ModifiedApiResult) return result;

    await updateMwl(MwlApi.fromJson(result.data));
    return result;
  }

  MwlApiData activeMwlData(FormatData format, List<MwlApiData> mwlList) {
    final mwl = mwlList.where((e) => e.formatCode == format.code && e.active).singleOrNull;
    return MwlApiData(
      code: activeFormatCode(format.code),
      name: activeFormatName(format.name, mwl?.name),
      formatCode: format.code,
      dateStart: mwl?.dateStart,
      active: true,
      latest: false,
      cards: mwl?.cards ?? const {},
      cardTitles: mwl?.cardTitles ?? const {},
      runnerPoints: mwl?.runnerPoints,
      corpPoints: mwl?.corpPoints,
    );
  }

  MwlApiData latestMwlData(FormatData format, List<MwlApiData> mwlList) {
    final mwl = mwlList.where((e) => e.formatCode == format.code && e.latest).singleOrNull;
    return MwlApiData(
      code: latestFormatCode(format.code),
      name: latestFormatName(format.name, mwl?.name),
      formatCode: format.code,
      dateStart: mwl?.dateStart,
      active: false,
      latest: true,
      cards: mwl?.cards ?? const {},
      cardTitles: mwl?.cardTitles ?? const {},
      runnerPoints: mwl?.runnerPoints,
      corpPoints: mwl?.corpPoints,
    );
  }

  Future<void> updateMwl(MwlApi result) async {
    final formats = await _db.listFormats().map((e) => e.format).get();
    final mwl = {
      for (final format in formats) activeFormatCode(format.code): activeMwlData(format, result.data),
      for (final format in formats) latestFormatCode(format.code): latestMwlData(format, result.data),
      for (final e in result.data)
        e.code: e.copyWith(
          active: false,
          latest: false,
        ),
    };
    await _db.batch((b) {
      b.deleteAll<Mwl, MwlData>(_db.mwl);
      b.insertAll<Mwl, MwlData>(
        _db.mwl,
        mwl.values.map((e) => MwlData(
              code: e.code,
              name: e.name,
              formatCode: e.formatCode,
              dateStart: e.dateStart,
              type: e.active
                  ? MwlType.active
                  : e.latest
                      ? MwlType.latest
                      : null,
              runnerPoints: e.runnerPoints,
              corpPoints: e.corpPoints,
            )),
      );

      b.deleteAll<MwlCardTitle, MwlCardTitleData>(_db.mwlCardTitle);
      b.insertAll(
        _db.mwlCardTitle,
        [
          for (final mwl in mwl.entries)
            for (final e in mwl.value.cardTitles.entries)
              MwlCardTitleData(
                mwlCode: mwl.key,
                cardTitle: e.key,
                isRestricted: e.value.isRestricted == 1,
                globalPenalty: e.value.globalPenalty,
                universalFactionCost: e.value.universalFactionCost,
                deckLimit: e.value.deckLimit,
                points: e.value.points,
              ),
        ],
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

    return await _db.into(_db.nrdb).insertReturning(NrdbData(
          id: true,
          expires: now,
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
  }

  Future<DateTime> updateDatabase({bool force = false}) async {
    final now = DateTime.now().toUtc();
    return await _db.transaction(() async {
      var nrdb = await _db.getNrdb().getSingleOrNull() ?? await initDatabase(now);

      final expired = force || !nrdb.expires.isAfter(now);
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

      await _db.into(_db.nrdb).insertOnConflictUpdate(NrdbData(
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
