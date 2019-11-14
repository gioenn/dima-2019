import 'package:flutter/material.dart';
import 'calculator.dart';

class Power extends StatefulWidget {
  final Function update;
  Power({Key key, this.update}) : super(key: key);
  _PowerState createState() => _PowerState();
}

class _PowerState extends State<Power> {
  final baseController = TextEditingController();
  final expController = TextEditingController();

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 100,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                  controller: baseController,
                )),
            Text("^"),
            Container(
                width: 100,
                child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                    controller: expController)),
          ]),
      FlatButton(
          color: Colors.greenAccent,
          onPressed: () => widget.update(power(
              int.parse(baseController.text), int.parse(expController.text))),
          child: Text("POWER"))
    ]);
  }

  @override
  void dispose() {
    baseController.dispose();
    expController.dispose();
    super.dispose();
  }
}
