import 'package:flutter/material.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_textfield.dart';

import '../../theme/app_colors/app_colors.dart';
import '../../widgets/custom_text.dart';

// ignore: must_be_immutable
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  TextEditingController contatcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            Align(
              heightFactor: 1,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  CustomText(
                    text: "Me'kaaz",
                    fontFamily: 'RoxboroughCF-ExtraBold',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                  CustomText(
                    text: "Add Contact Details",
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyTextColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.blackforgettext)),
                  child: const Material(
                    shape: CircleBorder(),
                    elevation: 2,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: AppColors.whiteColor,
                      child: Text('+92'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                      keyboardType: TextInputType.number,
                      hintText: '',
                      controller: contatcController),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              width: 320,
              color: AppColors.blackColor,
              onPressed: () {
                AppRouter.navigateTo(context, '/verificationCodeScreen');
              },
              widget: const Text('Verify'),
            )
          ],
        ),
      ),
    );
  }
}
