import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/meal.dart';
import 'package:supercook/meal_detain_screen.dart';
import './meal.dart';

class meal_item extends StatelessWidget {
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int time;
  final String url;
  final String id;

  meal_item(
      {required this.time,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.url,
      required this.id});

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(meal_detail_scree.Route, arguments: id);
  }

  String get complexitygetter {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;

      case Complexity.Challenging:
        return 'challengin';
        break;

      case Complexity.Hard:
        return 'hard';
        break;

      default:
        return 'unknown';
        break;
    }
  }

  String get Affordabilitygetter {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'luxuriuos';
        break;

      case Affordability.Pricey:
        return 'pricey';
        break;

      default:
        return 'unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectmeal(context),
        child: ClipRRect(
          // margin: EdgeInsets.all(10),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Colors.white,
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child:
                    Image.network(url, fit: BoxFit.cover),
                     ),
                    Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          color: Colors.black54,
                          width: 150,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [Icon(Icons.schedule), Text(time.toString())],
                      ),
                      Row(
                        children: [Icon(Icons.work), Text(complexitygetter)],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          Text(Affordabilitygetter)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
