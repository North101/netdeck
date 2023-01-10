import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';
import '/util/extensions.dart';
import '/util/nrdb/private_model.dart';
import 'data.dart';

part 'deck.freezed.dart';
part 'deck.g.dart';

enum SyncIssues {
  none,
  local,
  remote,
  both,
}

enum DeckSaveState {
  isNew,
  isChanged,
  isSaved,
}

mixin DeckNotifierMixin {
  String get id;
  String get identityCode;
  String? get mwlCode;
  String get name;
  String get description;
  DateTime get created;
  DateTime get updated;
  DateTime? get remoteUpdated;
  Map<String, int> get cards;
  List<String> get tags;
  DeckSaveState get state;

  NrdbDeck toNrdbDeck() => NrdbDeck(
        id: remoteUpdated == null ? '' : id,
        name: name,
        description: description,
        mwlCode: mwlCode,
        dateCreation: created,
        dateUpdate: updated,
        cards: {
          identityCode: 1,
          ...cards,
        },
        tags: tags,
      );
}

@freezed
class DeckData with _$DeckData, DeckToColumns, DataMixin {
  const DeckData._();

  const factory DeckData({
    required String id,
    required String identityCode,
    required String? formatCode,
    required String? rotationCode,
    required String? mwlCode,
    required String name,
    required String description,
    required DateTime created,
    required DateTime updated,
    required bool deleted,
    required DateTime? remoteUpdated,
    required DateTime? synced,
  }) = _DeckData;

  @With<DeckNotifierMixin>()
  const factory DeckData.notifier({
    required String id,
    required String identityCode,
    required String? formatCode,
    required String? rotationCode,
    required String? mwlCode,
    required String name,
    required String description,
    required DateTime created,
    required DateTime updated,
    required bool deleted,
    required DateTime? remoteUpdated,
    required DateTime? synced,
    required Map<String, int> cards,
    required List<String> tags,
    required DeckSaveState state,
  }) = DeckNotifierData;

  factory DeckData.fromJson(Map<String, dynamic> json) => _$DeckDataFromJson(json);

  SyncIssues syncIssues([DateTime? remoteUpdated]) {
    final hasLocalChanges = synced != null && updated != synced;
    final hasRemoteChanges = synced != null && synced != (remoteUpdated ?? this.remoteUpdated);
    if (hasLocalChanges && hasRemoteChanges) {
      return SyncIssues.both;
    } else if (hasLocalChanges) {
      return SyncIssues.local;
    } else if (hasRemoteChanges) {
      return SyncIssues.remote;
    } else {
      return SyncIssues.none;
    }
  }
}
Map<CardResult, int> cardsFromJson(List<Object> value) => value
    .map((e) => MapEntry(
          CardResult.fromJson((e as Map).cast()),
          e['count'] as int,
        ))
    .toMap();
List<Object> cardsToJson(Map<CardResult, int> value) => value.entries
    .map((e) => {
          ...e.key.toJson(),
          'count': e.value,
        })
    .toList();

mixin DeckFullResultMixin {
  DeckData get deck;
  CardData get identity;
  PackData get pack;
  CycleData get cycle;
  FactionData get faction;
  SideData get side;
  TypeData get type;
  TypeData? get subtype;
  FormatData? get format;
  RotationViewData? get rotation;
  MwlViewData? get mwl;
  Map<CardResult, int> get cards;
  List<String> get tags;

  DeckNotifierData toNotifierResult(DeckSaveState state) {
    return DeckNotifierData(
      id: deck.id,
      identityCode: deck.identityCode,
      formatCode: deck.formatCode,
      rotationCode: deck.rotationCode,
      mwlCode: deck.mwlCode,
      name: deck.name,
      description: deck.description,
      created: deck.created,
      updated: deck.updated,
      deleted: deck.deleted,
      remoteUpdated: deck.remoteUpdated,
      synced: deck.synced,
      cards: cards.map((key, value) => MapEntry(key.card.code, value)),
      tags: tags,
      state: state,
    );
  }

  DeckCompareResult toDeckCompare() => DeckCompareResult(
        id: deck.id,
        name: deck.name,
        cards: cards.map((key, value) => MapEntry(key.card.code, value)),
      );
}

@freezed
class DeckResult with _$DeckResult, DataMixin {
  const DeckResult._();

  const factory DeckResult({
    required DeckData deck,
    required CardData identity,
    required PackData pack,
    required CycleData cycle,
    required FactionData faction,
    required SideData side,
    required TypeData type,
    required TypeData? subtype,
    required FormatData? format,
    required RotationViewData? rotation,
    required MwlViewData? mwl,
  }) = _DeckResult;

  @With<DeckFullResultMixin>()
  const factory DeckResult.full({
    required DeckData deck,
    required CardData identity,
    required PackData pack,
    required CycleData cycle,
    required FactionData faction,
    required SideData side,
    required TypeData type,
    required TypeData? subtype,
    required FormatData? format,
    required RotationViewData? rotation,
    required MwlViewData? mwl,
    @JsonKey(fromJson: cardsFromJson, toJson: cardsToJson) required Map<CardResult, int> cards,
    required List<String> tags,
  }) = DeckFullResult;

  factory DeckResult.fromJson(Map<String, dynamic> json) => _$DeckResultFromJson(json);

  DeckFullResult toFullResult({
    Map<CardResult, int> cards = const {},
    List<String> tags = const [],
  }) =>
      DeckFullResult(
        deck: deck,
        identity: identity,
        pack: pack,
        cycle: cycle,
        faction: faction,
        side: side,
        type: type,
        subtype: subtype,
        format: format,
        rotation: rotation,
        mwl: mwl,
        cards: cards,
        tags: tags,
      );

  CardResult toCard() {
    return CardResult(
      card: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
    );
  }
}

@freezed
class DeckCompareResult with _$DeckCompareResult, DataMixin {
  const factory DeckCompareResult({
    required String id,
    required String name,
    required Map<String, int> cards,
  }) = _DeckCompareResult;

  factory DeckCompareResult.fromJson(Map<String, dynamic> json) => _$DeckCompareResultFromJson(json);
}
