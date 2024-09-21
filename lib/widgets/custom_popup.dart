import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title Text Centered
          const Center(
            child: Text(
              'Popup Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Center Image
          // Image.asset(
          //   'assets/images/sample_image.png', // Replace with your image path
          //   width: 100,
          //   height: 100,
          // ),
          const SizedBox(height: 20),

          // Button at the Bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Customize button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// To show the popup, call the following from anywhere in your app
void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const CustomPopup();
    },
  );
}
