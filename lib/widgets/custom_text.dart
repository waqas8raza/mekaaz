import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
     this.fontFamily,
    this.fontSize = 28.0,
    this.fontWeight = FontWeight.normal,
    this.color ,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily:
            fontFamily, // Use your custom font family name here
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
