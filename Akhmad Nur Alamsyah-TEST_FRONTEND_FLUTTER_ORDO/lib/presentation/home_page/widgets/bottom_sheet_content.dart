import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  final String title, subtitle;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 5.0,
                  width: 60.5,
                  decoration: const BoxDecoration(
                      color: AppColors.gray100,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                ),
                const SizedBox(height: 20.0),
                Text(
                  title,
                  style: CustomTextStyle.textExtraLargeMedium
                      .copyWith(color: AppColors.baseDark),
                ),
                Text(
                  subtitle,
                  style: CustomTextStyle.textSmallRegular
                      .copyWith(color: AppColors.gray200),
                ),
                const SizedBox(height: 15.0),
                const Divider(
                  thickness: 2.0,
                  color: AppColors.gray100,
                ),
                const SizedBox(height: 20.0),
                content,
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
