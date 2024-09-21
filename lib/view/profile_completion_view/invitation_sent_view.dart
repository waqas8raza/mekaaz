import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';

class InvitationSentView extends StatelessWidget {
  const InvitationSentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
                child: Image.asset(
              'assets/images/invitation_sent.png',
            )),
            const SizedBox(height: 20),
            CustomText(
              text: 'Invitation sent to caretaker successfully!',
              fontSize: 18,
              color: AppColors.whiteColor,
            ),
            const Spacer(),
            RoundButton(
                containerColor: Colors.transparent,
                borderColor: AppColors.whiteColor,
                titleColor: AppColors.whiteColor,
                onPressed: () {
                  AppRouter.navigateTo(context, '/bottomNavBar');
                },
                title: 'Go to main Menu '),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
