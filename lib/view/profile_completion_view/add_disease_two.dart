// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../app_router/app_router.dart';
import '../../widgets/custom_textfield.dart';

// Provider to store the list of diseases
final diseaseListProvider =
    StateProvider<List<Map<String, String>>>((ref) => []);

final selectedGenderProvider = StateProvider<String>((ref) => '');

class AddDiseaseTwoView extends ConsumerStatefulWidget {
  const AddDiseaseTwoView({super.key});

  @override
  _AddDiseaseTwoViewState createState() => _AddDiseaseTwoViewState();
}

class _AddDiseaseTwoViewState extends ConsumerState<AddDiseaseTwoView> {
  final diseaseController = TextEditingController();
  final dobController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void _addDisease() {
    if (formKey.currentState!.validate()) {
      final disease = {
        'disease': diseaseController.text,
        'date': dobController.text,
      };

      ref.read(diseaseListProvider.notifier).state = [
        ...ref.read(diseaseListProvider),
        disease
      ];

      diseaseController.clear();
      dobController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              AppRouter.navigateTo(context, '/addedDiseaseView');
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
                onPressed: _addDisease,
                title: 'Add More',
              ),
              const SizedBox(height: 30),
              RoundButton(
                containerColor: AppColors.primaryColor,
                titleColor: Colors.white,
                onPressed: () {
                  if (ref.read(diseaseListProvider).isNotEmpty) {
                    AppRouter.navigateTo(context, '/addCaretakerView');
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

class AddedDiseaseView extends ConsumerWidget {
  const AddedDiseaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diseases = ref.watch(diseaseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Added Diseases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: diseases.isEmpty
            ? const Center(
                child: Text('No diseases added'),
              )
            : ListView.builder(
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  final disease = diseases[index];
                  return ListTile(
                    title: Text(disease['disease'] ?? ''),
                    subtitle: Text('Date: ${disease['date']}'),
                  );
                },
              ),
      ),
    );
  }
}
