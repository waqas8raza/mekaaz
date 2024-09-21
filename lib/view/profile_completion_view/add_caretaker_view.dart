// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AddCaretakerView extends ConsumerWidget {
  AddCaretakerView({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final relationshipController = TextEditingController();
  final ageController = TextEditingController();
  final timeController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final selectedGender = ref.watch(selectedGenderProvider);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Add Caretaker',
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Input email or phone of the caretaker',
                  fontSize: 16,
                  color: AppColors.greyTextColor,
                ),
                const SizedBox(height: 30),
                CustomText(
                  text: 'Email',
                  fontSize: 18,
                ),
                CustomTextField(
                  hintText: 'Email ',
                  controller: emailController,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Phone',
                  fontSize: 18,
                ),
                CustomTextField(
                  hintText: 'Phone ',
                  controller: phoneController,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                ),
                //  SizedBox(height: 30).
                CustomText(
                    text: 'Gender', fontSize: 22, fontWeight: FontWeight.w700),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        activeColor: AppColors.blackColor,
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          ref.read(selectedGenderProvider.notifier).state =
                              value!;
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        activeColor: AppColors.blackColor,
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          ref.read(selectedGenderProvider.notifier).state =
                              value!;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Age',
                  fontSize: 18,
                ),
                CustomTextField(
                  hintText: 'Age ',
                  controller: ageController,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Relationship',
                  fontSize: 18,
                ),
                CustomTextField(
                  hintText: 'Relationship ',
                  controller: relationshipController,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Average Time',
                  fontSize: 18,
                ),
                CustomTextField(
                  hintText: 'Average Time ',
                  controller: timeController,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RoundButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                AppRouter.navigateTo(context, '/invitationSentView');
              }
            },
            title: 'Send Invite'),
      ),
    );
  }
}
