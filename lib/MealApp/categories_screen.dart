import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/data/dummy_data.dart';
import 'package:flutter_learning_app/MealApp/models/category.dart';
import 'package:flutter_learning_app/MealApp/models/meal.dart';
import 'package:flutter_learning_app/MealApp/widget/category_grid_item.dart';
import 'package:flutter_learning_app/MealApp/widget/meals.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen(
      {super.key, this.availableMeal, required this.onToggleMealFavorite});

  final void Function(Meal meal) onToggleMealFavorite;
  final List<Meal>? availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = widget.availableMeal!
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Meals(
          title: category.title,
          meal: filteredMeal,
          onToggleMealFavorite: widget.onToggleMealFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Scaffold(
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
      ),
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 200 - _animationController.value * 200),
        child: child,
      ),
    );
  }
}
