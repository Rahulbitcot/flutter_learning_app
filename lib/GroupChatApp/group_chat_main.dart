import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_app/GroupChatApp/chat_screen.dart';

class GroupChatMain extends StatefulWidget {
  const GroupChatMain({super.key});

  @override
  _GroupChatMainState createState() => _GroupChatMainState();
}

class _GroupChatMainState extends State<GroupChatMain> {
  final TextEditingController nameTextController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    nameTextController.dispose();
    super.dispose();
  }

  Future<void> createUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final userName = nameTextController.text.trim();
    final String id;

    if (userName.isNotEmpty) {
      try {
        // Add the user document and get the document reference
        final userDocRef =
            await FirebaseFirestore.instance.collection('users').add({
          'name': userName,
          'createdAt': Timestamp.now(),
        });

        // Update the document with the generated ID
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userDocRef.id)
            .update({
          'id': userDocRef.id,
        });

        id = userDocRef.id;

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created successfully!')),
        );

        // Clear the text field after submission
        setState(() {
          nameTextController.clear();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(id: id, userName: userName),
            ),
          );
        });
      } catch (e) {
        // Show error message if adding user to Firestore fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create user: $e')),
        );
      }
    } else {
      // Show error message if name input is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FireStore Group Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Your Name To Start Chat",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: nameTextController,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  labelStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.all(20),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: createUser,
              child: const Text(
                "Submit",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
