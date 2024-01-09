import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/routes/names.dart';
import 'package:flutter_ordo/common/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoute.navbar;
  static const home = AppRoute.home;

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoute.navbar) {
      return GetPageRoute(
        settings: settings,
        page: () => const BottomNavBar(),
        binding: BottomNavBarBinding(),
      );
    }

    return null;
  }
}
