import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mekaaz/view/profile/profile_type_view.dart';
import 'package:mekaaz/view/profile_completion/add_disease.view.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    // '/': (context) => const OnboardingView(),
    '/': (context) => const ProfileTypeView(),
    '/addDiseaseView': (context) => const AddDiseaseView(),
=======
import 'package:mekaaz/view/profile_view/account_view.dart';
import 'package:mekaaz/view/subscription_view/card_detail_second_view.dart';
import 'package:mekaaz/view/subscription_view/card_detail_view.dart';
import 'package:mekaaz/view/profile_view/profile_view.dart';
import 'package:mekaaz/view/subscription_view/subscription_view.dart';
import 'package:mekaaz/view/profile_view/terms_and_condition_view.dart';
import 'package:mekaaz/view/subscription_view/verification_done.dart';
import 'package:mekaaz/view/profile_completion_view/add_caretaker_view.dart';
import 'package:mekaaz/view/profile_completion_view/add_disease.view.dart';
import 'package:mekaaz/view/profile_completion_view/add_disease_two.dart';
import 'package:mekaaz/view/profile_completion_view/invitation_sent_view.dart';
import 'package:mekaaz/view/profile_type_view/profile_type_view.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const ProfileTypeView(),
    '/addDiseaseView': (context) => const AddDiseaseView(),
    '/addDiseaseTwoView': (context) => const AddDiseaseTwoView(),
    '/addCaretakerView': (context) => AddCaretakerView(),
    '/invitationSentView': (context) => const InvitationSentView(),
    '/userProfileView': (context) => const UserProfileView(),
    '/accountView': (context) => AccountView(),
    '/subscriptionView': (context) => const SubscriptionView(),
    '/cardDetailView': (context) => const CardDetailView(),
    '/cardDetailSecondView': (context) => CardDetailSecondView(),
    '/verificationDone': (context) => const VerificationDone(),
    '/termsAndConditionView': (context) => const TermsAndConditionView(),
>>>>>>> b7a0872801e76da0b27dccc6ef0192c0e271fe0a
    //
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
