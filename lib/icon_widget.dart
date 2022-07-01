import 'package:flutter/material.dart';
import 'input.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  IconWidget({@required this.text, @required this.i});

  final String text;
  final IconData i;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          i,
          size: 75,
          color: Colors.grey[350],
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,
          style: textStyle,
          ),
      ],
    );
  }
}