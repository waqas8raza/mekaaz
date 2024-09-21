import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Notifications', fontSize: 18, fontWeight: FontWeight.w700),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            NotificationTile(
              icon: 'assets/images/appointment.png',
              title: 'Appointment added successfully.',
              time: '2hrs ago',
            ),
            SizedBox(height: 16),
            NotificationTile(
              icon: 'assets/images/monitoring.png',
              title: 'Vital monitoring device updated.',
              time: '2hrs ago',
            ),
            SizedBox(height: 16),
            NotificationTile(
              icon: 'assets/images/medicine.png',
              title: 'Medicines taken by patient.',
              time: '2hrs ago',
            ),
            SizedBox(height: 24),
            Text(
              '1 week ago',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            NotificationTile(
              icon: 'assets/images/bell.png',
              title: 'Fall detection alert.',
              time: '2hrs ago',
            ),
            SizedBox(height: 16),
            NotificationTile(
              icon: 'assets/images/account.png',
              title: 'Account update notifications.',
              time: '2hrs ago',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String icon;
  final String title;
  final String time;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondoryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
