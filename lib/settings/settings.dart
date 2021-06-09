import 'package:flutter/material.dart';

class MainColors {
  static const primaryColor = Colors.green;
  static const secondaryColor = Colors.brown;
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
}

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback function;
  final double? fontSize;

  CustomButton(
      {required this.text, this.color, required this.function, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
      style: ElevatedButton.styleFrom(primary: color),
    );
  }
}
