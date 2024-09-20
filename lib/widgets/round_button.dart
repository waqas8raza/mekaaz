import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class RoundButton extends StatelessWidget {
  final Color? containerColor;
  // final Color? borderColor;
  final String title;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      // this.borderColor,
      this.containerColor = Colors.black,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: CustomText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor)),
      ),
    );
  }
}
