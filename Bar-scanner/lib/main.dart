import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Flutter barcode scanner test app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScanResult? scanResult;

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(50.0),
              child: TextButton(
                onPressed: _scan,
                child: Image.asset(
                  'images/barcode.png',
                  width: 150,

                ),
              ),
            ),
          if (scanResult != null)
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Result Type'),
                    subtitle: Text(scanResult!.type.toString()),
                  ),
                  ListTile(
                    title: const Text('Raw Content'),
                    subtitle: Text(scanResult!.rawContent),
                  ),
                  ListTile(
                    title: const Text('Format'),
                    subtitle: Text(scanResult!.format.toString()),
                  ),
                  ListTile(
                    title: const Text('Format note'),
                    subtitle: Text(scanResult!.formatNote),
                  ),
                ],
              ),
            ),
        ]
      ),
    );
  }
  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }


  Future<http.Response> getData(code) async {
    var url = Uri.https('https://www.brocade.io/api/items/$code');
    return await http.get(url);
  }

  void loadData(code){
    getData(code).then((response) => {
      if(response.statusCode==200) {
        print(response.body)
      } else {
        print(response.statusCode)
      }
    });
  }
}
