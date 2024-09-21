import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final TextDecoration? decoration;
  final FontWeight fontWeight;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
    this.decoration,
    this.fontFamily,
    this.fontSize = 28.0,
    this.fontWeight = FontWeight.normal,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        decoration: decoration,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
