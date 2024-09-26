import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sandbox"),
          backgroundColor: Colors.grey,
        ),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 400,
                color: Colors.red,
                child: Text("1"),
              ),
              Container(
                height: 200,
                color: Colors.green,
                child: Text("2"),
              ),
              Container(
                height: 150,
                color: Colors.grey,
                child: Text("3"),
              ),
              Container(
                height: 200,
                color: Colors.yellow,
                child: Text("4"),
              )
            ]));
  }
}
