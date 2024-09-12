import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: font,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.gray),
      scaffoldBackgroundColor: AppColors.gray,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.gray,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.gray,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.bg),
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue100,
        surface: AppColors.bg,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.blue100,
        colorScheme: ColorScheme.light(primary: AppColors.blue100),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.blue100),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bg,
      ),
    );
  }
}
