import 'package:flutter/material.dart';
import 'calculator.dart';

class Factorial extends StatefulWidget {
  final Function update;

  Factorial({Key key, this.update}) : super(key: key);

  FactorialState createState() => FactorialState();
}

class FactorialState extends State<Factorial> {
  TextEditingController controller = TextEditingController();

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.blue),
            controller: controller),
        FlatButton(
            color: Colors.greenAccent,
            child: Text("FACTORIAL"),
            onPressed: () =>
                widget.update(factorial(int.parse(controller.text))))
      ],
    );
  }
}
