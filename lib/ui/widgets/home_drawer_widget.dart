import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favourite'),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Shikimori'),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {Navigator.pop(context);},
            ),
          ],
        )
    );
  }
}
