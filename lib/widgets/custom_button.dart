import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.onPressed,
      @required this.buttonColor,
      @required this.text,
      this.fontColor});

  final String text;
  final Function onPressed;
  final Color buttonColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      color: buttonColor,
      borderRadius: BorderRadius.circular(4.0),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
