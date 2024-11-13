import 'package:flutter/material.dart';

enum FilterEnum { glutenFree, lactoseFree, vegetarian, vegan }

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactosFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            FilterEnum.glutenFree: _isGlutenFree,
            FilterEnum.lactoseFree: _isLactosFree,
            FilterEnum.vegetarian: _isVegetarian,
            FilterEnum.vegan: _isVegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFree,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked) {
                    _isGlutenFree = true;
                  } else {
                    _isGlutenFree = false;
                  }
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include Gluten-Free Meal",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 20),
            ),
            SwitchListTile(
              value: _isVegan,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked) {
                    _isVegan = true;
                  } else {
                    _isVegan = false;
                  }
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include Vegan Meal",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 20),
            ),
            SwitchListTile(
              value: _isVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked) {
                    _isVegetarian = true;
                  } else {
                    _isVegetarian = false;
                  }
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include Vegetarian Meal",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 20),
            ),
            SwitchListTile(
              value: _isLactosFree,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked) {
                    _isLactosFree = true;
                  } else {
                    _isLactosFree = false;
                  }
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include Lactose-Free Meal",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
