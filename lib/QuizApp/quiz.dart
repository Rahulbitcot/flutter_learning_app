import 'package:flutter/material.dart';
import 'package:flutter_learning_app/QuizApp/question_screen.dart';
import 'package:flutter_learning_app/QuizApp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 2, 5, 20), Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}
