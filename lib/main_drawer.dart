import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/filter_screen.dart';
import 'package:supercook/meal.dart';
import 'package:supercook/tabs_screen.dart';

class main_drawer extends StatelessWidget {
  final List<Meal> favourites ;

  main_drawer({ required this.favourites});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            color: Colors.purple,
            child: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                'cooking up!!!'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                'meals'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              tabs_screen.routename, arguments: favourites,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                'filter'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              filter_screen.RouteName,arguments: favourites,
            ),
          ),
        ],
      ),
    );
  }
}
