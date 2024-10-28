import 'package:flutter/material.dart';
import 'package:flutter_learning_app/APIIntegration/random_user_api.dart';
import 'package:flutter_learning_app/Expenses/Widgets/expenses.dart';
import 'package:flutter_learning_app/MealApp/meal_main.dart';
import 'package:flutter_learning_app/QuizApp/quiz.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFF4A3A3),
);
void main() {
  runApp(const MaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 2, 5, 20), Colors.deepPurple],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Quiz(),
                        ),
                      );
                    },
                    child: const Text("Quiz App"),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Expenses(),
                        ),
                      );
                    },
                    child: const Text("Expense Tracker App"),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RandomUserApi(),
                        ),
                      );
                    },
                    child: const Text("Random User Api"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MealMain(),
                        ),
                      );
                    },
                    child: const Text("Meal App"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
