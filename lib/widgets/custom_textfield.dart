// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mekaaz/theme/app_colors/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  TextInputType? keyboardType;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        fillColor: Colors.white,
        hintText: hintText,
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
