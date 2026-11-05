import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(body: Center(child: Text('Hello World!'))),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("A simple text", style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Button pressed");
                },
                child: Text("Click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
