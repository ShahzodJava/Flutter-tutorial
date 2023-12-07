import 'package:bloc_flutter_example/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Bloc',
        home: BlocProvider(
          create: (context) => ColorBloc(),
          child: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc,Color>(
          builder: (context, currentColor)=> AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: const Duration(microseconds: 500),
          ),
        ),

      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(RedColorEvent());
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.add(GreenColorEvent());
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
