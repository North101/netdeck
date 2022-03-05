import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/header_list.dart';

final cardGalleryIndexProvider = StateProvider<int?>((ref) => throw UnimplementedError());

final cardGalleryGroupedCardListProvider = Provider<Stream<HeaderList<CardResult>>>((ref) => throw UnimplementedError());
