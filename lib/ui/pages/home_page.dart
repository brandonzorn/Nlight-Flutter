import 'package:flutter/material.dart';
import 'package:nlight/items/search_params.dart';

import '../../catalogs/desu.dart';
import '../../catalogs/catalog.dart';
import '../../items/manga_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Catalog catalog = Desu();
  SearchParams params = SearchParams();

  late Future<List<Manga>> _mangas;

  @override
  void initState() {
    super.initState();
    _fetchManga();
  }

  void _fetchManga() {
    _mangas = catalog.searchManga(params);
  }

  void _incrementCounter() async {
    params.page++;
    setState(() {
      _fetchManga();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FutureBuilder<List<Manga>>(
          future: _mangas,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(snapshot.data[index].getName().toString());
                  });
            }
          }),),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
