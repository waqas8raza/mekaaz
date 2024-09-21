import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Terms and Services',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Terms',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            CustomText(
              text:
                  'Welcome to the Terms and Conditions of our mobile app! By downloading and using our app, you agree to the following terms:\n 1-You agree to abide by these terms and conditions when you download and use our mobile app.\n 2-We grant you a non-exclusive, non-transferable license to use the app on your mobile device for personal, non-commercial use.\n 3-You are responsible for maintaining the confidentiality of your login information and for all activities that occur under your account.',
              fontSize: 16,
            ),
            const SizedBox(height: 20),
            CustomText(
              text: 'Condotions',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            CustomText(
              text:
                  '4- You retain ownership of any content you post or upload to the app, but you grant us a non-exclusive, royalty-free, perpetual, irrevocable, and fully sublicensable right to use, modify, adapt, publish, translate, create derivative works from, distribute, and display such content worldwide.\n 5- You agree not to use the app for any illegal, harmful, or offensive activities, including but not limited to spamming, hacking, or transmitting viruses or other malicious code.\n 6-The app and all its content, including but not limited to logos, trademarks, and software, are owned by us or our licensors and are protected by intellectual property laws.',
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
