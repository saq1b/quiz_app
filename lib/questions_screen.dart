import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIdx = 0;

  void usersAnswer(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      ++currentQuestionIdx;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIdx];
    // return the question widget
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.sevillana(
              color: const Color.fromARGB(232, 244, 223, 249),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map(
                // here '...' implies spreading of list returned by map
                (answer) => Container(
                  margin: const EdgeInsets.all(10),
                  child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      usersAnswer(answer);
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
