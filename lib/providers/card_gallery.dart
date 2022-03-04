import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';
import '/util/header_list.dart';

enum GalleryViewState {
  image,
  text,
}

final galleryCardIndexProvider = StateProvider<int?>((ref) => throw UnimplementedError());

final cardGalleryViewProvider = StateProvider((ref) => GalleryViewState.image);

final galleryGroupedCardListProvider = Provider<Stream<HeaderList<CardResult>>>((ref) => throw UnimplementedError());
