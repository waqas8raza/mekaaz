// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  String? Function(String?)? validator;

  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixButton;

  TextInputType? keyboardType;

  CustomTextField({
    super.key,
    this.validator,
    this.hintText,
    this.maxLines,
    required this.controller,
    this.obscureText = false,
    this.suffixButton,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColors.blackColor,
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        suffixIcon: suffixButton,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Circular border
          borderSide: const BorderSide(
            color: Colors.black, // Black border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(30.0), // Circular border when focused
          borderSide: const BorderSide(
            color: Colors.black54, // Black border color when focused
            width: 2.0, // Optional: thicker border on focus
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(30.0), // Circular border by default
        ),
      ),
    );
  }
}
