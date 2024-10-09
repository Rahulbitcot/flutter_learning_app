import 'package:flutter/material.dart';
import 'package:flutter_learning_app/QuizApp/answer_button.dart';
import 'package:flutter_learning_app/QuizApp/data/questions.dart';
import 'package:flutter_learning_app/QuizApp/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  final List<String> selectedAnswer = [];
  Widget? currentState;

  @override
  void initState() {
    currentState = const QuestionScreen();
    super.initState();
  }

  answerQuestion(String answer) {
    setState(() {
      if (currentQuestionIndex != questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer.add(answer);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(selectedAnswer),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
