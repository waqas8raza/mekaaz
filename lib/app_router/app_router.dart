import 'package:flutter/material.dart';
import 'package:mekaaz/view/onboarding/onboarding_view.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const OnboardingView(),
    // '/bottomNavBar': (context) => BottomNavBarView(),
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
