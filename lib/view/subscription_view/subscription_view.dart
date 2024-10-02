import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/app_router/app_router.dart';
import 'package:mekaaz/core/repositories/subscription/model/purchase_plan_model.dart';
import 'package:mekaaz/core/repositories/subscription/provider/get_plan_provider.dart';
import 'package:mekaaz/core/repositories/subscription/services/subscription_repository.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/round_button.dart';

import '../../widgets/custom_text.dart';

final selectedGenderProvider = StateProvider<String>((ref) => '');

class SubscriptionView extends ConsumerWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    final selectedGender = ref.watch(selectedGenderProvider);

    final getPlan = ref.watch(getPlansProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
        ),
        backgroundColor: AppColors.primaryColor,
        body: getPlan.when(
          data: (data) => Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: CurvedTopClipper(),
                  child: Container(
                    height: screenHeight * 0.86,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 100,
                                ),
                                const SizedBox(width: 20),
                                CustomText(
                                  text: "Me'kaaz",
                                  fontFamily: 'RoxboroughCF-ExtraBold',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text:
                                  'Any Purchase Plan makes you a Me’kaaz App Pro User. You decide how much you want to pay and how much it’s worth. No Ads guaranteed, no limitation on features, one-time purchase.',
                              fontSize: 14,
                              color: AppColors.greyTextColor,
                            ),
                            const SizedBox(height: 30),
                            CustomText(
                              text: 'Subscriptions',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.data.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  log("message");
                                  final response = await ref
                                      .read(subscriptionRepositoryProvider)
                                      .purchasePlan(PurchasePlanModel(
                                          planId: data.data[index].id));

                                  if (response.statusCode == 201) {
                                    AppRouter.navigateTo(
                                        context, '/profileTypeView');
                                  }
                                },
                                child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        height: 116,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        RadioListTile<String>(
                                                      activeColor:
                                                          AppColors.whiteColor,
                                                      title: Text(
                                                        data.data[index].name,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      value: 'Male',
                                                      groupValue:
                                                          selectedGender,
                                                      onChanged: (value) {
                                                        ref
                                                            .read(
                                                                selectedGenderProvider
                                                                    .notifier)
                                                            .state = value!;
                                                      },
                                                    ),
                                                  ),
                                                  CustomText(
                                                    text:
                                                        data.data[index].price,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                            CustomText(
                                              text:
                                                  data.data[index].description,
                                              fontSize: 14,
                                              color: AppColors.whiteColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: RoundButton(
              //           containerColor: AppColors.primaryColor,
              //           onPressed: () {
              //             AppRouter.navigateTo(context, '/cardDetailView');
              //           },
              //           title: '7-Days Free Trial')),
              // )
            ],
          ),
          error: (error, stackTrace) => const Center(
            child: Text("Something went wrong"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(
      size.width / 2,
      -20,
      size.width,
      40,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
