import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class AppointmentDetailScreen extends StatelessWidget {
  const AppointmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Appointment',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/doctor.png')),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 16),
                // Doctor Info
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Dr. Dianne Russell',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: 'Hospital/Clinic name',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: '23-12-2022',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: 'Purpose',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 8),
            const CustomText(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Praesent malesuada nunc accumsan velit quis id at cras. Laciniaviverra pharetra et est orci mollis morbi posuere. Arcu habitant aliquet risus pharetra. Turpis et ullamcorper quisque auctor.',
              fontSize: 14,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: 'Location',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 8),
            const CustomText(
              text: 'https://goo.gl/maps/PnJi5ZFDbSSmXG1862',
              fontSize: 14,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            // Timing Section
            const CustomText(
              text: 'Timing',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                TimingContainer(
                  title: 'Morning',
                ),
                SizedBox(width: 10),
                TimingContainer(
                  title: '10:00',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimingContainer extends StatelessWidget {
  final String title;
  const TimingContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondoryColor,
      ),
      child: Center(
        child: CustomText(
          text: title,
          fontSize: 14,
          color: Colors.brown,
        ),
      ),
    );
  }
}
