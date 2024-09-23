import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class MedicineCardTab extends StatefulWidget {
  const MedicineCardTab({super.key});

  @override
  _MedicineCardTabState createState() => _MedicineCardTabState();
}

class _MedicineCardTabState extends State<MedicineCardTab> {
  // Sample data for the list of medicines
  final List<Map<String, dynamic>> medicineList = [
    {
      'name': 'Medicine A',
      'dose': '40mg',
      'time': '10:30 am',
      'meal': 'Before Meal',
      'taken': false,
    },
    {
      'name': 'Medicine B',
      'dose': '20mg',
      'time': '12:00 pm',
      'meal': 'After Meal',
      'taken': false,
    },
    {
      'name': 'Medicine B',
      'dose': '20mg',
      'time': '12:00 pm',
      'meal': 'After Meal',
      'taken': false,
    },
    {
      'name': 'Medicine B',
      'dose': '20mg',
      'time': '12:00 pm',
      'meal': 'After Meal',
      'taken': false,
    },
    {
      'name': 'Medicine B',
      'dose': '20mg',
      'time': '12:00 pm',
      'meal': 'After Meal',
      'taken': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: medicineList.length,
        itemBuilder: (context, index) {
          final medicine = medicineList[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: medicine['name'],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: medicine['dose'],
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
                                text: medicine['meal'],
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          CustomText(
                            text: medicine['time'],
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
                                    text: 'Did you take your medicine?',
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
                                      foregroundColor: Colors.white,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      // Action for confirming the medicine intake (OK button)
                                      setState(() {
                                        medicine['taken'] = true;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: Colors.white,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      // Action for cancelling the medicine intake (Cancel button)
                                      setState(() {
                                        medicine['taken'] = false;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
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
                            color: medicine['taken']
                                ? AppColors
                                    .primaryColor // Background color if taken
                                : AppColors
                                    .whiteColor, // Default background color
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2, // Border color when not taken
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: 'Taken',
                              fontSize: 14,
                              color: medicine['taken']
                                  ? AppColors.whiteColor // Text color if taken
                                  : AppColors
                                      .primaryColor, // Default text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
