import 'dart:math';
import 'package:flutter/material.dart';

// 랜덤을 바로 안쓰는 이유: 메모리 최적화
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// _ 는 여기서만 쓰는 클래스로 지정
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceNum = 1;
  void rollDice() {
    setState(() {
      currentDiceNum = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/dice-images/dice-$currentDiceNum.png',
          width: 200,
        ),
        ElevatedButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: EdgeInsets.all(20),
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 28),
                backgroundColor: Colors.amber),
            child: Text('Roll Dice'))
      ],
    );
  }
}
