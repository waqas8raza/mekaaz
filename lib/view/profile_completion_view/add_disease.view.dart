// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../widgets/custom_textfield.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AddDiseaseView extends ConsumerStatefulWidget {
  const AddDiseaseView({super.key});

  @override
  _AddDiseaseViewState createState() => _AddDiseaseViewState();
}

class _AddDiseaseViewState extends ConsumerState<AddDiseaseView> {
  final nameController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController(); // New controller

  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectedGender = ref.watch(selectedGenderProvider);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Personal Information',
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      'Add the disease you are suffering through, with its starting date',
                  fontSize: 16,
                  color: AppColors.greyTextColor,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Name', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  hintText: 'Enter Name',
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                CustomText(text: 'Blood Group', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  hintText: 'Choose Blood Group',
                  controller: bloodGroupController,
                  suffixButton: PopupMenuButton<String>(
                    onSelected: (value) {
                      bloodGroupController.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return bloodGroups.map((String group) {
                        return PopupMenuItem<String>(
                          value: group,
                          child: Text(group),
                        );
                      }).toList();
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(text: 'DOB', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  hintText: 'Enter DOB',
                  controller: dobController,
                  suffixButton: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        dobController.text =
                            "${pickedDate.toLocal()}".split(' ')[0];
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 40),
                CustomText(text: 'Address', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  hintText: 'Address',
                  controller: addressController,
                ),
                const SizedBox(height: 90),
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
              AppRouter.navigateTo(context, '/addDiseaseTwoView');
            }
          },
          title: 'Done',
        ),
      ),
    );
  }
}
