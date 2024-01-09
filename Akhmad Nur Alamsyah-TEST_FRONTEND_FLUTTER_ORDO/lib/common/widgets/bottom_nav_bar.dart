import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/routes/names.dart';
import 'package:flutter_ordo/common/routes/pages.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/utils.dart';
import 'package:flutter_ordo/presentation/home_page/binding.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppPages.home,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          color: AppColors.baseWhite,
          height: 75.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (index) {
                bool isActive = controller.state.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    controller.changePage(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (isActive)
                          ? SvgPicture.asset(
                              Data.activeIcon[index],
                              colorFilter: const ColorFilter.mode(
                                AppColors.baseDark,
                                BlendMode.srcIn,
                              ),
                              height: 24.0,
                              width: 24.0,
                            )
                          : SvgPicture.asset(
                              Data.inActiveIcon[index],
                              colorFilter: const ColorFilter.mode(
                                AppColors.gray200,
                                BlendMode.srcIn,
                              ),
                              height: 24.0,
                              width: 24.0,
                            ),
                      const SizedBox(height: 10.0),
                      (isActive)
                          ? SizedBox(
                              height: 13.0,
                              child: Image.asset(MediaRes.bar),
                            )
                          : const SizedBox(height: 13.0)
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarController extends GetxController {
  BottomNavBarController();

  final BottomNavBarState state = BottomNavBarState();

  void changePage(int index) {
    state.selectedIndex.value = index;
    Get.toNamed(state.pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoute.home) {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        binding: HomeBinding(),
      );
    }
    if (settings.name == AppRoute.second) {
      return GetPageRoute(
        settings: settings,
        page: () => const Scaffold(body: Text('Second')),
      );
    }
    if (settings.name == AppRoute.third) {
      return GetPageRoute(
        settings: settings,
        page: () => const Scaffold(body: Text('Third')),
      );
    }
    if (settings.name == AppRoute.fourth) {
      return GetPageRoute(
        settings: settings,
        page: () => const Scaffold(body: Text('Fourth')),
      );
    }
    if (settings.name == AppRoute.fifth) {
      return GetPageRoute(
        settings: settings,
        page: () => const Scaffold(body: Text('Fifth')),
      );
    }

    return null;
  }
}

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}

class BottomNavBarState {
  var selectedIndex = 0.obs;
  final pages = <String>[
    AppRoute.home,
    AppRoute.second,
    AppRoute.third,
    AppRoute.fourth,
    AppRoute.fifth
  ];
}
