import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/features/main_screend.dart';
import 'package:shopping/features/my%20orders/view/screens/my_orders_screen.dart';

import '../../../utils/app_textstyles.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String orderNumber;
  final double totalAmount;

  const OrderConfirmationScreen({
    super.key,
    required this.orderNumber,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/order_success.json',
                width: 200,
                height: 200,
                repeat: false,
              ),
              SizedBox(height: 32),
              Text(
                'Order Confirmed! ',
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.h2,
                  isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Your order #$orderNumber has been successfully placed. ',
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => MyOrdersScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? Colors.white : Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Track Order',
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium,
                    isDark ? Colors.black : Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.offAll(() => MainScreend());
                },
                child: Text(
                  'Continue Shopping',
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium,
                    isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
