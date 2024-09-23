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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    AppRouter.navigateTo(context, '/bottomNavBar');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.blackColor,
                  )),
            ),
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
