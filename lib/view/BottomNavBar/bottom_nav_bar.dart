import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/view/appointments_view/appointments_detail_view.dart';
import 'package:mekaaz/view/appointments_view/appointments_view.dart';
import 'package:mekaaz/view/profile_type_view/profile_type_view.dart';
import 'package:mekaaz/view/profile_view/account_view.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(bottomNavBarProvider.notifier).setIndex(2);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset(
          'assets/images/logo.png',
          width: 80,
          height: 80,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 80,
        color: AppColors.primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                ref.read(bottomNavBarProvider.notifier).setIndex(0);
              },
              icon: Image.asset(
                'assets/images/medicine.png',
                color: currentIndex == 0
                    ? AppColors.secondoryColor
                    : AppColors.greyTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(bottomNavBarProvider.notifier).setIndex(1);
              },
              icon: Image.asset(
                'assets/images/calendar.png',
                color: currentIndex == 1
                    ? AppColors.secondoryColor
                    : AppColors.greyTextColor,
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {
                ref.read(bottomNavBarProvider.notifier).setIndex(3);
              },
              icon: Image.asset(
                'assets/images/monitoring.png',
                color: currentIndex == 3
                    ? AppColors.secondoryColor
                    : AppColors.greyTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(bottomNavBarProvider.notifier).setIndex(4);
              },
              icon: Image.asset(
                'assets/images/task-square.png',
                color: currentIndex == 4
                    ? AppColors.secondoryColor
                    : AppColors.greyTextColor,
              ),
            ),
          ],
        ),
      ),
      body: [
        const AppointmentView(),
        const AppointmentView(),
        const AppointmentDetailScreen(),
        AccountView(),
        const ProfileTypeView(),
      ][currentIndex],
    );
  }
}

class BottomNavBarNotifier extends StateNotifier<int> {
  BottomNavBarNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }
}

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarNotifier, int>((ref) {
  return BottomNavBarNotifier();
});
