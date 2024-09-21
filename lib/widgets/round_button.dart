import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class RoundButton extends StatelessWidget {
  final Color? titleColor;
  final Color? containerColor;
  final Color? borderColor;
  final String title;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      this.borderColor,
      this.containerColor = Colors.black,
      this.titleColor = Colors.white,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            color: containerColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
