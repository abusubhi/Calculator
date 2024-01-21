// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = '';
  double _result = 0;
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _onNumberPressed(String value) {
    setState(() {
      _displayText += value;
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      _num1 = double.parse(_displayText);
      _operator = operator;
      _displayText = '';
    });
  }

  void _onEqualPressed() {
    setState(() {
      _num2 = double.parse(_displayText);
      switch (_operator) {
        case '+':
          _result = _num1 + _num2;
          break;
        case '-':
          _result = _num1 - _num2;
          break;
        case '*':
          _result = _num1 * _num2;
          break;
        case '/':
          _result = _num1 / _num2;
          break;
        default:
          _result = 0;
      }
      _displayText = _result.toString();
    });
  }

  void _onClearPressed() {
    setState(() {
      _displayText = '';
      _result = 0;
      _num1 = 0;
      _num2 = 0;
      _operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayText,
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCalcButton('7'),
              _buildCalcButton('8'),
              _buildCalcButton('9'),
              _buildCalcButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCalcButton('4'),
              _buildCalcButton('5'),
              _buildCalcButton('6'),
              _buildCalcButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCalcButton('1'),
              _buildCalcButton('2'),
              _buildCalcButton('3'),
              _buildCalcButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCalcButton('0'),
              _buildCalcButton('.'),
              _buildCalcButton('='),
              _buildCalcButton('+'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _onClearPressed,
              child: const Text('Clear'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalcButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            if (text == '=') {
              _onEqualPressed();
            } else {
              if (text == '+' || text == '-' || text == '*' || text == '/') {
                _onOperatorPressed(text);
              } else {
                _onNumberPressed(text);
              }
            }
          },
          child: Text(text),
        ),
      ),
    );
  }
}