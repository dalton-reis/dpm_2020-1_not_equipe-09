import 'package:flutter/material.dart';
import "buttons.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Bluetooth'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              width: 300,
              margin: EdgeInsets.all(5),
              child: new LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 200.0) {
                  return flat_button;
                } else {
                  return flat_button;
                }
              }),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.all(5),
              child: flat_button
            ),
          ]))),
    );
  }
}
