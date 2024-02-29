import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(100, 255, 255, 255),
        ),
        const Text(
          'Start Quiz',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.airline_stops_outlined),
            label: Text('Start Quiz'))
      ],
    ));
  }
}
