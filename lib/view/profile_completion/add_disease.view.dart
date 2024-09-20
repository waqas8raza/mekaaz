import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class AddDiseaseView extends StatelessWidget {
  const AddDiseaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Personal Information',
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  'Add the disease you are suffering through,with its starting date',
              fontSize: 16,
              color: AppColors.greyColor,
            ),
            SizedBox(height: 30),
            CustomText(
              text: 'Name',
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
