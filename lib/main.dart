import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme/app_colors/app_colors.dart';
import 'view/authentication_screens.dart/contact_screen.dart';
import 'view/authentication_screens.dart/email_screen_one.dart';
import 'view/authentication_screens.dart/verification_screen.dart';
import 'view/forget_password_screens/forget_password.dart';
import 'view/forget_password_screens/invitation_password.dart';
import 'view/forget_password_screens/reset_password.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Me'kaaz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home:  InvitationPasswordresetScreen(),
    );
  }
}
