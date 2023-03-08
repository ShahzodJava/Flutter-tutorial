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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Image(
                image: AssetImage('assets/peach.jpg'),
                width: 100.0,
                height: 100.0,
              ),
              Image(
                image: AssetImage('assets/strowberry.jpg'),
                width: 100.0,
                height: 100.0,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('Click me'),
              TextButton(
                onPressed: () {},
                child: Text('Click me'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber
                ),
              ),
              Container(
                color: Colors.cyan,
                padding: EdgeInsets.all(30.0),
                child: Text('Click me'),
              )
            ]),
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
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
