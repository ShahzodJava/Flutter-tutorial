import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> myList = ['Book', 'Note', 'Pen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: Center(
              child: Text('${myList[index]}'),
            ),
          );
        },
      ),
    );
  }
}
