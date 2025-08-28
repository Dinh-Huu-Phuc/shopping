import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/auth_controller.dart';
import 'package:shopping/controllers/navigation_controller.dart';
import 'package:shopping/controllers/theme_controller.dart';
import 'package:shopping/utils/app_themes.dart';
import 'package:shopping/features/splash_screen.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController()); // Đảm bảo controller được khởi tạo trước
  Get.put(NavigationController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng Get.find an toàn
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      title: 'Shopping clothes',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme, // Sử dụng theme từ controller
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      home: SplashScreen(),
    );
  }
}