import 'package:flutter/material.dart';
import 'package:supercook/category_meal_screen.dart';
import './category_meal_screen.dart';

class category_item extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  category_item(this.title, this.color, this.id);

  void movepage(BuildContext context) {
    Navigator.of(context).pushNamed(category_meal_screen.Route,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => movepage(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
