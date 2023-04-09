import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: isPortrait ? Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.65,
              color: Colors.amberAccent,
              margin: const EdgeInsets.all(20),
            ),
            Container(
              height: size.height * 0.2,
              color: Colors.amberAccent,
              margin: const EdgeInsets.all(20),
            )
          ],
        ),
      ): Container(
        child: Row(
          children: [
            Container(
              width:size.width * 0.65 ,
              color: Colors.amberAccent,
              margin: const EdgeInsets.all(20),
            ),
            Container(
              width:size.width * 0.2 ,
              color: Colors.amberAccent,
              margin: const EdgeInsets.all(20),
            ),
          ],
        ),
      )
    );
  }
}
