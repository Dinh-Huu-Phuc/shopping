import 'package:flutter/material.dart';

class AppThemes {
  static const Color brown = Color(0xFF8B4513);
  //light theme giao diện sáng
  static final light = ThemeData(
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor:Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffff5722),
      primary: const Color(0xffff5722),
      secondary: Colors.black,
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xffff5722),
      unselectedItemColor: Colors.grey,
    ),
  );

  //dark theme giao diện tối
  static final dark = ThemeData(
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: const Color(0xff121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor:Color(0xff121212),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffff5722),
      primary: const Color(0xffff5722),
      secondary: Colors.white,
      brightness: Brightness.dark,
      surface: const Color(0xff121212),
    ),
    cardColor: const Color(0xff1e1e1e),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor:  Color(0xff1e1e1e),
      selectedItemColor: Color(0xffff5722),
      unselectedItemColor: Colors.grey,
    ),
  );
}