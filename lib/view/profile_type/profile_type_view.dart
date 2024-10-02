import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/core/repositories/auth/model/update_role_model.dart';
import 'package:mekaaz/core/repositories/auth/provider/get_role_provider.dart';
import 'package:mekaaz/core/repositories/auth/services/auth_repository.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

final radioProvider = StateProvider<int?>((ref) => null);

class ProfileTypeView extends ConsumerWidget {
  const ProfileTypeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.watch(getRoleProvider);
    final selectedValue = ref.watch(radioProvider);
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    const int patientIndex = 0;
    const int doctorIndex = 1;

    return Scaffold(
        body: userRole.when(
      data: (data) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * .012),
              CustomText(
                text: 'Select profile Type',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              CustomText(
                text: 'Select profile Type',
                fontSize: 20,
                color: AppColors.greyTextColor,
              ),
              SizedBox(height: screenHeight * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(radioProvider.notifier).state = patientIndex;
                    },
                    child: Container(
                      width: screenWidth * .4,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedValue == patientIndex
                              ? AppColors.primaryColor
                              : AppColors.lightGreyColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Radio<int>(
                              value: patientIndex,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                ref.read(radioProvider.notifier).state = value;

                                ref.read(authRepositoryProvider).updateRole(
                                    UpdateRoleModel(role: 'patient'));
                                ref.refresh(getRoleProvider);
                              },
                            ),
                          ),
                          Image.asset(
                            'assets/images/patient.png',
                            height: 65,
                          ),
                          const Text(
                            'Patient',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(radioProvider.notifier).state = doctorIndex;
                    },
                    child: Container(
                      width: screenWidth * .4,
                      height: screenHeight * .18,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedValue == doctorIndex
                              ? AppColors.primaryColor
                              : AppColors.lightGreyColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Radio<int>(
                              value: doctorIndex,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                ref.read(radioProvider.notifier).state = value;
                                ref.read(authRepositoryProvider).updateRole(
                                    UpdateRoleModel(role: 'caretaker'));
                                ref.refresh(getRoleProvider);
                              },
                            ),
                          ),
                          Image.asset(
                            'assets/images/caretaker.png',
                            height: 55,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Caretaker',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              RoundButton(
                onPressed: () {
                  log("${data.role}");
                  if (data.role != null) {
                    AppRouter.replaceWith(context, '/addDiseaseView');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Please select a profile type before proceeding.'),
                      ),
                    );
                  }
                },
                title: 'Next',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Text("Something went wrong"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
