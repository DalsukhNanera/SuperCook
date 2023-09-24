import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/category_screen.dart';
import 'package:supercook/favourite_screen.dart';
import 'package:supercook/meal.dart';

class another_tab_screen extends StatefulWidget {
    final List<Meal> favouriteitem ;
    another_tab_screen(this.favouriteitem);

  @override
  State<another_tab_screen> createState() => _another_tab_screenState();
}

class _another_tab_screenState extends State<another_tab_screen> {
  int selectedindex = 0;

    List<Map<String, dynamic>> ? _items;

  @override
  void initState() {
  _items =  [
    {'screen': category_screen(), 'title': 'category'},
    {'screen': favourite_screen(widget.favouriteitem), 'title': 'favourite'},
  ];
    super.initState();
  }

  void selecthendler(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_items![selectedindex]['title']),
      ),
      body: _items![selectedindex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 196, 24, 226),
          onTap: selecthendler,
          currentIndex: selectedindex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favourite'),
          ]),
    );
  }
}
