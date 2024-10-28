import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/models/meal.dart';
import 'package:flutter_learning_app/MealApp/widget/media_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (context, index) => MediaItem(
        meal: meal[index],
      ),
    );

    if (meal.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "uh Oh...nothing here",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Try Selecting a Different category",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
