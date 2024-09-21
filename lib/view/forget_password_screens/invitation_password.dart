import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_button.dart';

import '../../app_router/app_router.dart';
import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

// ignore: must_be_immutable
class InvitationPasswordresetScreen extends StatelessWidget {
  InvitationPasswordresetScreen({super.key});
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.invitationPasswordresetColor,
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
            const SizedBox(
              height: 200,
            ),
            Align(
              heightFactor: 1,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Material(
                      shape: CircleBorder(),
                      elevation: 2,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.whiteColor,
                        child: Text('✔️'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FittedBox(
                    child: CustomText(
                      text: "Password Reset Successfully",
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center, // Center the text
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 18, color: AppColors.skipColor),
                      children: [
                        const TextSpan(
                          text: "Your password is reset successfully.",
                          style: TextStyle(color: Color(0xFFD3CBC4)),
                        ),
                        const TextSpan(
                          text: ' Please ',
                          style: TextStyle(color: Color(0xFFD3CBC4)),
                        ),
                        TextSpan(
                          text: 'login ',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: 'again with new password.',
                          style: TextStyle(color: Color(0xFFD3CBC4)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              width: 320,
              color: AppColors.blackColor,
              onPressed: () {
                AppRouter.navigateTo(context, '/splashTwoScreen');
              },
              widget: CustomText(
                text: 'Login',
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
