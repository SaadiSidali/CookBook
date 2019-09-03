import 'package:cook_book/screens/categories_screen.dart';
import 'package:cook_book/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cook Book'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen()
        ],),
      ),
    );
  }
}
