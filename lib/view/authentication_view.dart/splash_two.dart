import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/widgets/custom_button.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

class SplashTwoScreen extends StatelessWidget {
  const SplashTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor, // Set a background color if needed
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          Align(
            heightFactor: 1.5,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16), // Add spacing
                CustomText(
                  text: "Me'kaaz",
                  fontFamily: 'RoxboroughCF-ExtraBold',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50), // Adjust spacing as needed
          CustomButton(
            width: 320,
            onPressed: () {
              AppRouter.navigateTo(context, "contactScreen");
            },
            color: AppColors.blackColor,
            widget: Center(
              child: CustomText(
                text: 'Start with phone number',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20), // Uniform spacing
          CustomButton(
            width: 320,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/facebook_icon.png",
                  width: 24, // Set a fixed width for consistency
                  height: 24, // Set a fixed height for consistency
                ),
                const SizedBox(width: 20),
                CustomText(
                  text: 'Login via Facebook',
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            onPressed: () {
              // AppRouter.navigateTo(context, '/');
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            width: 320,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google_icon.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 20),
                CustomText(
                  text: 'Login via Google',
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            onPressed: () {
              // AppRouter.navigateTo(context, '/emailScreenOne');
            },
          ),
          const SizedBox(height: 20),
          const Text('or', style: TextStyle(fontSize: 16)),
          CustomButton(
            width: 320,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/email.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                CustomText(
                  text: 'Login via Email',
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            onPressed: () {
              AppRouter.navigateTo(context, '/emailScreenOne');
            },
          ),
        ],
      ),
    );
  }
}
