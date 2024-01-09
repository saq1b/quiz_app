import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: (data['chosen_answer'] == data['correct_answer'])
                  ? const Color.fromARGB(161, 86, 195, 72)
                  : const Color.fromARGB(161, 165, 31, 40),
              radius: 18,
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(246, 255, 255, 255),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  data['chosen_answer'] as String,
                  style: TextStyle(
                    color: (data['chosen_answer'] == data['correct_answer'])
                        ? const Color.fromARGB(255, 36, 114, 46)
                        : const Color.fromARGB(246, 255, 118, 118),
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  data['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(246, 37, 108, 48),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
