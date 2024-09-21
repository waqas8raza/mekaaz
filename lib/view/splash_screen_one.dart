import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import '../widgets/custom_text.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            const CustomText(
              text: "Me'kaaz",
              fontFamily: 'RoxboroughCF-ExtraBold',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            const CustomText(
              text: "Patient care application",
              fontFamily: "Baumans_regular",
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
