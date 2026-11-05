import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: StatefulColumn())),
    );
  }
}

class StatefulColumn extends StatefulWidget {
  const StatefulColumn({super.key});

  @override
  State<StatefulColumn> createState() => _StatefulColumnState();
}

class _StatefulColumnState extends State<StatefulColumn> {
  String _displayText = "A simple text";

  void _onButtonClick() {
    setState(() {
      _displayText == "A simple text"
          ? _displayText = "Hello World!"
          : _displayText = "A simple text";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _displayText,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _onButtonClick();
          },
          child: Text("Click me"),
        ),
      ],
    );
  }
}
