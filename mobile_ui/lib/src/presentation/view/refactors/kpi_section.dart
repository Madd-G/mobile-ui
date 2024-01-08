import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/res/res.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/utils/custom_text_style.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/controller/controllers.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/model/kpi_model.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class KpiSection extends StatelessWidget {
  KpiSection({Key? key}) : super(key: key);

  final KpiController kpiController = Get.put(KpiController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                MediaRes.kpi,
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 6.0),
              Text(
                'Key Performance Indicator',
                style: CustomTextStyle.textMediumMedium().copyWith(
                  color: AppColors.black,
                ),
              )
            ],
          ),
          Obx(
            () {
              if (kpiController.kpiList.isEmpty) {
                return const SizedBox(
                    height: 135,
                    child: Center(child: CupertinoActivityIndicator()));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        height: 135,
                        child: ListView.builder(
                          itemCount: kpiController.kpiList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          itemBuilder: (context, index) {
                            KpiModel kpi = kpiController.kpiList[index];
                            return KPICard(
                              kpi: kpi,
                              index: index,
                            );
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 28),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 44,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.gray3,
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.purple,
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
