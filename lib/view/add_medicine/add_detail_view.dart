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

class AddMedicineDetailView extends ConsumerStatefulWidget {
  const AddMedicineDetailView({super.key});

  @override
  _AddDiseaseViewState createState() => _AddDiseaseViewState();
}

class _AddDiseaseViewState extends ConsumerState<AddMedicineDetailView> {
  final nameController = TextEditingController();
  final periodController = TextEditingController();
  final slotController = TextEditingController();
  final takenController = TextEditingController();
  final reminderController = TextEditingController();
  final typeController = TextEditingController();
  final quantityController = TextEditingController();
  final addressController = TextEditingController(); // New controller

  final List<String> bloodGroups = [
    'Slot 1',
    'Slot 2',
    'Slot 3',
    'Slot 4',
    'Slot 5',
    'Slot 6',
    'Slot 7',
  ];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectedGender = ref.watch(selectedGenderProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: CustomText(
          text: 'Add Medicine',
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
                  text: 'Add the medicine with details.',
                  fontSize: 16,
                  color: AppColors.greyTextColor,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Type', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: typeController,
                  suffixButton: PopupMenuButton<String>(
                    onSelected: (value) {
                      typeController.text = value;
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
                const SizedBox(height: 30),
                CustomText(text: 'Medicine Name', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: nameController,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Weight', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: nameController,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Time Period', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: periodController,
                ),
                const SizedBox(height: 20),
                CustomText(text: 'Time Slots', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: slotController,
                  suffixButton: PopupMenuButton<String>(
                    onSelected: (value) {
                      slotController.text = value;
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
                const SizedBox(height: 30),
                CustomText(text: 'Quantity', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: quantityController,
                ),
                const SizedBox(height: 20),
                CustomText(text: 'Taken', fontSize: 18),
                CustomTextField(
                  hintText: 'Select Option',
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: takenController,
                  suffixButton: PopupMenuButton<String>(
                    onSelected: (value) {
                      takenController.text = value;
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
                CustomText(text: 'Reminder', fontSize: 18),
                CustomTextField(
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  hintText: 'Set Reminders',
                  controller: reminderController,
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
                        reminderController.text =
                            "${pickedDate.toLocal()}".split(' ')[0];
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Description', fontSize: 18),
                CustomTextField(
                  maxLines: 3,
                  validator:
                      RequiredValidator(errorText: 'This field is required'),
                  controller: nameController,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Upload medicine pictures', fontSize: 18),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.lightGreyColor, width: 1.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.lightGreyColor, width: 1.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RoundButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AppRouter.navigateTo(context, '/addDiseaseTwoView');
                      }
                    },
                    title: 'Done',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
