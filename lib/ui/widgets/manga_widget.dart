import 'package:flutter/material.dart';

import '../../items/manga_items.dart';

class MangaWidget extends StatelessWidget {
  final Manga _manga;

  const MangaWidget(this._manga, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: Icon(Icons.error)),
        Text(_manga.getName().toString())
      ],
    );
  }
}
