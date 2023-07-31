import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int dice1Value = 1;
  int dice2Value = 1;
  List<String> diceNames = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
  ];

  void rollDice() {
    setState(() {
      dice1Value = Random().nextInt(6) + 1;
      dice2Value = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dice 1: ${diceNames[dice1Value - 1]}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiceImage(diceValue: dice1Value),
                SizedBox(width: 32),
                DiceImage(diceValue: dice2Value),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiceImage extends StatelessWidget {
  final int diceValue;

  const DiceImage({required this.diceValue});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/dice$diceValue.png',
      width: 100,
      height: 100,
    );
  }
}