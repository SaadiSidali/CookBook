import 'package:cook_book/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const String backGround =
    'https://background-tiles.com/overview/white/patterns/large/1025.png';

class MealDetailScreen extends StatelessWidget {
  Widget sectionText(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        ' $title ',
        style: Theme.of(context).textTheme.title.copyWith(
            color: Colors.black87, decoration: TextDecoration.none),
      ),
    );
  }

  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${meal.title}'),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              child: Image.network(
                backGround,
                fit: BoxFit.scaleDown,
                repeat: ImageRepeat.repeat,
              ),
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 299,
                      width: double.infinity,
                      child: Image.network(meal.imageUrl, fit: BoxFit.cover),
                    ),
                    GestureDetector(
                      onTap: () => print(
                          'object'), //TODO implement videos right here or pics
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.white.withOpacity(0),
                              Colors.white
                            ],
                                stops: [
                              0.6,
                              1.1
                            ])),
                        height: 300,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ), //IMAGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shopping_basket),
                    sectionText(context, 'Ingrediants'),
                    Icon(MdiIcons.food)
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 300,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.brown)),
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => Column(
                        children: <Widget>[
                          Center(
                              heightFactor: 2,
                              child: Text(
                                meal.ingredients[i],
                                style:
                                    Theme.of(context).textTheme.title.copyWith(
                                          fontFamily: 'Muffin',
                                          color: Colors.black.withOpacity(.8),
                                          fontSize: 18,
                                        ),
                              )),
                          Container(
                            child: Divider(
                              color: Colors.black.withOpacity(.8),
                            ),
                            width: MediaQuery.of(context).size.width * .2,
                          )
                        ],
                      ),
                      itemCount: meal.ingredients.length,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.slow_motion_video),
                    sectionText(context, 'Steps'),
                    Icon(MdiIcons.stackExchange)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 3),
                      ]),
                  width: MediaQuery.of(context).size.width * .9,
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.yellow,
                              child: Text(
                                '#${i + 1}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Text(meal.steps[i]),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Divider()
                        ],
                      );
                    },
                    itemCount: meal.steps.length,
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
