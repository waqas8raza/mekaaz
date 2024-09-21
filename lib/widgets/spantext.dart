import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithClickableWord extends StatelessWidget {
  final String completeText = "This is a complete line of text.";
  final String firstHalf = "This is a half line, and ";
  final String clickableWord = "click me";

  const TextWithClickableWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Text Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Complete text in the first line
            Text(
              completeText,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20), // Add space between the lines
            // Partially completed text with a clickable word in the second line
            RichText(
              textAlign: TextAlign.center, // Center the text
              text: TextSpan(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(text: firstHalf), // First half of the line
                  TextSpan(
                    text: clickableWord, // Clickable word
                    style: const TextStyle(
                      color: Colors
                          .blue, // Change color to make it appear clickable
                      fontWeight: FontWeight.bold, // Optionally make it bold
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Action when the word is clicked
                        print('Clicked on the word!');
                      },
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
