import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold'),
          centerTitle: true,
          backgroundColor: Colors.green[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Assalomu alaykum',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[500],
                    fontFamily: 'IndieFlower'),
              ),
            ),
            Image.asset(
              'assets/peach.jpg',
            ),
            Center(
                child: MaterialButton(
              onPressed: () {
                print("You clicked me");
              },
              color: Colors.green,
              child: Text('Sign In'),
            )),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.mail),
              label: Text('Send'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
