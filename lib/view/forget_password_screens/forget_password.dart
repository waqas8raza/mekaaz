import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/widgets/custom_textfield.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Align(
                heightFactor: 1,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "Forgot Password",
                      fontSize: 28.0,
                      color: AppColors.blackColor,
                    ),
                    FittedBox(
                      child: CustomText(
                        text:
                            "We're here to help you get back into your account.",
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              CustomTextField(hintText: '', controller: emailController),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: RoundButton(
          titleColor: AppColors.blackColor,
          containerColor: Colors.transparent,
          onPressed: () {
            AppRouter.navigateTo(context, '/verificationCodeScreen');
          },
          title: 'Verify OTP',
          borderColor: AppColors.blackColor,
        ),
      ),
    );
  }
}
