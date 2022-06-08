import 'package:flutter/material.dart';
import 'package:test_timer/modules/core/presentation/constants/app_colors.dart';
import 'package:test_timer/modules/core/presentation/theme/app_text_theme.dart';
abstract class Themes {
  const Themes._();

  static ThemeData get lightTheme {
    const textTheme = LightAppTextTheme();

    return ThemeData.light().copyWith(
      primaryColor: AppColors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.red,
        titleTextStyle: textTheme.titleStyle.copyWith(color: AppColors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.red,
      ),
      textTheme: TextTheme(
        subtitle1: textTheme.primaryStyle,
      ),
    );
  }
}
