// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  double? width;
  Color? color;
  VoidCallback onPressed;
  Widget? widget;
  IconData? icon;

  double? elevation; // Optional: button elevation

  CustomButton({
    super.key,
    this.width,
    this.color,
    required this.onPressed,
   required this.widget,
    this.icon,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.black)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: elevation,
        ),
        child: widget,
      ),
    );
  }
}
