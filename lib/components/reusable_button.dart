import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;

  ReusableButton({this.text, this.color, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color != null ? color : Color(0xFF001253),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: color == null ? Colors.blueAccent : Colors.blueAccent,
          ),
        ),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
