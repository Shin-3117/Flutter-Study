import 'package:flutter/material.dart';
import 'package:my_app/dice.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
