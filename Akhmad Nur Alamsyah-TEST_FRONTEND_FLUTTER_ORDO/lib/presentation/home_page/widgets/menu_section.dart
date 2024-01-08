import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/entities/entities.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MenuSection extends GetView<HomeController> {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: CustomTextStyle.textExtraLargeMedium
                        .copyWith(color: AppColors.baseDark),
                  ),
                  Text(
                    'Daftar Menu Transaksi',
                    style: CustomTextStyle.textSmallRegular.copyWith(
                      color: AppColors.gray200,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                MediaRes.category,
                colorFilter: const ColorFilter.mode(
                  AppColors.baseDark,
                  BlendMode.srcIn,
                ),
                height: 17.0,
                width: 17.0,
              )
            ],
          ),
          const SizedBox(height: 20.0),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7.5,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Menu menu = controller.menus[index];
                return MenuCard(
                  title: menu.title,
                  progress: menu.progress,
                  image: menu.image,
                  onTap: () => (menu.phase == 1)
                      ? controller.onOrderPhase(context)
                      : (menu.phase == 2)
                          ? controller.onAdministrationPhase(context)
                          : (menu.phase == 3)
                              ? controller.onBuildingPhase(context)
                              : controller.onHandoverPhase(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends GetView<HomeController> {
  const MenuCard({
    super.key,
    required this.title,
    required this.progress,
    required this.image,
    required this.onTap,
  });

  final String title, image;
  final int progress;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 174.0,
        width: 181.5,
        child: Card(
          color: AppColors.baseWhite,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.baseWhite,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Image.asset(
                image,
                height: 174.0,
                width: 181.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
