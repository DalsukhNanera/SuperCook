import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/meal.dart';
import './main_drawer.dart';

class filter_screen extends StatefulWidget {
  static const RouteName = '/filter_screen';
  final Function filter;
  final Map<String, bool> ok;
  List<Meal> favouriteitem ;

  filter_screen(this.filter, this.ok ,this.favouriteitem);

  @override
  State<filter_screen> createState() => _filter_screenState();
}

class _filter_screenState extends State<filter_screen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  initState() {
    _glutenFree = widget.ok['glutenfree'] ?? false;
    _lactoseFree = widget.ok['lactose'] ?? false;
    _vegetarian = widget.ok['vegetarian'] ?? false;
    _vegan = widget.ok['vegan'] ?? false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('your filters'),
        actions: [
          IconButton(
              onPressed: (() {
                final Map<String, bool> data = {
                  'glutenfree': _glutenFree,
                  'lactosefree': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.filter(data);
              }),
              icon: Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                'Adjust Your Meal Selection'),
          ),
          SizedBox(
            height: 10,
          ),
          SwitchListTile(
              activeColor: Colors.amber,
              title: Text('glutenFree'),
              subtitle: Text('Only include lactose-free meals.'),
              value: _glutenFree,
              onChanged: ((value) => setState(() {
                    _glutenFree = value;
                  }))),
          SwitchListTile(
              activeColor: Colors.amber,
              title: Text('vegetarian'),
              subtitle: Text('Only include vegetarian-free meals.'),
              value: _vegetarian,
              onChanged: ((value) => setState(() {
                    _vegetarian = value;
                  }))),
          SwitchListTile(
              activeColor: Colors.amber,
              title: Text('vegan'),
              subtitle: Text('Only include vegan-free meals.'),
              value: _vegan,
              onChanged: ((value) => setState(() {
                    _vegan = value;
                  }))),
          SwitchListTile(
              activeColor: Colors.amber,
              title: Text('lactosefree'),
              subtitle: Text('Only include lactose-free meals.'),
              value: _lactoseFree,
              onChanged: ((value) => setState(() {
                    _lactoseFree = value;
                  }))),
        ],
      ),
      drawer: main_drawer(favourites: widget.favouriteitem,),
    );
  }
}
