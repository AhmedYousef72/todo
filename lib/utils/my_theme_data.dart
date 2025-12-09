import 'package:flutter/material.dart';
import 'package:todo/utils/app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.selectedIcon,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarLight,
      selectedItemColor: AppColors.selectedIcon,
      unselectedItemColor: AppColors.unselectedIcon,
    ),
    cardColor: AppColors.cardLight,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textOnLight),
      bodyMedium: TextStyle(color: AppColors.textOnLight),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.selectedIcon,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarDark,
      selectedItemColor: AppColors.selectedIcon,
      unselectedItemColor: AppColors.unselectedIcon,
    ),
    cardColor: AppColors.cardDark,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textOnDark),
      bodyMedium: TextStyle(color: AppColors.textOnDark),
    ),
  );
}
