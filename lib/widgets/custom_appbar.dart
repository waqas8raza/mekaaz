import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String profileImageUrl;
  final VoidCallback onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.profileImageUrl,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profileImageUrl),
          // Replace the URL with the actual URL of your user's profile image
        ),
      ),
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notification_add_outlined,
          ),
          onPressed: onNotificationPressed,
        ),
      ],
      backgroundColor: AppColors.whiteColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
