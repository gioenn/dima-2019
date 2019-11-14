import 'package:calculator/factorial.dart';
import 'package:calculator/power.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
            appBar: new AppBar(title: new Text("Hello World App")),
            body: new Calculator()));
  }
}

class Calculator extends StatefulWidget {
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _result = 0;

  void _updateResult(result) {
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  color: Colors.red,
                  child: Center(
                      child: Text('$_result',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)))),
              Factorial(
                update: _updateResult,
              ),
              Power(
                update: _updateResult,
              )
            ]));
  }
}
