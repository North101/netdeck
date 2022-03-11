import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/header_list.dart';
import 'deck.dart';

final cardGalleryIndexProvider = StateProvider<int?>((ref) => throw UnimplementedError());

final cardGalleryGroupedCardListProvider = Provider<HeaderList<CardResult>>((ref) => throw UnimplementedError());

final cardGalleryDeckProvider = StateNotifierProvider<DeckNotifier<DeckResult2?>, DeckResult2?>((ref) => throw UnimplementedError());
