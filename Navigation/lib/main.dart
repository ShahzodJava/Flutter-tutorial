import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        HomePage.routeName: (ctx)=> HomePage(),
        DetailPage.routeName: (ctx)=>DetailPage()
      },
    );
  }
}
