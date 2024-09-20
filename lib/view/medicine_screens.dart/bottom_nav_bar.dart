import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import 'package:mekaaz/view/medicine_screens.dart/main_medicine_screen.dart';

class BottomNavScreens extends StatefulWidget {
  const BottomNavScreens({super.key});

  @override
  State<BottomNavScreens> createState() => _BottomNavScreensState();
}

class _BottomNavScreensState extends State<BottomNavScreens> {
  int myIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const MainBottomScreen(),
      const MainBottomScreen(),
      const MainBottomScreen(),
      const MainBottomScreen(),
      const MainBottomScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: screens[myIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        buttonBackgroundColor: Colors.white,
        color: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
        animationCurve: Curves.easeInOutCubic,
        items: [
          _buildIcon(Icons.location_city, 0),
          _buildIcon(Icons.calendar_month_outlined, 1),
          _buildIcon(Icons.wechat_sharp, 2),
          _buildIcon(Icons.navigation, 3),
          _buildIcon(Icons.settings, 4),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return IconTheme(
      data: IconThemeData(
        color: myIndex == index ? AppColors.primaryColor : Colors.white,
      ),
      child: Icon(icon),
    );
  }
}
