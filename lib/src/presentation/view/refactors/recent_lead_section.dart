import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:fe_ordo/src/presentation/controller/controllers.dart';
import 'package:fe_ordo/src/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RecentLeadSection extends StatelessWidget {
  RecentLeadSection({Key? key}) : super(key: key);

  final LeadController leadController = Get.put(LeadController());

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recent Lead',
              style: CustomTextStyle.textMediumMedium()
                  .copyWith(color: AppColors.black),
            ),
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: 19,
                color: AppColors.mainPurple,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Obx(
          () {
            if (leadController.leadsList.isEmpty) {
              return const SizedBox(
                  height: 100.0,
                  child: Center(child: CupertinoActivityIndicator()));
            } else {
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: leadController.leadsList.map((lead) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 5.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.asset(
                          lead.avatar,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    title: Text(lead.name,
                        style: CustomTextStyle.textMedium()
                            .copyWith(color: AppColors.black)),
                    subtitle: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 2.4),
                          child: SvgPicture.asset(
                            MediaRes.calendar,
                            width: 11.98,
                            height: 11.98,
                            // ignore: deprecated_member_use
                            color: AppColors.gray2,
                          ),
                        ),
                        Text(
                          lead.date,
                          style: CustomTextStyle.textSmallRegular()
                              .copyWith(color: AppColors.gray2),
                        )
                      ],
                    ),
                    trailing: LabelWidget(
                      title: lead.label,
                      icon: lead.icon,
                      color: lead.color,
                      amount: lead.amount,
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
