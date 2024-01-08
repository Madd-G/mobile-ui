import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key, required this.progress});

  final int progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 35.0,
          width: 35.0,
          decoration: const BoxDecoration(
            color: AppColors.baseDark,
            borderRadius: BorderRadius.all(Radius.circular(18.51)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: Color(0xFFC5D1C6),
                blurRadius: 2.0,
                spreadRadius: 1.5,
              )
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  progress.toString(),
                  style: CustomTextStyle.textExtraSmallMedium.copyWith(
                      fontSize: 12.0,
                      color: AppColors.baseWhite,
                      fontFamily: 'Rubik'),
                ),
                Text(
                  '%',
                  style: CustomTextStyle.textExtraSmallMedium.copyWith(
                      fontSize: 5.0,
                      color: AppColors.baseWhite,
                      fontFamily: 'Rubik'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 35,
          height: 35,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            color: AppColors.baseWhite,
            value: 1,
          ),
        ),
        SizedBox(
          width: 35,
          height: 35,
          child: CircularProgressIndicator(
            color: AppColors.baseRed,
            value: progress / 100,
          ),
        ),
      ],
    );
  }
}
