import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed,@required this.longPress});

  final IconData icon;
  final Function onPressed;
  final Function longPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,
        color: Colors.grey[300],
      ),
      onPressed: onPressed,
      onLongPress: longPress,
      constraints: BoxConstraints.tightFor(
        width: 52.0,
        height: 52.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}