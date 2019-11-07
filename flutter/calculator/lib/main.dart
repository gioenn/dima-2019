import 'package:flutter/material.dart';
import 'package:calculator/factorial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Counter App"),
            ),
            body: Center(child: Calculator())));
  }
}

class Calculator extends StatefulWidget {
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int result = 0;

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: Colors.red, child: Center(child: Text("$result"))),
            Factorial()
          ],
        ));
  }
}
