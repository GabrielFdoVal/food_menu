import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoritveScreen(),
  ];

  final List<String> _titulo = [
    "Lista de Categorias",
    "Meus Favoritos",
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titulo[_selectedScreenIndex]),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritos",
            ),
          ],
        ),
      ),
    );
  }
}
