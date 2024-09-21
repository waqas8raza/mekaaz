// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_textfield.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AccountView extends ConsumerWidget {
  AccountView({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final nameController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final dateController = TextEditingController();
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
  @override
  Widget build(BuildContext context, ref) {
    final selectedGender = ref.watch(selectedGenderProvider);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Acount Information',
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  CustomText(
                    decoration: TextDecoration.underline,
                    text: 'Edit Profile Image',
                    fontSize: 22,
                  )
                ],
              ),
              const SizedBox(height: 20),
              CustomText(
                text: 'Full Name',
                fontSize: 18,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: 'Enter username'),
              ),
              const SizedBox(height: 20),
              CustomText(
                text: 'Email',
                fontSize: 18,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: 'Enter Email'),
              ),
              const SizedBox(
                height: 20,
              ),
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
                hintText: '15/04/2002',
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
              const SizedBox(height: 20),
              CustomText(text: 'Disease', fontSize: 18),
              CustomTextField(
                validator:
                    RequiredValidator(errorText: 'This field is required'),
                hintText: 'Diabetes',
                controller: nameController,
              ),
              const SizedBox(height: 20),
              CustomText(text: 'Starting Date', fontSize: 18),
              CustomTextField(
                validator:
                    RequiredValidator(errorText: 'This field is required'),
                hintText: '12/10/2023',
                controller: dateController,
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
              const SizedBox(
                height: 20,
              ),
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
              RoundButton(
                  containerColor: AppColors.primaryColor,
                  titleColor: AppColors.whiteColor,
                  onPressed: () {
                    AppRouter.navigateTo(context, '/subscriptionView');
                  },
                  title: 'Save Changes')
            ],
          ),
        ),
      ),
    );
  }
}
