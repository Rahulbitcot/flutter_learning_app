import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning_app/APIIntegration/service/user_api.dart';
import 'package:flutter_learning_app/APIIntegration/u.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomUserApi extends StatefulWidget {
  const RandomUserApi({super.key});

  @override
  State<RandomUserApi> createState() => _RandomUserApiState();
}

class _RandomUserApiState extends State<RandomUserApi> {
  List<user> users = [];

  @override
  void initState() {
    super.initState();
    getUserFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 141, 232),
        title: const Center(
            child: Text(
          "Rest Api",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text("${user.name.first} ${user.name.last}"),
              subtitle: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  Future<void> fetchUsers() async {
    try {
      final response = await UserApi.fetchUser();
      setState(() {
        users = response;
      });

      List<String> userStrings =
          users.map((user) => jsonEncode(user.toJson())).toList();

      final pref = await SharedPreferences.getInstance();
      await pref.setStringList("UserList", userStrings);
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  void getUserFromDb() async {
    final pref = await SharedPreferences.getInstance();
    List<String>? userStrings = pref.getStringList("UserList");

    if (userStrings != null) {
      // Convert each JSON string back to a user object
      users = userStrings.map((userString) {
        Map<String, dynamic> userJson = jsonDecode(userString);
        return user.fromJson(userJson);
      }).toList();
      setState(
          () {}); // Refresh the UI after loading users from SharedPreferences
    } else {
      print("No users found in SharedPreferences");
    }
  }
}
