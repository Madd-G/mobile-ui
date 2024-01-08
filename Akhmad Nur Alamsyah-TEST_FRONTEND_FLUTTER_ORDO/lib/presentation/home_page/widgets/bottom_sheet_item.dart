import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/utils.dart';
import 'package:flutter_ordo/presentation/home_page/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.isActive,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isIcon,
    this.isNeedAttention = false,
    this.progress,
  });

  final String title, subtitle, icon;
  final bool isActive, isIcon;
  final bool? isNeedAttention;
  final int? progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Container(
        height: 120.0,
        width: 100.0,
        decoration: const BoxDecoration(
          color: AppColors.neutral300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(60.0),
            bottomRight: Radius.circular(13.0),
            bottomLeft: Radius.circular(13.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isIcon
                  ? Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 35.0,
                          width: 35.0,
                          padding: const EdgeInsets.all(7.5),
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.baseDark
                                : AppColors.baseDark.withOpacity(0.73),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18.51)),
                          ),
                          child: SvgPicture.asset(
                            icon,
                            colorFilter: const ColorFilter.mode(
                              AppColors.baseWhite,
                              BlendMode.srcIn,
                            ),
                            height: 20.0,
                            width: 20.0,
                          ),
                        ),
                        if (isActive)
                          Positioned(
                            top: -8.0,
                            right: -15.0,
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
                                  isNeedAttention! ? '!' : '3',
                                  style: CustomTextStyle.textExtraSmallMedium
                                      .copyWith(
                                          fontSize: 10.67, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                      ],
                    )
                  : ProgressWidget(
                      progress: progress!,
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.textExtraSmallLight.copyWith(
                        fontSize: 10.0,
                        color: AppColors.baseDark,
                        fontFamily: 'Lexend'),
                  ),
                  Text(
                    subtitle,
                    style: CustomTextStyle.textExtraSmallMedium.copyWith(
                        fontSize: 10.0,
                        color: AppColors.baseDark,
                        fontFamily: 'Lexend'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
