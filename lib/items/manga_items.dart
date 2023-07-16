import 'package:flutter/foundation.dart';

class Manga {
  late String id;
  late String contentId;
  late int catalogId;
  late Map<String, String> names;
  late Map<String, String> descriptions;

  Manga(this.contentId, this.catalogId) {
    id = "$catalogId|$contentId";
    names = <String, String>{};
    descriptions = <String, String>{};
  }

  void addName(String lang, String name) {
    if (names.containsKey("lang")) {
      if (kDebugMode) {
        print("Name with lang: $lang already exists");
      }
    }
    else {
      names.addAll({lang: name});
    }
  }

  void addDescription(String lang, String description) {
    if (descriptions.containsKey("lang")) {
      if (kDebugMode) {
        print("Description with lang: $lang already exists");
      }
    }
    else {
      descriptions.addAll({lang: description});
    }
  }

  String? getName() {
    if (names.containsKey('ru')) {
      return names['ru'];
    }
    return names['all'];
  }

  String? getDescription() {
    if (descriptions.containsKey('ru')) {
      return descriptions['ru'];
    }
    return descriptions['all'];
  }
}


class Chapter {
  late String id;
  late String contentId;
  late int catalogId;
  late String? vol;
  late String? ch;
  late String? title;

  Chapter(this.contentId, this.catalogId, this.vol, this.ch, this.title) {
    id = "$catalogId|$contentId";
  }

  String? getName() {
    var name = "";
    if (vol != null) {
      name += vol.toString();
    }
    if (ch != null) {
      name += ch.toString();
    }
    if (title != null) {
      name += title.toString();
    }
    return name;
  }
}


class Image {
  late String id;
  late String contentId;
  late int catalogId;
  late int page;
  late String imgUrl;

  Image(this.contentId, this.catalogId, this.page, this.imgUrl) {
    id = "$catalogId|$contentId";
  }
}