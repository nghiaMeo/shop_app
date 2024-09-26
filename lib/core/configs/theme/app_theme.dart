import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.lightBackground,
      contentTextStyle: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondBackgroundLight,
        hintStyle: const TextStyle(
          color: Color(0xffA7A7A7),
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkBackground,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondBackgroundDark,
        hintStyle: const TextStyle(
          color: Color(0xffA7A7A7),
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}
