import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class MedicineCardTab extends StatelessWidget {
  const MedicineCardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: 'Morning',
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  )),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/tablets.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
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
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 15,
                                width: 1,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              CustomText(
                                text: 'Before Meal',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          CustomText(
                            text: '10:30 am',
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                          height: 90,
                          width: 70,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: CustomText(
                              text: 'Token',
                              fontSize: 14,
                              color: AppColors.whiteColor,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
