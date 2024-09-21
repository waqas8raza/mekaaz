// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../app_router/app_router.dart';
import '../../widgets/custom_textfield.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AddDiseaseTwoView extends ConsumerStatefulWidget {
  const AddDiseaseTwoView({super.key});

  @override
  _AddDiseaseViewState createState() => _AddDiseaseViewState();
}

class _AddDiseaseViewState extends ConsumerState<AddDiseaseTwoView> {
  final diseaseController = TextEditingController();
  final dateController = TextEditingController();
  final dobController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final selectedGender =
        ref.watch(selectedGenderProvider); // Watch the selected gender

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Personal Information',
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
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
                hintText: 'Disease ',
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
              const Spacer(),
              RoundButton(
                  containerColor: Colors.transparent,
                  borderColor: AppColors.primaryColor,
                  titleColor: AppColors.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AppRouter.navigateTo(context, '/addCaretakerView');
                    }
                  },
                  title: 'Add More')
            ],
          ),
        ),
      ),
    );
  }
}
