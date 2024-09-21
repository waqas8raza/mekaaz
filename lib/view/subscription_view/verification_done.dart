import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../app_router/app_router.dart';
import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

class VerificationDone extends StatelessWidget {
  const VerificationDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/payment-done.png'),
          // const SizedBox(height: 20),
          CustomText(
            text: 'Payment done!',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 10),
          CustomText(
            text:
                'Your payment is received successfully. Thanks for purchasing Me’kaaz Subscription package.',
            fontSize: 16,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RoundButton(
              onPressed: () {
                AppRouter.navigateTo(context, '/termsAndConditionView');
              },
              title: 'Close',
              containerColor: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
