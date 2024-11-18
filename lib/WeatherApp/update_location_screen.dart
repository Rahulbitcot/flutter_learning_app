import 'package:flutter/material.dart';

class UpdateLocationScreen extends StatefulWidget {
  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(211, 27, 81, 97),
      appBar: AppBar(
        title: Text("Update Location"),
        backgroundColor: const Color.fromARGB(89, 0, 140, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Enter Location",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _locationController.text);
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
