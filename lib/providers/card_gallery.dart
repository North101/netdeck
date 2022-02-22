import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/header_list.dart';

final galleryCardIndexProvider = StateProvider<int?>((ref) => throw UnimplementedError());

final galleryGroupedCardListProvider = Provider<Stream<HeaderList<CardResult>>>((ref) => throw UnimplementedError());
