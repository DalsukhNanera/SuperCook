import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './dummy_data.dart';

class meal_detail_scree extends StatelessWidget {
  static const Route = '/meal_detail_screen';

  final Function selecthandler;
  final Function isfavourite;

  meal_detail_scree(this.selecthandler, this.isfavourite);

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('meal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(fit: BoxFit.cover, selectedmeal.imageUrl),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: const Text('ingrediants',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.grey)),
              height: 150,
              width: 300,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  color: Colors.yellow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedmeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: const Text('steps:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.grey)),
              height: 150,
              width: 300,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      // radius: 50,
                      child: Text('#${index + 1}'),
                    ),
                    title: Text(selectedmeal.steps[index]),
                  ),
                ),
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isfavourite(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => selecthandler(id),
      ),
    );
  }
}
