import 'package:cook_book/screens/categories_screen.dart';
import 'package:cook_book/screens/favorites_screen.dart';
import 'package:cook_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your favorites',
    },
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 15,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        //type:
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.food,
              ),
              title: Text(
                'Categories',
              )),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.star),
              title: Text(
                'Favourites',
              )),
        ],
      ),
    );
  }
}
