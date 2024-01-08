import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/res/res.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/utils/custom_text_style.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/controller/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardsSection extends StatelessWidget {
  LeaderboardsSection({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Leaderboards',
                  style: CustomTextStyle.textMediumMedium()
                      .copyWith(color: AppColors.black),
                ),
                Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 19,
                    color: AppColors.mainPurple,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () {
              if (userController.leaderboardList.isEmpty) {
                return const SizedBox(
                    height: 100.0,
                    child: Center(child: CupertinoActivityIndicator()));
              } else {
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: userController.leaderboardList.map((user) {
                    return Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 20.5),
                          child: Text(
                            '${user.number}',
                            style: CustomTextStyle.headingSemiBold().copyWith(
                                fontSize: 22.0, color: AppColors.mainPurple),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.asset(
                                user.avatar,
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(user.name,
                                style: CustomTextStyle.textMedium()
                                    .copyWith(color: AppColors.black)),
                            subtitle: Text(
                              user.date,
                              style: CustomTextStyle.textSmallRegular()
                                  .copyWith(color: AppColors.gray2),
                            ),
                            trailing: RichText(
                              text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: '${user.deals}',
                                      style: CustomTextStyle.textSemiBold()
                                          .copyWith(
                                              color: AppColors.mainPurple)),
                                  TextSpan(
                                    text: ' Deals',
                                    style: CustomTextStyle.textVerySmallMedium()
                                        .copyWith(
                                      color: AppColors.gray2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
