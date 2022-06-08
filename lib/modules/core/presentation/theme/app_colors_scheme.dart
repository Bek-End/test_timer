import 'package:flutter/material.dart';
import 'package:test_timer/modules/core/presentation/constants/app_colors.dart';

abstract class AppColorsScheme {
  const AppColorsScheme._();

  Color get red;
  Color get white;
  Color get black;
}

class LightAppColorsScheme implements AppColorsScheme {
  const LightAppColorsScheme();
  
  @override
  Color get black => AppColors.black;
  
  @override
  Color get red => AppColors.red;
  
  @override
  Color get white =>AppColors.white;
}
