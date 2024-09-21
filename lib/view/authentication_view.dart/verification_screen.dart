import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_text.dart';

import '../../theme/app_colors/app_colors.dart';

// ignore: must_be_immutable
class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});
  TextEditingController contatcController = TextEditingController();

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
                  const CustomText(text: 'Verification Code')
                ],
              ),
              const CustomText(
                text:
                    'We’ll send you the verification code on your phone number.',
                fontSize: 16,
                color: AppColors.blackforgettext,
              ),
              CustomButton(
                width: 320,
                color: AppColors.blackColor,
                onPressed: () {},
                widget: const Text('Verify'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
