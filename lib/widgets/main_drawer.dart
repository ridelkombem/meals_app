import 'package:flutter/material.dart';
import '../widgets/build_drawer_list.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.onSelectScreen,
  }) : super(key: key);
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood,size: 48,color: Theme.of(context).colorScheme.primary),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildListTile(
              icon: Icons.restaurant,
              title: 'Meals',
              onTap: () {
                // Navigator.pushReplacementNamed(context, TabsScreen.routename);
                onSelectScreen('meals');
              }),
          BuildListTile(
              icon: Icons.settings,
              title: 'Filters',
              onTap: () {
                onSelectScreen('filters');
                // Navigator.pushReplacementNamed(context, FilterScreen.routename);
              })
        ],
      ),
    );
  }
}


