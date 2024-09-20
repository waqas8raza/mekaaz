import 'package:flutter/material.dart';
import 'package:mekaaz/view/profile/profile_type_view.dart';
import 'package:mekaaz/view/profile_completion/add_disease.view.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    // '/': (context) => const OnboardingView(),
    '/': (context) => const ProfileTypeView(),
    '/addDiseaseView': (context) => const AddDiseaseView(),
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
