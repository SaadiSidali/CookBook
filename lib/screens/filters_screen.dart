import 'package:cook_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  Widget _buildSwitchTile(
      String title, bool filter, String subTitle, Function updateValue) {
    return SwitchListTile(
      subtitle: Text(subTitle),
      title: Text(title),
      onChanged: updateValue,
      value: filter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: (AppBar(
        backgroundColor: Colors.black,
        title: Text('Filters'),
      )),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten Free',
                  _glutenFree,
                  'Only Includes Gluten Free Meals.',
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  _vegetarian,
                  'Only Includes Vegetarian Meals',
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  _vegan,
                  'Only Includes Vegan Meals.',
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Lactose Free',
                  _lactoseFree,
                  'Only Includes Lactose Free Meals.',
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
