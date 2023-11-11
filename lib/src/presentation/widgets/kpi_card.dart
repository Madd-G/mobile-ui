import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:fe_ordo/src/presentation/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KPICard extends StatelessWidget {
  const KPICard({
    super.key,
    required this.index,
    required this.kpi,
  });

  final KpiModel kpi;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 95,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withOpacity(.12),
            blurRadius: 19,
            spreadRadius: 0,
            offset: const Offset(0, 9),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: kpi.color,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: SvgPicture.asset(
                  kpi.icon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Text(
                  kpi.title,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.textVerySmallMedium()
                      .copyWith(color: AppColors.black),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '${kpi.point}',
              style: CustomTextStyle.headingSemiBold()
                  .copyWith(fontSize: 27.0, color: AppColors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Last month',
                style: CustomTextStyle.textExtraSmallRegular()
                    .copyWith(color: AppColors.gray2),
              ),
              Text(
                '${kpi.growth > 0 ? '+' : ''}${kpi.growth}%',
                style: CustomTextStyle.textExtraSmallMedium().copyWith(
                  color: kpi.growth >= 0.0
                      ? AppColors.black
                      : AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
