import 'package:block_example/color_bloc.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc with Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder (
          stream: bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              height: 100,
              width: 100,
              color: snapshot.data,
              duration: const Duration(microseconds: 500),
            );
          },
        )


      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.inputEventSink.add(ColorEvent.eventRed);
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () {
              bloc.inputEventSink.add(ColorEvent.eventGreen);
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
