import 'package:flutter/material.dart';

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
            body: Center(child: Counter())));
  }
}

class Counter extends StatefulWidget {
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      if (counter < 100) {
        counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void setCounter(double val) {
    setState(() {
      counter = val.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            color: Colors.purple,
            child: Center(
                child: Text("$counter",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.pinkAccent,
              child: Icon(Icons.remove),
              onPressed: decrementCounter,
            ),
            FlatButton(
              color: Colors.greenAccent,
              child: Icon(Icons.add),
              onPressed: incrementCounter,
            )
          ],
        ),
        Slider(
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.blueGrey,
          value: counter.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          onChanged: setCounter,
        )
      ],
    );
  }
}
