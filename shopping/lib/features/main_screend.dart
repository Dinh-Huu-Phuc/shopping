import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/navigation_controller.dart';
import 'package:shopping/controllers/theme_controller.dart';
import 'package:shopping/features/account_screen.dart';
import 'package:shopping/features/home_screen.dart';
import 'package:shopping/features/shopping_screen.dart';
import 'package:shopping/features/widget/custom_bottom_navbar.dart';
import 'package:shopping/features/wishlist_screen.dart';

class MainScreend extends StatelessWidget {
  const MainScreend({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: AnimatedSwitcher(
          duration: Duration(
            milliseconds: 200
          ),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value ),
              index: navigationController.currentIndex.value,
              children: [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar:  CustomBottomNavbar(),
      ),
    );
  }
}
