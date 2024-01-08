import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      floating: true,
      backgroundColor: AppColors.neutral100,
      pinned: true,
      elevation: 0.0,
      expandedHeight: 0.0,
      stretch: true,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset(
                        MediaRes.profile,
                        width: 70,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temukan\nHunian Impian',
                          style:
                              CustomTextStyle.textLargeSemiBold.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Agen Properti Terbaik',
                          style: CustomTextStyle.textSmallRegular
                              .copyWith(color: AppColors.gray200),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 35.0,
                      width: 35.0,
                      padding: const EdgeInsets.all(7.5),
                      decoration: const BoxDecoration(
                        color: AppColors.baseWhite,
                        borderRadius: BorderRadius.all(Radius.circular(18.51)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Color(0xFFC5D1C6),
                            blurRadius: 11.0,
                            spreadRadius: 0.0,
                          )
                        ],
                      ),
                      child: SvgPicture.asset(
                        MediaRes.notification,
                        colorFilter: const ColorFilter.mode(
                          AppColors.baseDark,
                          BlendMode.srcIn,
                        ),
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                    Positioned(
                      top: -7.0,
                      right: -13.0,
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: const BoxDecoration(
                          color: AppColors.baseRed,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: CustomTextStyle.textExtraSmallMedium
                                .copyWith(fontSize: 10.67, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
