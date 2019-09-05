import 'package:cook_book/screens/category_meals_screen.dart';
import 'package:cook_book/screens/filters_screen.dart';
import 'package:cook_book/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MainDrawer extends StatelessWidget {
  void selectCategory(BuildContext ctx, String id, String title) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              color: Colors.redAccent,
            ),

            InkWell(
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
              child: Container(
                height: 80,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName),
              child: Container(
                height: 80,
                color: Colors.grey[900],
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filters',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            // ...DUMMY_CATEGORIES
            //     .map(
            //       (catData) => Column(
            //         children: <Widget>[
            //           InkWell(
            //             onTap: () {
            //               selectCategory(context, catData.id, catData.title);
            //             },
            //             child: Container(
            //               height: 80,
            //               child: Row(
            //                 children: <Widget>[
            //                   SizedBox(
            //                     width: 10,
            //                   ),
            //                   Icon(
            //                     catData.icon,
            //                     color: catData.color,
            //                   ),
            //                   SizedBox(
            //                     width: 10,
            //                   ),
            //                   Text(
            //                     catData.title,
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .title
            //                         .copyWith(color: catData.color, shadows: [
            //                       //Shadow(color: Colors.black, blurRadius: 2)
            //                     ]),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Divider(
            //             color: Colors.black.withOpacity(.3),
            //           )
            //         ],
            //       ),
            //     )
            //     .toList(),
          ],
        ),
      ),
    );
  }
}
