import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class RoundButton extends StatelessWidget {
  final Color? titleColor;
  final Color? containerColor;
  final Color? borderColor;
  final String title;
  final VoidCallback onPressed;

  const RoundButton({
    super.key,
    this.containerColor = Colors.black,
    this.borderColor,
    this.titleColor = Colors.white,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child: Center(
            child: CustomText(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
