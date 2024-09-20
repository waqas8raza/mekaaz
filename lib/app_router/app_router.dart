import 'package:flutter/material.dart';
import 'package:mekaaz/view/authentication_screens.dart/email_screen_one.dart';
import 'package:mekaaz/view/authentication_screens.dart/splash_two.dart';
import 'package:mekaaz/view/authentication_screens.dart/verification_screen.dart';
import 'package:mekaaz/view/forget_password_screens/forget_password.dart';
import 'package:mekaaz/view/forget_password_screens/reset_password.dart';
import 'package:mekaaz/view/onboarding/onboarding_view.dart';

import 'package:mekaaz/view/splash_screen_one.dart';

import '../view/authentication_screens.dart/contact_screen.dart';
import '../view/forget_password_screens/invitation_password.dart';
import '../view/medicine_screens.dart/bottom_nav_bar.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const BottomNavScreens(),
    "onboardscreens": (context) => const OnboardingScreen(),
    "splashtwo": (context) => const SplashTwoScreen(),
    "loginwithemail": (context) => EmailScreenOne(),
    "withphonenumber": (context) => ContactScreen(),
    "verificationcode": (context) => VerificationCodeScreen(),
    "ForgetPasswordScreen": (context) => ForgetPasswordScreen(),
    "ResetPasswordScreen": (context) => ResetPasswordScreen(),
    "InvitationPasswordresetScreen": (context) =>
        InvitationPasswordresetScreen(),
  };

  // Method for pushing a new route
  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Method for replacing the current route
  static void replaceWith(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }
}
