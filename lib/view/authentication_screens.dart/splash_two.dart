import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_button.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

class SplashTwoScreen extends StatelessWidget {
  const SplashTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            heightFactor: 1.5,
            alignment: Alignment.bottomCenter,
            child: Column(
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
              ],
            ),
          ),
          CustomButton(
            width: 320,
            onPressed: () {},
            color: AppColors.blackColor,
            widget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Started with phone number',
                  fontSize: 16,
                )
              ],
            ),
          ),
          CustomButton(
              width: 320,
              widget: Row(
                children: [
                  Image.asset(
                    "assets/images/facebook_icon.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CustomText(
                    text: 'login via Facebook',
                    color: AppColors.blackColor,
                    fontSize: 18,
                  )
                ],
              ),
              onPressed: () {}),
          CustomButton(
              width: 320,
              widget: Row(
                children: [
                  Image.asset(
                    "/assets/images/google_icon.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CustomText(
                    text: 'login via Google',
                    color: AppColors.blackColor,
                    fontSize: 18,
                  )
                ],
              ),
              onPressed: () {}),
          CustomButton(
              width: 320,
              widget: Row(
                children: [
                  Image.asset(
                    "assets/images/email.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CustomText(
                    text: 'login via Email',
                    color: AppColors.blackColor,
                    fontSize: 18,
                  )
                ],
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
