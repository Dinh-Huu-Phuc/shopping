import 'package:flutter/material.dart';
import 'package:shopping/utils/app_textstyles.dart';
import 'package:get/get.dart';
import 'package:shopping/features/signin_screen.dart';

import '../controllers/auth_controller.dart';

class OnboardingScreend extends StatefulWidget {
  const OnboardingScreend({super.key});

  @override
  State<OnboardingScreend> createState() => _OnboardingScreendState();
}

class _OnboardingScreendState extends State<OnboardingScreend> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/image/chino_short_white.jpg',
      title: 'Discover Latest Trends',
      description:
          'Explore the newest Clothes trends and find your unique style',
    ),
    OnboardingItem(
      image: 'assets/image/denim_jacket_white.jpg',
      title: 'Quality Products',
      description: 'Shop premium quality clothes that last',
    ),
    OnboardingItem(
      image: 'assets/image/hoodie_classic_gray.jpg',
      title: 'Easy Shopping',
      description: 'Simple and convenient shopping experience',
    ),
    OnboardingItem(
      image: 'assets/image/Screenshot 2025-08-20 204556.png',
      title: 'Skirts and Dresses',
      description: 'Skirts and dresses for every occasion',
    ),
    OnboardingItem(
      image:
          'assets/image/vecteezy_t-shirt-isolated-on-white-background_50631996.jpg',
      title: 'T-shirt Collection',
      description: 'T-shirts that define your style',
    ),
  ];

  //handle get started button pressed
  void _handleGetStarted(){
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone(true);
    Get.off(() =>  SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyles.withColor(
                      AppTextstyles.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.secondary
                        : (isDark ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    "Skip",
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to the next screen or perform an action
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Next' : 'Get Started',
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      isDark? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
