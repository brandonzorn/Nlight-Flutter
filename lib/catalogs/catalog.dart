import 'package:nlight/items/search_params.dart';

import '../items/manga_items.dart';

abstract class Catalog {
  Future<List<Manga>> searchManga(SearchParams form) async {
    return [];
  }

  Future<List<Chapter>> getChapters(Manga manga) async {
    return [];
  }

  Future<List<Image>> getImages(Chapter chapter) async {
    return [];
  }
}