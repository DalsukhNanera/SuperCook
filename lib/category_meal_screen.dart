import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './meal_item.dart';

import './dummy_data.dart';
import './meal.dart';

class category_meal_screen extends StatelessWidget {
  static final Route = '/category_meal_screen';
  final List<Meal> availabale ;
  category_meal_screen(this.availabale);
  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routearg['title'];
    final id = routearg['id'];
     
    final selectedlist = availabale.where(
      (element) {
        return element.categories.contains(id);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return meal_item(
            affordability: selectedlist[index].affordability,
            complexity: selectedlist[index].complexity,
            time: selectedlist[index].duration,
            title: selectedlist[index].title,
            url: selectedlist[index].imageUrl,
            id: selectedlist[index].id
          );
        }),
        itemCount: selectedlist.length,
      ),
    );
  }
}
