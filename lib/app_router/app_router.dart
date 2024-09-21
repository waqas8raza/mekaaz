import 'package:flutter/material.dart';
import 'package:mekaaz/view/authentication_view.dart/contact_screen.dart';
import 'package:mekaaz/view/authentication_view.dart/email_screen_one.dart';
import 'package:mekaaz/view/authentication_view.dart/splash_two.dart';
import 'package:mekaaz/view/authentication_view.dart/verification_screen.dart';
import 'package:mekaaz/view/forget_password_screens/forget_password.dart';
import 'package:mekaaz/view/forget_password_screens/invitation_password.dart';
import 'package:mekaaz/view/forget_password_screens/reset_password.dart';
import 'package:mekaaz/view/onboarding/onboarding_view.dart';
import 'package:mekaaz/view/profile_completion_view/add_caretaker_view.dart';
import 'package:mekaaz/view/profile_completion_view/add_disease_two.dart';
import 'package:mekaaz/view/profile_completion_view/invitation_sent_view.dart';
import 'package:mekaaz/view/profile_type/profile_type_view.dart';
import 'package:mekaaz/view/profile_view/account_view.dart';

import 'package:mekaaz/view/profile_view/terms_and_condition_view.dart';

import '../view/BottomNavBar/bottom_nav_bar.dart';

import '../view/profile_completion_view/add_disease.view.dart';
import '../view/profile_view/user_profile_view.dart';
import '../view/subscription_view/card_detail_second_view.dart';
import '../view/subscription_view/card_detail_view.dart';
import '../view/subscription_view/subscription_view.dart';
import '../view/subscription_view/verification_done.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const BottomNavBar(),
    '/onboardingScreen': (context) => const OnboardingScreen(),
    '/splashTwoScreen': (context) => const SplashTwoScreen(),
    '/verificationCodeScreen': (context) => VerificationCodeScreen(),
    '/emailScreenOne': (context) => EmailScreenOne(),
    '/invitationPasswordresetScreen': (context) => InvitationPasswordresetScreen(),
    '/profileTypeView': (context) => const ProfileTypeView(),
    '/contactScreen': (context) => ContactScreen(),
    '/verificationcode': (context) => VerificationCodeScreen(),
    '/forgetPassword': (context) => ForgetPasswordScreen(),
    '/resetPassword': (context) => ResetPasswordScreen(),
    '/forgetPasswordScreen': (context) => ForgetPasswordScreen(),
    '/invitationPasswordReset': (context) => InvitationPasswordresetScreen(),
    '/addDiseaseView': (context) => const AddDiseaseView(),
    '/addDiseaseTwoView': (context) => const AddDiseaseTwoView(),
    '/addCaretakerView': (context) => AddCaretakerView(),
    '/invitationSentView': (context) => const InvitationSentView(),
    '/bottomNavBar': (context) => const BottomNavBar(),
    '/userProfileView': (context) => const UserProfileView(),
    '/accountView': (context) => AccountView(),
    '/subscriptionView': (context) => const SubscriptionView(),
    '/cardDetailView': (context) => const CardDetailView(),
    '/cardDetailSecondView': (context) => CardDetailSecondView(),
    '/verificationDone': (context) => const VerificationDone(),
    '/termsAndConditionView': (context) => const TermsAndConditionView(),
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
