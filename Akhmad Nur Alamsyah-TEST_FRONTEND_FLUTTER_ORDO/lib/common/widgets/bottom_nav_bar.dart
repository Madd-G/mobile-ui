import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  final List<String> activeIcons = [
    MediaRes.homeFilled,
    MediaRes.buildingFilled,
    MediaRes.documentFilled,
    MediaRes.cartFilled,
    MediaRes.userFilled,
  ];

  final List<String> inactiveIcons = [
    MediaRes.home,
    MediaRes.building,
    MediaRes.document,
    MediaRes.cart,
    MediaRes.user,
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _getPage(bottomNavigationController.selectedIndex.value),
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
                bool isActive =
                    bottomNavigationController.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    bottomNavigationController.changePage(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (isActive)
                          ? SvgPicture.asset(
                              activeIcons[index],
                              colorFilter: const ColorFilter.mode(
                                AppColors.baseDark,
                                BlendMode.srcIn,
                              ),
                              height: 24.0,
                              width: 24.0,
                            )
                          : SvgPicture.asset(
                              inactiveIcons[index],
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

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(child: Text('Page 2'));
      case 2:
        return const Center(child: Text('Page 3'));
      case 3:
        return const Center(child: Text('Page 4'));
      case 4:
        return const Center(child: Text('Page 5'));
      default:
        return const Center(child: Text('Unknown Page'));
    }
  }
}

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
