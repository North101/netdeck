import '/db/database.dart';

enum SyncIssues {
  none,
  local,
  remote,
  both,
}

extension DeckDataEx on DeckData {
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
