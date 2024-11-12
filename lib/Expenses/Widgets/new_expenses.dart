import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_learning_app/Expenses/model/expense.dart';

final formatter = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpenses});

  final void Function(Expense expenses) onAddExpenses;
  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == 0 || enteredAmount == null;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please Enter Valid Amount , Title or Date"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"))
          ],
        ),
      );
      return;
    }
    widget.onAddExpenses(
      Expense(
          title: _titleController.text,
          amount: enteredAmount.toString(),
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  label: Text(
                "Title",
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
              maxLength: 50,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    maxLength: 15,
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? "Selected Date"
                            : formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                DropdownButton(
                  padding: const EdgeInsets.all(5),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (values) {
                    if (values == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = values;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
