import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void playNumberSound(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('assets_number_$number.wav'));
  }

  Expanded drawButton({ required Color color, required int soundNumber}){
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playNumberSound(soundNumber);
        },
        child: Text(
          '$soundNumber',
          style: TextStyle(fontSize: 72, color: Colors.white),
        ),
        style: TextButton.styleFrom(
            backgroundColor: color),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    drawButton(color: Colors.lightGreenAccent, soundNumber: 0)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    drawButton(color: Colors.red, soundNumber: 1),
                    drawButton(color: Colors.green, soundNumber: 2),
                    drawButton(color: Colors.blue, soundNumber: 3),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    drawButton(color: Colors.red, soundNumber: 4),
                    drawButton(color: Colors.green, soundNumber:5),
                    drawButton(color: Colors.blue, soundNumber: 6),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    drawButton(color: Colors.red, soundNumber: 7),
                    drawButton(color: Colors.green, soundNumber:8),
                    drawButton(color: Colors.blue, soundNumber: 9),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    drawButton(color: Colors.lime, soundNumber: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
