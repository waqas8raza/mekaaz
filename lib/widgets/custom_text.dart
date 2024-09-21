import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight fontWeight;
  final Color? color;
  int? maxLines;

  CustomText({
    super.key,
    this.maxLines,
    this.textAlign,
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
      textAlign: textAlign,
      maxLines: maxLines,
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
