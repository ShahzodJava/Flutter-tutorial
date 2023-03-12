import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Dicee'),
        ),
        body: DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  final _random = Random();

  int leftImageNumber = 1;
  int rightImageNumber = 1;

  int next(int min, int max) => min + _random.nextInt(max - min);

  void changeDice() => setState(() {
        leftImageNumber = next(1, 7);
        rightImageNumber = next(1, 7);
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              changeDice();
            },
            child: Image.asset('images/dice$leftImageNumber.png'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              changeDice();
            },
            child: Image.asset('images/dice$rightImageNumber.png'),
          ),
        ),
      ]),
    );
  }
}
