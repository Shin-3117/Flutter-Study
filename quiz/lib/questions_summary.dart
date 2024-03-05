import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data['question_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['question'] as String,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
