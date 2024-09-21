import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

final locationSelectedProvider = StateProvider((ref) => false);
final notificationSelectedProvider = StateProvider((ref) => false);

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

// bool isSelected = false;
  @override
  Widget build(BuildContext context, ref) {
    // final locationSelected = ref.watch(locationSelectedProvider);
    // final notifcationSelected = ref.watch(locationSelectedProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/bell.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                text: 'Angelina Julie',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'AngelinaJulie@gmail.com',
                fontSize: 20,
                color: AppColors.greyTextColor,
              ),
              const SizedBox(height: 30),
              userProfileCard(
                onPressed: () {
                  AppRouter.navigateTo(context, '/accountView');
                },
                title: 'Account information',
                image: 'assets/images/account.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {
                  AppRouter.navigateTo(context, '/subscriptionView');
                },
                title: 'Subscription Plan',
                image: 'assets/images/dollar-circle.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {
                  AppRouter.navigateTo(context, '/addCaretakerView');
                },
                title: 'Add Caretaker/Supervisor',
                image: 'assets/images/user-add.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                  onPressed: () {},
                  title: 'Location',
                  image: 'assets/images/map.png',
                  trailing: Switch(
                      value: ref.read(locationSelectedProvider.notifier).state,
                      onChanged: (value) {
                        ref.read(locationSelectedProvider.notifier).state =
                            value;
                      })),
              const SizedBox(height: 10),
              userProfileCard(
                  onPressed: () {},
                  title: 'Notifications',
                  image: 'assets/images/bell.png',
                  trailing: Switch(
                      value:
                          ref.read(notificationSelectedProvider.notifier).state,
                      onChanged: (value) {
                        ref.read(notificationSelectedProvider.notifier).state =
                            value;
                      })),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {},
                title: 'Privacy Policy',
                image: 'assets/images/privacy.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {
                  AppRouter.navigateTo(context, '/termsAndConditionView');
                },
                title: 'Terms and conditions',
                image: 'assets/images/terms.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {},
                title: 'Share App',
                image: 'assets/images/share.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 10),
              userProfileCard(
                onPressed: () {
                  showDeleteAccountDialog(context);
                },
                title: 'Delete Account',
                image: 'assets/images/logout.png',
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    AppRouter.navigateTo(context, '/splashTwoScreen');
                  },
                  child: Container(
                    height: 55,
                    width: 170,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: CustomText(
                        text: 'Logout',
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

// # User Profile custom widget
class userProfileCard extends StatelessWidget {
  final Widget trailing;
  final VoidCallback onPressed;
  final String title;
  final String image;
  const userProfileCard(
      {super.key,
      required this.image,
      required this.trailing,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.secondoryColor,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: CustomText(
            text: title,
            fontSize: 18,
          ),
          leading: Image.asset(image),
          trailing: trailing,
        ),
      ),
    );
  }
}

// # show dialg widget

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Delete Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        content: CustomText(
          text: 'Do you really want to delete your account?',
          fontSize: 14,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(text: 'Delete', fontSize: 16),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.brown[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(
                text: 'Cancel',
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}
