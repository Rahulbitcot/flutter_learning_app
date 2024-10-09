import 'package:flutter/material.dart';
import 'package:flutter_learning_app/QuizApp/data/questions.dart';
import 'package:flutter_learning_app/QuizApp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.selectedAnswer, {super.key});
  final List<String> selectedAnswer;
  final List<Map<String, Object>> summary = [];
  List<Map<String, Object>> getSummaryData() {
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswer[i]
      });
    }
    return summary;
  }

  int numberOfCorrectAns() {
    int correctAnsCount = 0;
    for (var i = 0; i < selectedAnswer.length; i++) {
      if (selectedAnswer[i] == questions[i].answers[0]) {
        correctAnsCount++;
      }
    }
    return correctAnsCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 55, 163),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You Answered ${numberOfCorrectAns()} out ${selectedAnswer.length} Correct answer",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                QuestionSummary(getSummaryData()),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Restart Quiz",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
