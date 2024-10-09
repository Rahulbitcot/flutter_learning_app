import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Expenses/model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$${expense.amount.toString()}",
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(CategoryIcon[expense.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(expense.formattedDate),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
