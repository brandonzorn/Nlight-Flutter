import 'package:flutter/material.dart';
import 'package:nlight/items/search_params.dart';

import '../../catalogs/desu.dart';
import '../../catalogs/parser.dart';
import '../../items/manga_items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  SearchParams params = SearchParams();

  late Future<List<Manga>> _mangas;

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() {
    Catalog catalog = Desu();
    _mangas = catalog.searchManga(params);
  }

  void _incrementCounter() async {
    if (_counter == 50) {
      params.page++;
      getContent();
      _counter = 0;
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FutureBuilder<List<Manga>>(
                future: _mangas,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        snapshot.data![_counter - 1].getName().toString());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: "Shikimori"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}
