import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Hello World")),
            body: Center(
                child: Column(
              children: [
                HelloWorld(),
                CustomHelloWorld(color: Colors.red),
                RepeatedHelloWorld(5),
                Text("Hello World")
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))));
  }
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello World!",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue));
  }
}

class CustomHelloWorld extends StatelessWidget {
  final Color color;

  CustomHelloWorld({this.color});

  @override
  Widget build(BuildContext context) {
    return Text("Hello World!",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color));
  }
}

class RepeatedHelloWorld extends StatelessWidget {
  final int count;

  RepeatedHelloWorld(this.count);

  @override
  Widget build(BuildContext context) {
    List<Widget> c = [];
    for (int i = 0; i < count; i++) {
      c.add(CustomHelloWorld(
          color:
              Color.fromRGBO(16 * i % 255, 32 * i % 255, 64 * i % 255, 1.0)));
    }
    return Column(children: c);
  }
}
