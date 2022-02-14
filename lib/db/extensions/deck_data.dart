//import 'package:drift/drift.dart';

// import '/util/nrdb.dart';
import '../database.dart';

extension DeckDataEx on DeckData {
  // DeckData copyFrom(NrdbDeck nrdbDeck) {
  //   return copyWith(
  //     id: formatNrdbId(nrdbDeck.id),
  //     name: nrdbDeck.name,
  //     description: nrdbDeck.description,
  //     mwlCode: Value(nrdbDeck.mwlCode),
  //     updated: nrdbDeck.dateUpdate,
  //     lastSynced: Value(nrdbDeck.dateUpdate),
  //   );
  // }

  int? get nrdbId => null;//parseNrdbId(id);
}