import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onClick, {super.key});

  final void Function() onClick;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromRGBO(1, 7, 25, 0.502),
        ),
        // Opacity(  // obsolete performance depleting
        //   opacity: 0.5,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Get ready to test your visual memories of movies!',
          style: TextStyle(
            color: Color.fromARGB(255, 227, 232, 253),
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: onClick,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
          label: const Text('Start Quiz'),
          icon: const Icon(Icons.adjust),
        )
      ],
    );
  }
}
