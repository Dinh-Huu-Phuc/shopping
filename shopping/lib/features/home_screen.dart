import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/theme_controller.dart';
import 'all_products_screen.dart';
import 'cart_screen.dart';
import 'notifications/view/notifications_screen.dart';
import 'widget/category_chips.dart';
import 'widget/custom_search_bar .dart';
import 'widget/product_gird.dart';
import 'widget/sale_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/image/avt.png'),
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Tần Thủy Hoàng',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        'Good morning',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //notification icon
                  Spacer(),
                  IconButton(
                    onPressed: () => Get.to(() => NotificationsScreen()),
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  //cart button
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  //theme button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //search bar
            const CustomSearchBar(),

            //category chips
            const CategoryChips(),

            //sale banner
            const SaleBanner(),

            //popular product
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color:Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Product grid
            const Expanded(
              child: ProductGird(),
            ),
          ],
        ),
      ),
    );
  }
}
