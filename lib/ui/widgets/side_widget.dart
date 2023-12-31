import 'package:flutter/material.dart';

class SideWidget extends StatelessWidget {
  const SideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        useIndicator: true,
        labelType: NavigationRailLabelType.all,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.favorite_outlined),
            selectedIcon: Icon(Icons.favorite),
            label: Text("Favourite"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text("Home"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.web_outlined),
            selectedIcon: Icon(Icons.web),
            label: Text("Shikimori"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: Text("History"),
          ),
        ],
        selectedIndex: 0);
  }
}
