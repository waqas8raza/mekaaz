import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mekaaz/app_router/app_router.dart';
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
                CustomText(
                  text: 'Verification Code',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text:
                  'We’ll send you the verification code on your phone number.',
              fontSize: 16,
              color: AppColors.skipColor,
            ),
            const SizedBox(
              height: 30,
            ),
            OtpTextField(
              focusedBorderColor: AppColors.blackColor,
              numberOfFields: 4,
              fieldWidth: 60,
              fieldHeight: 60,
              borderColor: AppColors.blackColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            const Spacer(),
            CustomText(
              text: 'The code will be resend in 30 seconds.',
              fontSize: 16,
              color: AppColors.skipColor,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                width: 320,
                onPressed: () {},
                widget: CustomText(
                  text: 'Send Again',
                  fontSize: 16,
                  color: AppColors.blackColor,
                )),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              width: 320,
              color: AppColors.blackColor,
              onPressed: () {
                AppRouter.navigateTo(context, 'ResetPasswordScreen');
              },
              widget: const Text('Done'),
            )
          ],
        ),
      ),
    );
  }
}
