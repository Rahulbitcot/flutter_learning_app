import 'package:flutter_learning_app/Shopping%20App/data/categories.dart';
import 'package:flutter_learning_app/Shopping%20App/model/category.dart';
import 'package:flutter_learning_app/Shopping%20App/model/grocery.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
