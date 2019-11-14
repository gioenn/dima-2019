import 'package:flutter/material.dart';
import 'calculator.dart';

class Factorial extends StatefulWidget {
  final Function update;
  Factorial({Key key, this.update}) : super(key: key);
  _FactorialState createState() => _FactorialState();
}

class _FactorialState extends State<Factorial> {
  final myController = TextEditingController();

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.blue),
          controller: myController),
      FlatButton(
          color: Colors.greenAccent,
          onPressed: () =>
              widget.update(factorial(int.parse(myController.text))),
          child: Text("FACTORIAL"))
    ]);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
