import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const CustomText(
              text: 'skip',
              color: AppColors.skipColor,
              fontSize: 16,
            ),
          ),
        ],
        backgroundColor:AppColors.whiteColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                buildPageContent(
                  image: 'assets/images/Oncology patient-rafiki.png',
                  title: 'Need a Caretaker?',
                  description:
                      'Lorem ipsum dolor sit amet consectetur. Suspendisse turpis auctor elementum scelerisque',
                ),
                buildPageContent(
                  image: 'assets/images/Diabetes-amico.png',
                  title: 'Vital Monitoring',
                  description: 'Page 2 description here.',
                ),
                buildPageContent(
                  image: 'assets/images/Location tracking-rafiki 1.png',
                  title: 'Location Tracking',
                  description: 'Page 3 description here.',
                ),
                buildPageContent(
                  image: 'assets/images/Mobile note list-cuate.png',
                  title: 'Medical Record',
                  description: 'Page 4 description here.',
                ),
                buildPageContent(
                  image: 'assets/images/Diabetes-rafiki 1.png',
                  title: 'Scheduled Apointments',
                  description: 'Page 5 description here.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: const WormEffect(
                    dotHeight: 7,
                    dotWidth: 20,
                    activeDotColor: AppColors.primaryColor,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageContent({String? image, String? title, String? description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image!),
        const SizedBox(height: 20),
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0), // Padding from the left side
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align children to the start (left)
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
