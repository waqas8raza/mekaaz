import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/tabs_medicine.dart/medicine_card.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_calender.dart';
import '../../widgets/tabs_medicine.dart/appoinment.dart';
import '../../widgets/tabs_medicine.dart/device_tab.dart';
import '../appointments_view/appointments_view.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  bool isCaretakerAdded = true; // Boolean flag to track caretaker status

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
              if (isCaretakerAdded)
                // If caretaker is added, show the tabs
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          labelStyle: TextStyle(
                            fontSize:
                                14, // Increase the font size for selected tab
                            fontWeight: FontWeight
                                .bold, // Optional: Add bold weight for emphasis
                          ),
                          labelColor: AppColors.primaryColor,
                          tabs: [
                            Tab(text: "Medicine"),
                            Tab(text: "Devices"),
                            Tab(text: "Appointments"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteColor),
                                child: const Row(
                                  children: [
                                    SizedBox(
                                        width: 340, child: MedicineCardTab())
                                  ],
                                ),
                              ),
                              const DeviceManagementTab(),
                              const AppointmentCards(isVirtual: false)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                // If no caretaker is added, show the message
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 18, color: AppColors.skipColor),
                    children: [
                      const TextSpan(
                        text: "No Caretaker added Yet\n",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 18),
                      ),
                      const TextSpan(
                        text: ' Please add the caretaker from ',
                        style: TextStyle(
                            color: AppColors.blackColor, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'here ',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle caretaker addition logic here
                          },
                      ),
                    ],
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
            // Handle caretaker addition on FAB press
            setState(() {
              isCaretakerAdded =
                  !isCaretakerAdded; // Toggle caretaker status for demo
            });
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.notifications_active_outlined),
        ),
      ),
    );
  }
}
