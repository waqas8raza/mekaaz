import 'package:flutter/material.dart';

import '../../theme/app_colors/app_colors.dart';
import '../custom_text.dart';

class AppointmentCards extends StatelessWidget {
  final bool isVirtual;

  const AppointmentCards({
    super.key,
    required this.isVirtual,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.lightGreyColor, width: 1.4),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      isVirtual
                          ? 'assets/images/appointment.png'
                          : 'assets/images/appointment.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Appointment',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            text: 'Doctor name · Clinic name',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          CustomText(
                            text: 'Clinic area address',
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.secondoryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Physical: 12 Feb, 2023 - 08:00pm',
                    fontSize: 14,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
