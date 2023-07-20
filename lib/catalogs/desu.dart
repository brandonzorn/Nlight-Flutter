import 'package:nlight/catalogs/catalog.dart';
import 'package:nlight/utils/net.dart';

import '../items/manga_items.dart';
import '../items/search_params.dart';

class Desu extends Catalog{
  @override
  Future<List<Manga>> searchManga(SearchParams form) async{
    List<Manga> mangas = [];

    var params = {"limit": "50", "page": "${form.page}", "search": form.searchQuery, "order": "popular"};
    final url = Uri(scheme: "https", host: "desu.me", path: "manga/api/", queryParameters: params);

    final response = await getHtml(url, contentType: "json");

    if (response != null) {
      for (var mangaData in response["response"]) {
        var contentId = mangaData['id'].toString();
        var manga = Manga(contentId, 0);
        manga.addName('all', mangaData['name']);
        manga.addName('ru', mangaData['russian']);
        manga.addDescription("all", mangaData['description']);
        mangas.add(manga);
      }
    }
    return mangas;
  }
}
