import 'package:fe_ordo/core/extensions/extensions.dart';
import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:fe_ordo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RevenueSection extends StatefulWidget {
  const RevenueSection({Key? key}) : super(key: key);

  @override
  State<RevenueSection> createState() => _RevenueSectionState();
}

class _RevenueSectionState extends State<RevenueSection> {
  String selectedView = 'Daily';
  List<String> timeCategory = ['Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainPurple,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Revenue',
                      style: CustomTextStyle.textRegular().copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      257500000.toCurrency(),
                      style: CustomTextStyle.headingSemiBold().copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  offset: const Offset(-3, 18),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topRight,
                    child: const Icon(
                      Icons.more_horiz_rounded,
                      color: AppColors.white,
                    ),
                  ),
                  onSelected: (value) {
                    setState(() {
                      selectedView = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return timeCategory.map((view) {
                      return CustomPopupMenuItem<String>(
                        value: view,
                        height: 33.0,
                        child: Text(
                          view,
                          style: CustomTextStyle.textSmallRegular().copyWith(
                              color: selectedView == view
                                  ? AppColors.mainPurple
                                  : Colors.black),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          const Chart(),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 19, right: 30, bottom: 17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 26,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.gray1.withOpacity(0.5),
                  ),
                ),
                Container(
                  width: 26,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  width: 26,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.gray1.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const CustomPopupMenuItem({
    Key? key,
    required T value,
    required Widget child,
    double height = 50.0,
  }) : super(key: key, value: value, child: child, height: height);
}
