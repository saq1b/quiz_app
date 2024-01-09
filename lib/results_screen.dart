import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatefulWidget {
  // why is super.key important?
  const ResultsScreen(
      {required this.chosenAnswers, required this.onRestart, super.key});

  final List<String> chosenAnswers;
  final Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  State<ResultsScreen> createState() {
    return _ResultsScreen();
  }
}

class _ResultsScreen extends State<ResultsScreen> {
  void onRestart() {
    widget.onRestart();
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = widget.getSummaryData();
    final numCorrect = summaryData.where((element) {
          return element['chosen_answer'] == element['correct_answer'];
        }).length,
        numTotalQuestions = questions.length;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'You answered $numCorrect questions out of $numTotalQuestions correctly.',
        style: const TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 114, 206, 255)),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 350,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuestionsSummary(
                summaryData: widget.getSummaryData(),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      OutlinedButton(
        onPressed: onRestart,
        child: const Text('Restart Quiz!'),
      ),
    ]);
  }
}
