import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/common/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepperComponent(
            title: 'Pemesanan',
            isActive: true,
            code: 0,
          ),
          StepperComponent(
            isActive: true,
            title: 'Administrasi',
            code: 0,
          ),
          StepperComponent(
            title: 'Pembangunan',
            isActive: true,
            code: 1,
          ),
          StepperComponent(
            title: 'Serah terima',
            isActive: false,
            code: 2,
          ),
        ],
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  final String title;
  final int code;
  final bool isActive;

  const StepperComponent({
    super.key,
    required this.isActive,
    required this.code,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  (code == 0)
                      ? MediaRes.tickCircle
                      : (code == 1)
                          ? MediaRes.timeCircle
                          : MediaRes.cd,
                  colorFilter: ColorFilter.mode(
                    code == 2 ? AppColors.gray300 : AppColors.baseDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: (code == 0)
                    ? Container(
                        height: 1,
                        color: AppColors.baseDark,
                      )
                    : const CustomSeparator(
                        color: AppColors.gray300,
                        width: 3.0,
                      ),
              ),
            ],
          ),
          Text(
            title,
            style: CustomTextStyle.textExtraSmallRegular.copyWith(
              fontSize: 10.0,
              color: (isActive) ? AppColors.baseDark : AppColors.gray300,
            ),
          ),
        ],
      ),
    );
  }
}
