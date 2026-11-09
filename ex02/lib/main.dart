import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF5F7),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFA6C9),
          title: Center(
            child: Text("Calculator", style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: DisplayArea()),
        Expanded(flex: 3, child: CalculatorButtons()),
      ],
    );
  }
}

class DisplayArea extends StatelessWidget {
  const DisplayArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          Text(
            "0",
            textAlign: TextAlign.end,
            style: TextStyle(color: Color(0xFFFF80AB), fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            "0",
            textAlign: TextAlign.end,
            style: TextStyle(color: Color(0xFFD81B60), fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  CalculatorButton({super.key, required this.buttonText, this.textColor});

  final String buttonText;
  final Color? textColor;
  final Color backgroundColor = Color(0xFFFFA6C9);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint("button pressed: $buttonText");
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: backgroundColor),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(buttonText: "7", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "8", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "9", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "C", textColor: Color(0xFFFF4081)),
              CalculatorButton(buttonText: "AC", textColor: Color(0xFFFF4081)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(buttonText: "4", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "5", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "6", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "+", textColor: Colors.white),
              CalculatorButton(buttonText: "-", textColor: Colors.white),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(buttonText: "1", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "2", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "3", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "*", textColor: Colors.white),
              CalculatorButton(buttonText: "/", textColor: Colors.white),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(buttonText: "0", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: ".", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "00", textColor: Color(0xFFD81B60)),
              CalculatorButton(buttonText: "=", textColor: Colors.white),
              CalculatorButton(buttonText: ""),
            ],
          ),
        ),
      ],
    );
  }
}
