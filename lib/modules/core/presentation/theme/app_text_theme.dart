import 'package:flutter/material.dart';
import 'package:test_timer/modules/core/presentation/constants/app_colors.dart';
import 'package:test_timer/modules/core/presentation/constants/app_text_styles.dart';

class AppTextTheme {
  final Color defaultColor;

  const AppTextTheme({
    required this.defaultColor,
  });

  TextStyle get primaryStyle => AppTextStyles.primaryStyle.copyWith(
        color: defaultColor,
      );

  TextStyle get titleStyle => AppTextStyles.titleStyle.copyWith(
        color: defaultColor,
      );
}

class LightAppTextTheme extends AppTextTheme {
  const LightAppTextTheme() : super(defaultColor: AppColors.black);
}
