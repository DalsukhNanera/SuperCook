import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import './meal.dart';

class tabs_screen extends StatefulWidget {

  static const routename = '/tabsscreen';
  

  @override
  State<tabs_screen> createState() => _tabs_screenState();
}

class _tabs_screenState extends State<tabs_screen> {
  List<Meal> favouriteitem = [];
  
  @override
  Widget build(BuildContext context) {
    final List<Meal> favouriteitem = ModalRoute.of(context)!.settings.arguments as List<Meal> ;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('supercook'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favourite',
              ),
            ]),
          ),
          body: TabBarView(children: [category_screen(), favourite_screen(favouriteitem)]),
          drawer: main_drawer(favourites: favouriteitem),
        ));
  }
}
