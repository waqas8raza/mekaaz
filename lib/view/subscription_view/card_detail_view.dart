import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class CardDetailView extends ConsumerWidget {
  const CardDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(selectedGenderProvider);
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
                text: 'Select Payment Method',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              const SizedBox(height: 10),
              CardWidget(
                title: 'Credit/Debit Card',
                selectedGender: selectedGender,
                ref: ref,
              ),
              const SizedBox(height: 20),
              CardWidget(
                title: 'PayPal',
                selectedGender: selectedGender,
                ref: ref,
              ),
              const SizedBox(height: 20),
              CardWidget(
                title: 'Apple Pay',
                selectedGender: selectedGender,
                ref: ref,
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundButton(
                      containerColor: Colors.transparent,
                      borderColor: AppColors.primaryColor,
                      titleColor: AppColors.primaryColor,
                      onPressed: () {
                        AppRouter.navigateTo(context, '/cardDetailSecondView');
                      },
                      title: 'Purchase'))
            ],
          ),
        ),
      ),
      body: Column(
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
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String selectedGender;
  final WidgetRef ref;
  const CardWidget({
    super.key,
    required this.title,
    required this.selectedGender,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightGreyColor,
          width: 1.4,
        ),
      ),
      child: Center(
        child: RadioListTile<String>(
          activeColor: AppColors.primaryColor,
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          value: title,
          groupValue: selectedGender,
          onChanged: (value) {
            ref.read(selectedGenderProvider.notifier).state = value!;
          },
        ),
      ),
    );
  }
}
