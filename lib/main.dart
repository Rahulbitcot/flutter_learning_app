import 'package:flutter/material.dart';
import 'package:flutter_learning_app/APIIntegration/random_user_api.dart';
import 'package:flutter_learning_app/Expenses/Widgets/expenses.dart';
import 'package:flutter_learning_app/GroupChatApp/current_user.dart';
import 'package:flutter_learning_app/MealApp/tab.dart';
import 'package:flutter_learning_app/Places/screens/places.dart';
import 'package:flutter_learning_app/QR%20Scanner/qr_main.dart';
import 'package:flutter_learning_app/QuizApp/quiz.dart';
import 'package:flutter_learning_app/Shopping%20App/shopping_main.dart';
import 'package:flutter_learning_app/UIDesign/ui.dart';
import 'package:flutter_learning_app/WeatherApp/weather_main.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFF4A3A3),
);
void main() {
  runApp(MaterialApp(
    theme: theme,
    home: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 30,
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
                  height: 30,
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
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tabs(),
                      ),
                    );
                  },
                  child: const Text("Meal App"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrentUser(),
                      ),
                    );
                  },
                  child: const Text("Group Chat App"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRScannerMain(),
                      ),
                    );
                  },
                  child: const Text("QR Scanner App"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ui(),
                      ),
                    );
                  },
                  child: const Text("Ui Design"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherMain(),
                      ),
                    );
                  },
                  child: const Text("Weather App"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingMain(),
                      ),
                    );
                  },
                  child: const Text("Shopping List"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacesScreen(),
                      ),
                    );
                  },
                  child: const Text("Favorite Places"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
