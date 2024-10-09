import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['correct_answer'].toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 6, 255, 39),
                              fontSize: 10),
                        ),
                        Text(
                          data['user_answer'].toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 1, 255, 251),
                              fontSize: 10),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
