import 'package:flutter/material.dart';

class AppPlaceScreen extends StatefulWidget {
  const AppPlaceScreen({super.key});

  @override
  State<AppPlaceScreen> createState() => _AppPlaceScreenState();
}

class _AppPlaceScreenState extends State<AppPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Place"),
      ),
      body: Form(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Enter Place"),
              ),
              maxLength: 50,
              controller: _titleController,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Add Place"),
            )
          ],
        ),
      )),
    );
  }
}
