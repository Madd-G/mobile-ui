import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.neutral100,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.baseDark,
    fontFamily: 'Outfit',
  );
}
