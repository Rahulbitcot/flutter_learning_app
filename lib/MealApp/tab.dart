import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/categories_screen.dart';
import 'package:flutter_learning_app/MealApp/data/dummy_data.dart';
import 'package:flutter_learning_app/MealApp/filter.dart';
import 'package:flutter_learning_app/MealApp/models/meal.dart';
import 'package:flutter_learning_app/MealApp/widget/main_drawer.dart';
import 'package:flutter_learning_app/MealApp/widget/meals.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

const Map<FilterEnum, bool> KantianMeal = {
  FilterEnum.glutenFree: false,
  FilterEnum.lactoseFree: false,
  FilterEnum.vegetarian: false,
  FilterEnum.vegan: false
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPage = 0;
  List<Meal> favoriteList = [];
  Map<FilterEnum, bool> _selectedMeal = KantianMeal;

  void onSelect(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onToggleMealFavorite(Meal meal) {
    setState(() {
      if (favoriteList.contains(meal)) {
        favoriteList.remove(meal);
        _showSnackBar("Remove From Favorite");
      } else {
        favoriteList.add(meal);
        _showSnackBar("Add to Favorite");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final available_meal = dummyMeals.where((meal) {
      if (_selectedMeal[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedMeal[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedMeal[FilterEnum.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedMeal[FilterEnum.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeal: available_meal,
      onToggleMealFavorite: _onToggleMealFavorite,
    );

    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      activePage = Meals(
        meal: favoriteList,
        onToggleMealFavorite: _onToggleMealFavorite,
      );
      activePageTitle = 'Your Favorite';
    }

    void _setScreen(String identifier) async {
      Navigator.pop(context);
      if (identifier == 'filter') {
        var result = await Navigator.of(context).push<Map<FilterEnum, bool>>(
            MaterialPageRoute(builder: (context) => const Filter()));
        setState(() {
          _selectedMeal = result ?? KantianMeal;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: onSelect,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
