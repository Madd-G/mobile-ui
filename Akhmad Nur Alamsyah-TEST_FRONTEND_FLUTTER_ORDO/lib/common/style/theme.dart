import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.neutral100,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.baseDark,
    fontFamily: 'Outfit',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.baseRed,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColors.baseDark,
    ),
  );
}
