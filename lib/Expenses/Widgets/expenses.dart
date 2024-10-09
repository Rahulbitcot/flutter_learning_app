import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Expenses/Widgets/new_expenses.dart';
import 'package:flutter_learning_app/Expenses/expenses_list/expenses_list.dart';
import 'package:flutter_learning_app/Expenses/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter-Corse",
        amount: '16',
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: '100.6',
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpenses(onAddExpenses: _addExpenses));
  }

  void _addExpenses(Expense expenses) {
    setState(() {
      _registeredExpenses.add(expenses);
    });
  }

  void _onRemoveExpenses(Expense expenses) {
    final expenseIndex = _registeredExpenses.indexOf(expenses);
    setState(() {
      _registeredExpenses.remove(expenses);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expenses Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenses);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("Add Some Item to the expenses"));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expensesList: _registeredExpenses,
          onRemoveExpenses: _onRemoveExpenses);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("The Chart"),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
