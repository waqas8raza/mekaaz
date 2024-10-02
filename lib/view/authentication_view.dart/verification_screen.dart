import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/core/repositories/auth/model/login_phone_model.dart';
import 'package:mekaaz/core/repositories/auth/services/auth_repository.dart';
import 'package:mekaaz/core/utils/shared_pref_service.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_text.dart';

import '../../theme/app_colors/app_colors.dart';

// ignore: must_be_immutable
class VerificationCodeScreen extends ConsumerStatefulWidget {
  // final String number;
  const VerificationCodeScreen({
    super.key,
  });

  @override
  ConsumerState<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends ConsumerState<VerificationCodeScreen> {
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
              onSubmit: (String verificationCode) async {
                final response = await ref
                    .read(authRepositoryProvider)
                    .phoneLogin(LoginPhoneModel(
                        phoneNumber: '034992286687',
                        verificationCode: verificationCode));
                if (response.statusCode == 200) {
                  SharedPrefService.saveString(
                      SharedPrefKey.accessToken, response.token);
                  AppRouter.navigateTo(context, '/resetPassword');
                }
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
              onPressed: () async {
                final response = await ref
                    .read(authRepositoryProvider)
                    .phoneLogin(LoginPhoneModel(
                        verificationCode: contatcController.text));
                if (response.statusCode == 200) {
                  SharedPrefService.saveString(
                      SharedPrefKey.accessToken, response.token);
                  AppRouter.navigateTo(context, '/resetPassword');
                }
              },
              widget: const Text('Done'),
            )
          ],
        ),
      ),
    );
  }
}
