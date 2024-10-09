import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

const CategoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_land_sharp,
  Category.work: Icons.work,
};

final formatter = DateFormat.yMd();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = const Uuid().v4();

  final String id;
  final String title;
  final String amount;
  final DateTime date;

  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
