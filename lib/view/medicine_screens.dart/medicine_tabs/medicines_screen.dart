import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/tabs_medicine.dart/medicine_card.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_calender.dart';

class MedicinesTabOne extends StatefulWidget {
  const MedicinesTabOne({super.key});

  @override
  State<MedicinesTabOne> createState() => _MedicinesTabOneState();
}

class _MedicinesTabOneState extends State<MedicinesTabOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onProfilePressed: () {
          AppRouter.navigateTo(context, '/userProfileView');
        },
        title: 'App Title',
        profileImageUrl: 'https://via.placeholder.com/150',
        onNotificationPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  weekDayCalender(context),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20),

              // Show the tabs
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        labelColor: AppColors.primaryColor,
                        tabs: [
                          Tab(text: "Schedule"),
                          Tab(text: "Medicines"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppRouter.navigateTo(
                                    context, '/MedicineDetailsScreen');
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: const Row(
                                  children: [
                                    SizedBox(
                                        width: 340, child: MedicineCardTab())
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppRouter.navigateTo(
                                    context, '/MedicineDetailsScreen');
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: const Row(
                                  children: [
                                    SizedBox(
                                        width: 340, child: MedicineCardTab())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            // Add your desired functionality here
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.notifications_active_outlined),
        ),
      ),
    );
  }
}
