import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import '../../widgets/custom_appbar.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'App Title',
        profileImageUrl: 'https://via.placeholder.com/150',
        onNotificationPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {});
                  },
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 200,
              ),
              RichText(
                textAlign: TextAlign.center, // Center the text
                text: TextSpan(
                  style:
                      const TextStyle(fontSize: 18, color: AppColors.skipColor),
                  children: [
                    const TextSpan(
                      text: "No Caretaker added Yet\n",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                    const TextSpan(
                      text: ' Please add the care taker from ',
                      style:
                          TextStyle(color: AppColors.blackColor, fontSize: 16),
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
                          // Action when the word is clicked
                        },
                    ),
                  ],
                ),
              ),
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
          onPressed: () {},
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
