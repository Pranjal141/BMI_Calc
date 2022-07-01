import 'package:flutter/material.dart';
import 'input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.teal,
          scaffoldBackgroundColor: Color(0xFF0A0E20),
        textTheme: TextTheme(
            body1: TextStyle(
              color: Color(0xFFFFFFFF)
            ),
        ),
      ),
      home: InputPage(),
    );
  }
}


