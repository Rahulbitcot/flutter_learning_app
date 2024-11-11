import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/data/dummy_data.dart';
import 'package:flutter_learning_app/MealApp/models/category.dart';
import 'package:flutter_learning_app/MealApp/models/meal.dart';
import 'package:flutter_learning_app/MealApp/widget/category_grid_item.dart';
import 'package:flutter_learning_app/MealApp/widget/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleMealFavorite});

  final void Function(Meal meal) onToggleMealFavorite;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Meals(
          title: category.title,
          meal: filteredMeal,
          onToggleMealFavorite: onToggleMealFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectedCategory: () {
                    _selectedCategory(context, category);
                  })
          ],
        ),
      ),
    );
  }
}
