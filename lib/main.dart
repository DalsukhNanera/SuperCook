import 'package:flutter/material.dart';
import 'package:supercook/filter_screen.dart';
import 'package:supercook/login_screen.dart';
import 'package:supercook/registration_screen.dart';
import 'package:supercook/welcome_screen.dart';
import 'another_tab_screen.dart';
import 'package:supercook/category_meal_screen.dart';
import 'package:supercook/category_screen.dart';
import 'package:supercook/meal_detain_screen.dart';
import 'package:supercook/tabs_screen.dart';
import './dummy_data.dart';
import 'meal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyBNH6Lk4PKwQGClmyhNyPMXi6hRVoy0AdM",
      appId: "1:117861578572:android:fea0030fbd71ec0be801e9",
      messagingSenderId: "117861578572",
      projectId: "supercook-7ea00",
      storageBucket: null,
      databaseURL: null,
    ),);

    
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutenfree': false,
    'lactosefree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void setfilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['glutenfree']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactosefree']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void favouriteseeting(String id) {
    final index = _favoriteMeals.indexWhere((element) => element.id == id);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool isfavourite(String id)
  {
    return  _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

        home: WelcomeScreen(_favoriteMeals),

      routes: {
        WelcomeScreen.routename:(context) => WelcomeScreen(_favoriteMeals),
        LoginScreen.routename:(context) => LoginScreen(),
        RegistrationScreen.routename:(context) => RegistrationScreen(),
        tabs_screen.routename:(context) => tabs_screen(),
        category_meal_screen.Route: (context) =>
            category_meal_screen(_availableMeals),
        meal_detail_scree.Route: (context) => meal_detail_scree(favouriteseeting , isfavourite),
        filter_screen.RouteName: (context) =>
            filter_screen(setfilters, filters,_favoriteMeals),
            
      },
    );
  }
}
