import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Expenses/expenses_list/expenses_item.dart';
import 'package:flutter_learning_app/Expenses/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpenses});

  final void Function(Expense expensesList) onRemoveExpenses;
  final List<Expense> expensesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expensesList[index]),
          onDismissed: (direction) {
            onRemoveExpenses(expensesList[index]);
          },
          child: ExpensesItem(expensesList[index])),
    );
  }
}
