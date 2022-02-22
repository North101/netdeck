import 'package:drift/drift.dart';

import '../database.dart';

extension DeckResultEx on DeckResult {
  DeckResult copyWith({
    DeckData? deck,
    Value<FormatData?> format = const Value.absent(),
    Value<RotationData?> rotation = const Value.absent(),
    Value<MwlData?> mwl = const Value.absent(),
  }) {
    return DeckResult(
      deck: (deck ?? this.deck).copyWith(
        formatCode: Value(format.present ? format.value?.code : (deck ?? this.deck).formatCode),
        mwlCode: Value(mwl.present ? mwl.value?.code : (deck ?? this.deck).mwlCode),
        rotationCode: Value(rotation.present ? rotation.value?.code : (deck ?? this.deck).rotationCode),
      ),
      identity: identity,
      pack: pack,
      cycle: cycle,
      faction: faction,
      side: side,
      type: type,
      subtype: subtype,
      format: format.present ? format.value : this.format,
      rotation: rotation.present ? rotation.value : this.rotation,
      mwl: mwl.present ? mwl.value : this.mwl,
    );
  }

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

  SyncIssues syncIssues([DateTime? remoteUpdated]) {
    final hasLocalChanges = deck.synced != null && deck.updated != deck.synced;
    final hasRemoteChanges = deck.synced != null && deck.synced != (remoteUpdated ?? deck.remoteUpdated);
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

enum SyncIssues {
  none,
  local,
  remote,
  both,
}