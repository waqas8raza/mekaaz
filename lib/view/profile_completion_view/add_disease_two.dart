// ignore_for_file: implicit_call_tearoffs

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/core/repositories/auth/model/complete_profile_model.dart';
import 'package:mekaaz/core/repositories/auth/services/auth_repository.dart';

import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../widgets/custom_textfield.dart';

// Provider to store the list of diseases
final diseaseListProvider =
    StateProvider<List<Map<String, String>>>((ref) => []);

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AddDiseaseTwoView extends ConsumerStatefulWidget {
  final CompleteProfileModel? completeProfileModel;
  const AddDiseaseTwoView({super.key, this.completeProfileModel});

  @override
  // ignore: library_private_types_in_public_api
  _AddDiseaseTwoViewState createState() => _AddDiseaseTwoViewState();
}

class _AddDiseaseTwoViewState extends ConsumerState<AddDiseaseTwoView> {
  final diseaseController = TextEditingController();
  final startDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  List<Disease> diseasesList = [];

  _addDisease() {
    if (formKey.currentState!.validate()) {
      final disease = Disease(
        name: diseaseController.text,
        startDate: startDateController.text,
      );

      setState(() {
        diseasesList.add(disease);
      });

      // Clear the input fields after adding
      diseaseController.clear();
      startDateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    log(widget.completeProfileModel!.address);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Personal Information',
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          IconButton(
            icon: CustomText(
              text: 'See Disease',
              fontSize: 13,
              color: AppColors.redColor,
              fontWeight: FontWeight.w300,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddedDisease(diseases: diseasesList),
              ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text:
                    'Add the disease you are suffering through, with its starting date',
                fontSize: 16,
                color: AppColors.greyTextColor,
              ),
              const SizedBox(height: 30),
              CustomText(
                text: 'Disease',
                fontSize: 18,
              ),
              CustomTextField(
                hintText: 'Disease',
                controller: diseaseController,
                validator:
                    RequiredValidator(errorText: 'This field is required'),
              ),
              const SizedBox(height: 20),
              CustomText(
                text: 'Starting Date',
                fontSize: 18,
              ),
              CustomTextField(
                validator:
                    RequiredValidator(errorText: 'This field is required'),
                hintText: '10/12/2020',
                controller: startDateController,
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
                      startDateController.text =
                          "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Spacer(),
              RoundButton(
                containerColor: Colors.transparent,
                borderColor: AppColors.primaryColor,
                titleColor: AppColors.primaryColor,
                onPressed: _addDisease,
                title: 'Add More',
              ),
              const SizedBox(height: 30),
              RoundButton(
                containerColor: AppColors.primaryColor,
                titleColor: Colors.white,
                onPressed: () async {
                  final res = await ref
                      .read(authRepositoryProvider)
                      .completeProfile(
                        CompleteProfileModel(
                            name: widget.completeProfileModel!.name,
                            bloodGroup: widget.completeProfileModel!.bloodGroup,
                            dob: widget.completeProfileModel!.dob,
                            gender: widget.completeProfileModel!.gender,
                            address: widget.completeProfileModel!.address,
                            diseases: diseasesList),
                      );

                  if (res.statusCode == 200) {
                    log('Profile completed successfully');
                  }
                },
                title: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//

class AddedDisease extends ConsumerWidget {
  final List<Disease>? diseases;
  const AddedDisease({super.key, this.diseases});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final diseases = ref.watch(diseaseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Added Diseases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: diseases!.length,
          itemBuilder: (context, index) {
            final disease = diseases![index];
            return ListTile(
              title: Text(disease.name),
              subtitle: Text('Date: ${disease.startDate}'),
            );
          },
        ),
      ),
    );
  }
}
