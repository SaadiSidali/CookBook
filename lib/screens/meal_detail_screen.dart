import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$mealId'),
          bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings_cell),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings_cell),
                  onPressed: () {},
                ),
              ],
            ),
            preferredSize: Size.fromHeight(20),
          ),
        ),
        body: CustomScrollView());
  }
}
