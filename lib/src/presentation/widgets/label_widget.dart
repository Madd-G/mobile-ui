import 'package:fe_ordo/core/extensions/extensions.dart';
import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(
      {Key? key,
      required this.title,
      required this.color,
      this.icon,
      required this.amount})
      : super(key: key);

  final String title;
  final Color color;
  final String? icon;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 83,
            height: 22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('$icon', width: 13, height: 13),
                const SizedBox(width: 3.0),
                Text(title,
                    style: CustomTextStyle.textExtraSmallMedium()
                        .copyWith(color: AppColors.white))
              ],
            )),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            amount.toCurrency(),
            style: CustomTextStyle.textMedium().copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
