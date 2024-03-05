import 'package:flutter/material.dart';

class QuestionNum extends StatelessWidget {
  const QuestionNum({
    super.key,
    required this.questionIndex,
    required this.isCorrect,
  });

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrect ? Colors.blue : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          questionIndex.toString(),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
