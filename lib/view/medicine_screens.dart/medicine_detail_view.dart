import 'package:flutter/material.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../theme/app_colors/app_colors.dart';

class MedicineDetailsScreen extends StatelessWidget {
  MedicineDetailsScreen({super.key});

  final daysList = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Medicine Name',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/edit.png'),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.secondoryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Image.network(
                  'https://via.placeholder.com/150',
                  width: 150,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: CustomText(
                          text: daysList[index],
                          fontSize: 12,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 16),
            const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet consectetur. Praesent malesuada nunc accumsan vel...'
              'Lacinia viverra pharetra et est orci mollis morbi posuere.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                DetailWidget(label: 'Weight', value: '100mg'),
                DetailWidget(label: 'Type', value: 'Tablet'),
                DetailWidget(label: 'Time period', value: '2 weeks'),
                DetailWidget(label: 'Notify', value: 'At every medicine'),
                DetailWidget(label: 'Time Slots', value: 'Morning'),
                DetailWidget(label: 'Time Slots', value: 'Evening'),
                DetailWidget(label: 'Quantity', value: '2'),
                DetailWidget(label: 'Reminders', value: '09:00 am'),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: RoundButton(onPressed: () {}, title: 'Delete'),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String label;
  final String value;

  const DetailWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 5),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondoryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomText(
              text: value,
              fontSize: 16,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
