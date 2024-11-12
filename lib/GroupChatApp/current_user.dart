import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_app/GroupChatApp/chat_screen.dart';
import 'package:flutter_learning_app/GroupChatApp/group_chat_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({super.key});

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  late SharedPreferences pref;
  late String? id;
  late String? name;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    pref = await SharedPreferences.getInstance();
    id = pref.getString("id");
    name = pref.getString("name");
    print("id :  $id  name : $name");
    if (id != null) {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      setState(
          () {}); // Refresh the UI after loading users from SharedPreferences
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No Chat Found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 236, 247),
      appBar: AppBar(
        title: Text("want to start new Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupChatMain(),
                  ),
                );
              },
              child: Text("New Chat"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      id: id,
                      userName: name,
                    ),
                  ),
                );
              },
              child: Text("Continue with previous chat"),
            )
          ],
        ),
      ),
    );
  }
}
