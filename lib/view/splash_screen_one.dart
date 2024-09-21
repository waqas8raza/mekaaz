import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import '../widgets/custom_text.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({super.key});

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.replaceWith(context, 'onboardscreens');
      
    });
    super.initState();
  }

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
            CustomText(
              text: "Me'kaaz",
              fontFamily: 'RoxboroughCF-ExtraBold',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            CustomText(
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
