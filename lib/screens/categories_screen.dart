import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imgUrl(String id) {
      String temp;
      for (int i = 0; i < DUMMY_MEALS.length; i++) {
        for (var cat in DUMMY_MEALS[i].categories) {
          if (cat == id) {
            temp = DUMMY_MEALS[i].imageUrl;
          }
        }
      }
      
      return temp;
    }

    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color,
                catData.icon, imgUrl(catData.id)),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
