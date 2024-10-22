import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_learning_app/APIIntegration/u.dart';

class UserApi {
  static Future<List<user>> fetchUser() async {
    const url = "https://randomuser.me/api/?results=50";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );

      return user(
        email: e['email'],
        gender: e['gender'],
        cell: e['cell'],
        phone: e['phone'],
        name: name,
      );
    }).toList();
    return users;
  }
}
