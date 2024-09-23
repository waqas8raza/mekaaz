import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLines;
  final String validationErrorText; // Fallback text if validation fails

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
    this.validationErrorText = "Invalid text", // Default fallback text
  }) : assert(text.isNotEmpty,
            "Text cannot be empty"); // Basic validation: text cannot be empty

  @override
  Widget build(BuildContext context) {
    // Additional validation logic
    final displayText = _validateText(text) ? text : validationErrorText;

    return Text(
      displayText,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  // Custom validation function
  bool _validateText(String text) {
    if (text.isEmpty) {
      return false; 
    }
    return true;
  }
}
