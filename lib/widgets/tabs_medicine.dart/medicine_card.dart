import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class MedicineCardTab extends StatelessWidget {
  const MedicineCardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              text: 'Morning',
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/tablets.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Medicine Name',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '40mg',
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 15,
                            width: 1,
                            color: AppColors.blackColor,
                          ),
                          const SizedBox(width: 2),
                          CustomText(
                            text: 'Before Meal',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      CustomText(
                        text: '10:30 am',
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Show a dialog when the "Taken" container is tapped
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: FittedBox(
                              child: CustomText(
                                text: 'Are you want to take medicine?',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Image.asset(
                              'assets/images/popup.png',
                              fit: BoxFit.cover,
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  foregroundColor:
                                      Colors.white, // Set the text color here
                                  elevation:
                                      5, // Optional: Add shadow elevation
                                ),
                                onPressed: () {
                                  // Action for confirming the medicine intake
                                  Navigator.of(context).pop();
                                },
                                child: const Text('cancel'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  foregroundColor:
                                      Colors.white, // Set the text color here
                                  elevation:
                                      5, // Optional: Add shadow elevation
                                ),
                                onPressed: () {
                                  // Action for confirming the medicine intake
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 90,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Taken',
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
