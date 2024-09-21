import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final IconData icon;
  final String medicineName;
  final String dosage;
  final String time;
  final String dosageUnit;

  const MedicineCard({
    super.key,
    required this.icon,
    required this.medicineName,
    required this.dosage,
    required this.time,
    required this.dosageUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.orange),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(medicineName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$dosage Before Meal'),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              dosageUnit,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
