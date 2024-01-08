import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/utils.dart';
import 'package:flutter_ordo/presentation/home_page/controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NoOrder extends GetView<HomeController> {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesanan Terbaru',
                      style: CustomTextStyle.textExtraLargeMedium
                          .copyWith(color: AppColors.baseDark),
                    ),
                    Text(
                      'Daftar pesanan terbaru anda',
                      style: CustomTextStyle.textSmallRegular.copyWith(
                        color: AppColors.gray200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              MediaRes.noOrder,
              width: 318.76,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Pesanan Kosong',
              style: CustomTextStyle.textLargeSemiBold.copyWith(
                color: AppColors.baseDark,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Ayo tambahkan pesanan baru',
              style: CustomTextStyle.textSmallRegular.copyWith(
                color: AppColors.gray200,
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                controller.onExplore();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 25.0),
                decoration: const BoxDecoration(
                  color: AppColors.baseDark,
                  borderRadius: BorderRadius.all(
                    Radius.circular(39.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      MediaRes.search,
                      height: 15.0,
                      width: 15.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Eksplor Properti',
                      style: CustomTextStyle.textLargeMedium
                          .copyWith(color: AppColors.baseWhite),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 53.67)
          ],
        ),
      ),
    );
  }
}
