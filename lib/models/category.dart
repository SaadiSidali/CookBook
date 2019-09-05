import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final IconData icon;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
    this.icon=MdiIcons.food,
  });
}
