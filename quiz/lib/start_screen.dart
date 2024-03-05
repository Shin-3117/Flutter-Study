import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Colors.green,
        ),
        const Text(
          'Flutter 퀴즈',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
            icon: const Icon(Icons.airline_stops_outlined),
            label: const Text('Start Quiz'))
      ],
    ));
  }
}
