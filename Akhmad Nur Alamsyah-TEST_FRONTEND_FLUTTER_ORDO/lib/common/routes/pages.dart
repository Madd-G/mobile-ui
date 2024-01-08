import 'package:flutter_ordo/common/routes/names.dart';
import 'package:flutter_ordo/common/widgets/bottom_nav_bar.dart';
import 'package:flutter_ordo/presentation/home_page/binding.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoute.navbar;
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoute.navbar,
      page: () => BottomNavBar(),
      binding: HomeBinding(),
    ),
  ];
}
