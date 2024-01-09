import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/common/widgets/widgets.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'widgets.dart';

class NewestOrder extends GetView<HomeController> {
  const NewestOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
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
              SvgPicture.asset(
                MediaRes.arrowRight,
                colorFilter: const ColorFilter.mode(
                  AppColors.baseDark,
                  BlendMode.srcIn,
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const CustomStepper(),
          ),
          const SizedBox(height: 10.0),
          const NewestOrderSlider(),
        ],
      ),
    );
  }
}

class OrderIndicatorBar extends StatelessWidget {
  const OrderIndicatorBar({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: 3.0,
        width: 19.0,
        decoration: BoxDecoration(
          color: (isActive) ? AppColors.baseDark : AppColors.gray100,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
