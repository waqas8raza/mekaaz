import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_textfield.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
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
                    CustomText(
                      text: "New Password",
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    CustomText(
                      text: "Please Enter the new Passwords",
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyTextColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('New Password'),
              ),
              CustomTextField(
                  obscureText: true,
                  hintText: '',
                  controller: newpassController),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Confirm Password'),
              ),
              CustomTextField(
                  obscureText: true,
                  hintText: '',
                  controller: confirmpassController),
              const SizedBox(
                height: 220,
              ),
              CustomButton(
                width: 320,
                color: AppColors.blackColor,
                onPressed: () {},
                widget: const Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
