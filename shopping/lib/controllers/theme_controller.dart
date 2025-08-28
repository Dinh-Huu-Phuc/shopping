import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme {
    return _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode => _loadTheme();

  bool _loadTheme() {
    return _box.read(_key) ?? false;
  }

  void saveTheme(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  void toggleTheme() {
    Future.delayed(const Duration(milliseconds: 50), () {
      bool currentTheme = _loadTheme();
      Get.changeThemeMode(currentTheme ? ThemeMode.light : ThemeMode.dark);
      saveTheme(!currentTheme);
      update();
    });
  }
}