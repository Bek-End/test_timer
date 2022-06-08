import 'package:flutter/material.dart';

abstract class AppTextStyles {
  const AppTextStyles._();
  
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 24,
    height: 1.2,
  );
  static const TextStyle primaryStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 1.2,
    letterSpacing: 1.5,
  );
}
