import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

import '../../widgets/custom_textfield.dart';

class AddDiseaseView extends StatefulWidget {
  const AddDiseaseView({super.key});

  @override
  State<AddDiseaseView> createState() => _AddDiseaseViewState();
}

class _AddDiseaseViewState extends State<AddDiseaseView> {
  final nameController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final dobController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text:
                  'Add the disease you are suffering through,with its starting date',
              fontSize: 16,
              color: AppColors.greyTextColor,
            ),
            const SizedBox(height: 30),
            const CustomText(
              text: 'Name',
              fontSize: 18,
            ),
            CustomTextField(
              hintText: 'Enter Name',
              controller: nameController,
            ),
          ],
        ),
      ),
    );
  }
}
