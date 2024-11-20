import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Shopping%20App/data/categories.dart';
import 'package:flutter_learning_app/Shopping%20App/model/category.dart';
import 'package:flutter_learning_app/Shopping%20App/model/grocery.dart';

import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _FormKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];
  var _isSending = false;

  void _saveItem() async {
    if (!_FormKey.currentState!.validate()) {
      return;
    }
    _FormKey.currentState!.save();
    _isSending = true;
    final url = Uri.https(
        "flutter-learning-app-b4787-default-rtdb.firebaseio.com",
        "Shopping-list.json");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory!.title,
        },
      ),
    );
    print(response);
    final Map<String, dynamic> resData = jsonDecode(response.body);
    if (!context.mounted) {
      return;
    }
    if (_FormKey.currentState != null) {
      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar.new(
        title: Text("Add a new item"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                validator: (Value) {
                  if (Value == null ||
                      Value.trim().length <= 1 ||
                      Value.length >= 51) {
                    return "Please Enter Valid Name";
                  }
                  return null;
                },
                onSaved: (newValue) => {_enteredName = newValue!},
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          "Quantity",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Please Enter Valid Quantity";
                        }
                        return null;
                      },
                      initialValue: "1",
                      onSaved: (newValue) => {
                        _enteredQuantity = int.parse(newValue!),
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            _FormKey.currentState!.reset();
                          },
                    child: Text("Reset"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: const CircularProgressIndicator(),
                          )
                        : Text("Submit"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
