import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercook/meal.dart';
import './meal_item.dart';

class favourite_screen extends StatelessWidget {
  final List<Meal> favouriteitem;
  favourite_screen(this.favouriteitem);

  @override
  Widget build(BuildContext context) {
    return (favouriteitem.isEmpty)? Center(child: Text('their is no favourite start adding something'),) :
     ListView.builder(
        itemBuilder: ((context, index) {
          return meal_item(
            affordability: favouriteitem[index].affordability,
            complexity: favouriteitem[index].complexity,
            time: favouriteitem[index].duration,
            title: favouriteitem[index].title,
            url: favouriteitem[index].imageUrl,
            id: favouriteitem[index].id
          );
        }),
        itemCount: favouriteitem.length,
      ) ;
  }
}
