import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/res/res.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/utils/custom_text_style.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/controller/dashboard_controller.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/view/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  final List<String> activeIcons = [
    MediaRes.homeFilled,
    MediaRes.notepadFilled,
    MediaRes.clockFilled,
    MediaRes.profileFilled,
  ];

  final List<String> inactiveIcons = [
    MediaRes.home,
    MediaRes.notepad,
    MediaRes.clock,
    MediaRes.profile,
  ];

  final List<String> labels = ['Home', 'Lead', 'Commission', 'Profile'];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final selectedIndex = controller.selectedIndex.value;
        return IndexedStack(
          index: selectedIndex,
          children: [
            const DashboardPage(),
            Container(),
            Container(),
            Container(),
          ],
        );
      }),
      bottomNavigationBar: Obx(
        () {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomAppBar(
              color: AppColors.darkPurple,
              height: 93,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  final isActive = index == controller.selectedIndex.value;
                  return GestureDetector(
                    onTap: () {
                      controller.selectPage(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            isActive
                                ? activeIcons[index]
                                : inactiveIcons[index],
                            width: 18,
                            height: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            labels[index],
                            style: CustomTextStyle.textSmallMedium().copyWith(
                              color: isActive
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(0.81),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
