import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class AppointmentDoneView extends StatelessWidget {
  const AppointmentDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'The appointment is scheduled successfully\nwith [doctor name]',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/location.png'),
                CustomText(
                  text: 'https://goo.gl/maps/PmJ5ZFbb5SmXG186',
                  fontSize: 14,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'October 31, 2022',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      title: 'Add to Calendar',
                      titleColor: AppColors.primaryColor,
                      containerColor: AppColors.whiteColor,
                      onPressed: () {
                        // Add to Calendar functionality
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomContainer(
                      title: 'Go Back',
                      titleColor: AppColors.whiteColor,
                      containerColor: Colors.transparent,
                      borderColor: AppColors.whiteColor, // Adding border color
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color titleColor;
  final Color? borderColor; // Optional border color parameter
  final Color containerColor;

  const CustomContainer({
    super.key,
    required this.containerColor,
    required this.onPressed,
    this.borderColor,
    required this.title,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: containerColor,
        backgroundColor: containerColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!, width: 2.0) // Apply border if provided
              : BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
    );
  }
}
