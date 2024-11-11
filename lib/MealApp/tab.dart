import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/categories_screen.dart';
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

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPage = 0;
  List<Meal> favoriteList = [];

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
    Widget activePage = CategoriesScreen(
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

    void _setScreen(String identifier) {
      Navigator.pop(context);
      if (identifier == 'filter') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Filter()));
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
