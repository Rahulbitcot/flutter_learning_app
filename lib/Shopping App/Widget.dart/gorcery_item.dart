import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Shopping%20App/Widget.dart/new_item.dart';
import 'package:flutter_learning_app/Shopping%20App/data/categories.dart';
import 'package:flutter_learning_app/Shopping%20App/model/grocery.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItem = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    final url = Uri.https(
        "flutter-learning-app-b4787-default-rtdb.firebaseio.com",
        "Shopping-list.json");
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      setState(() {
        _error = "Some Error occurred Please Try Again Later";
      });
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> _loadedItem = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value["category"])
          .value;
      _loadedItem.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }

    setState(() {
      _groceryItem = _loadedItem;
      _isLoading = false;
    });
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItem.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    var index = _groceryItem.indexOf(item);
    setState(() {
      _groceryItem.remove(item);
    });
    final url = Uri.https(
        "flutter-learning-app-b4787-default-rtdb.firebaseio.com",
        "Shopping-list/${item.id}.json");
    final response = await http.delete(url);

    setState(() {
      if (response.statusCode >= 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong please try again "),
          ),
        );
        _groceryItem.insert(index, item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        "No item Added",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_groceryItem.isEmpty) {
      content = ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItem[index].id),
          onDismissed: (direction) => {
            _removeItem(_groceryItem[index]),
          },
          child: ListTile(
            title: Text(_groceryItem[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItem[index].category.color,
            ),
            trailing: Text(
              _groceryItem[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(
          _error!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: content);
  }
}
