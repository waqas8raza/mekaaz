import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

import '../../widgets/custom_appbar.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onProfilePressed: () {
          AppRouter.navigateTo(context, '/userProfileView');
        },
        title: 'App Title',
        profileImageUrl: 'https://via.placeholder.com/150',
        onNotificationPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    activeColor: const Color(0xff37306B),
                    dayProps: const EasyDayProps(
                      // ignore: deprecated_member_use
                      activeBorderRadius: 32.0,

                      // ignore: deprecated_member_use
                      inactiveBorderRadius: 32.0,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 200,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style:
                      const TextStyle(fontSize: 18, color: AppColors.skipColor),
                  children: [
                    const TextSpan(
                      text: "No Caretaker added Yet\n",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                    const TextSpan(
                      text: ' Please add the care taker from ',
                      style:
                          TextStyle(color: AppColors.blackColor, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'here ',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
