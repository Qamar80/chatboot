import 'package:chatboot/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/our_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "icon": "🔥",
      "title": "Make Every Day Count",
      "desc":
      "No matter how small, Littora ensures you do something productive everyday."
    },
    {
      "icon": "🔥",
      "title": "Limit Distractions",
      "desc":
      "Set app time limits and regain control of your screen time."
    },
    {
      "icon": "🔥",
      "title": "Routine Built For You",
      "desc":
      "Powered by AI, your schedule adapts to your lifestyle and life goals."
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed('/login'); // go to login screen on last
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Get.offAllNamed('/login'),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        CircleAvatar(
                          radius: 45,
                          backgroundColor: yellowColor,
                          child: Text(
                            item["icon"]!,
                            style: const TextStyle(
                                fontSize: 40, color: textColor),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Title
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),

                        // Description
                        Text(
                          item["desc"]!,
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? yellowColor
                        : whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            ourButton(
              onPress: _nextPage,
              color: yellowColor,
              textColor: textColor,
              title: _currentPage == onboardingData.length - 1
                  ? "Get Started"
                  : "Next",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
