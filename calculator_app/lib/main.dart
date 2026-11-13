import "package:decimal/decimal.dart";
import "package:eval_ex/expression.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class CalculatorButton extends StatelessWidget {
  final String buttonText;

  final Color? textColor;
  final Color backgroundColor = Color(0xFFFFA6C9);
  final void Function(String) onButtonPress;
  CalculatorButton({
    super.key,
    required this.buttonText,
    this.textColor,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint("button pressed: $buttonText");
          onButtonPress(buttonText);
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
  final void Function(String) onCalculatorButtonPress;

  const CalculatorButtons({super.key, required this.onCalculatorButtonPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                buttonText: "7",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "8",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "9",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "C",
                textColor: Color(0xFFFF4081),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "AC",
                textColor: Color(0xFFFF4081),
                onButtonPress: onCalculatorButtonPress,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                buttonText: "4",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "5",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "6",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "+",
                textColor: Colors.white,
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "-",
                textColor: Colors.white,
                onButtonPress: onCalculatorButtonPress,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                buttonText: "1",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "2",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "3",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "*",
                textColor: Colors.white,
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "/",
                textColor: Colors.white,
                onButtonPress: onCalculatorButtonPress,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                buttonText: "0",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: ".",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "00",
                textColor: Color(0xFFD81B60),
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(
                buttonText: "=",
                textColor: Colors.white,
                onButtonPress: onCalculatorButtonPress,
              ),
              CalculatorButton(buttonText: "", onButtonPress: (_) {}),
            ],
          ),
        ),
      ],
    );
  }
}

class DisplayArea extends StatelessWidget {
  final String expression;

  final String result;
  const DisplayArea({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                expression,
                textAlign: TextAlign.right,
                style: TextStyle(color: Color(0xFFFF80AB), fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 8),
          Flexible(
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                result,
                textAlign: TextAlign.right,
                style: TextStyle(color: Color(0xFFD81B60), fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      home: Scaffold(
        backgroundColor: Color(0xFFFFF5F7),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFA6C9),
          title: Center(
            child: Text(
              "Calculator",
              style: TextStyle(color: Color(0xFF6E2B65)),
            ),
          ),
        ),
        body: Calculator(),
      ),
    );
  }
}

class _CalculatorState extends State<Calculator> {
  String expression = "0";
  String result = "0";
  bool isValidResult = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: DisplayArea(expression: expression, result: result),
        ),
        Expanded(
          flex: 3,
          child: CalculatorButtons(
            onCalculatorButtonPress: onCalculatorButtonPressed,
          ),
        ),
      ],
    );
  }

  void onCalculatorButtonPressed(String pressed) {
    setState(() {
      if (pressed == "AC") {
        return _handleClearAll();
      }
      if (pressed == "C") {
        return _handleClear();
      }
      if (pressed == "=") {
        return _handleEquals();
      }
      if (_isOperator(pressed)) {
        return _handleOperator(pressed);
      }
      if (pressed == ".") {
        return _handleDot();
      }
      if (_isDigit(pressed)) {
        return _handleDigit(pressed);
      }
    });
  }

  String _evaluate() {
    String normalizedExpression = expression.splitMapJoin(
      RegExp(r"[\+\-\*\/]"),
      onMatch: (n) => "${n[0]}",
      onNonMatch: (match) {
        String number = match;
        debugPrint("nonMatch: $number");
        if (number.isNotEmpty && number[number.length - 1] == ".") {
          number += "0";
        }
        return number;
      },
    );
    debugPrint("Normalized: $normalizedExpression");
    Expression exp = Expression(normalizedExpression);
    Object? error;
    try {
      Decimal? evaluated = exp.eval();
      isValidResult = true;
      return evaluated.toString();
    } on ExpressionException catch (e) {
      error = e;
      String msg = e.msg;
      isValidResult = false;
      if (msg.contains("divide by 0"))
      {
        return "Cannot divide by 0";
      }
      else if (msg.contains("Missing parameter(s)"))
      {
        return "";
      }
      else
      {
        return "Error";
      }
    } catch (e) {
      error = e;
      isValidResult = false;
      return "Error";
    } finally {
      if (error != null) {
        debugPrint("Caught $error");
      }
    }
  }

  String _getLastNumber() {
    return expression
        .split(RegExp(r"[\+\-\*\/]"))
        .where((str) => str.isNotEmpty)
        .toList()
        .last;
  }

  void _handleClear() {
    if (expression.length == 1) {
      _resetState();
    } else {
      expression = expression.substring(0, expression.length - 1);
      try {
        result = _evaluate();
      } catch (e) {
        debugPrint("Caught $e on 'C'");
        isValidResult = false;
      }
    }
  }

  void _handleClearAll() {
    _resetState();
    return;
  }

  void _handleDigit(String digit) {
    String lastChar = expression[expression.length - 1];
    String lastNumber = _getLastNumber();
    debugPrint("Last number: $lastNumber");
    if (expression.length == 1 && lastNumber == "0" && digit != "00") {
      expression = digit;
    } else if (digit == "00" && _isOperator(lastChar)) {
      expression += "0";
    } else {
      expression += digit;
    }
    debugPrint("Expression before evaluate: $expression");
    result = _evaluate();
  }

  void _handleDot() {
    String lastChar = expression[expression.length - 1];
    String currentNumber = expression.split(RegExp(r"[\+\-\*\/]")).last;
    if (currentNumber.contains(".")) {
      return;
    }
    if (_isOperator(lastChar)) {
      expression += "0";
    }
    expression += ".";
  }

  void _handleEquals() {
    if (isValidResult) {
      expression = result;
    }
  }

  void _handleOperator(String op) {
    String lastChar = expression[expression.length - 1];
    if (_isDigit(lastChar) || (op == "-" && lastChar != "-")) {
      expression += op;
    }
  }

  bool _isDigit(String s) {
    return RegExp(r"^([0-9]|00)$").hasMatch(s);
  }

  bool _isOperator(String s) {
    return RegExp(r"^[\+\-\*\/]$").hasMatch(s);
  }

  void _resetState() {
    expression = "0";
    result = "0";
    isValidResult = true;
  }
}
