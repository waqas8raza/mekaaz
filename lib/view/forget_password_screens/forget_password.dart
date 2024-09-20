import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_textfield.dart';

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
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
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
            const SizedBox(
              height: 25,
            ),
            const Spacer(),
            CustomButton(
              width: 320,
              onPressed: () {},
              widget: CustomText(
                text: 'Verify Otp',
                color: AppColors.blackColor,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
