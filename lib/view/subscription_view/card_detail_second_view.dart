import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/custom_textfield.dart';
import 'package:mekaaz/widgets/round_button.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class CardDetailSecondView extends ConsumerWidget {
  CardDetailSecondView({super.key});

  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final dateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.primaryColor,
      bottomSheet: Container(
        height: screenHeight * .75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Card Details',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Full Name',
                fontSize: 18,
              ),
              CustomTextField(
                controller: nameController,
                hintText: 'Enter full name',
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Card Number',
                fontSize: 18,
              ),
              CustomTextField(
                controller: cardNumberController,
                hintText: 'Enter card number',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Expiry Date',
                          fontSize: 18,
                        ),
                        CustomTextField(
                          controller: dateController,
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'CVV',
                          fontSize: 18,
                        ),
                        CustomTextField(
                          controller: cvvController,
                          hintText: 'CVV',
                          keyboardType: TextInputType.number,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundButton(
                  containerColor: Colors.transparent,
                  borderColor: AppColors.primaryColor,
                  titleColor: AppColors.primaryColor,
                  onPressed: () {
                    AppRouter.navigateTo(context, '/verificationDone');
                  },
                  title: 'Purchase',
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                text: 'Total Payment',
                fontSize: 16,
                color: AppColors.whiteColor,
              ),
            ),
            Center(
              child: CustomText(
                text: '40 Riyals',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: CustomText(
                textAlign: TextAlign.center,
                text:
                    'Note: you can add unlimited caretakers after subscription.',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
