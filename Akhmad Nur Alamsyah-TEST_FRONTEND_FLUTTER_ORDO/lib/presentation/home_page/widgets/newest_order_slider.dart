import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/entities/entities.dart';
import 'package:flutter_ordo/common/extensions/int_extension.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/common/widgets/widgets.dart';
import 'package:flutter_ordo/presentation/home_page/controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class NewestOrderSlider extends GetView<HomeController> {
  const NewestOrderSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpandablePageView.builder(
          onPageChanged: (index) {
            controller.currentIndex.value = index;
          },
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            Order order = controller.orders[index];
            return OrderSliderItem(order: order);
          },
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Obx(
                  () => OrderIndicatorBar(
                    isActive: controller.currentIndex.value == i,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderSliderItem extends GetView<HomeController> {
  const OrderSliderItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // height: (order.isLate) ? 185.0 : 144.0,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(order.orderId,
                      style: CustomTextStyle.textSmallRegular
                          .copyWith(color: AppColors.baseDark)),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.baseGreen,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Center(
                        child: Text(
                          order.type,
                          style: CustomTextStyle.textSmallRegular.copyWith(
                            color: AppColors.baseWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // height: 85.0,
                    width: 100.0,
                    decoration: const BoxDecoration(
                      color: AppColors.baseDark,
                      borderRadius: BorderRadius.all(
                        Radius.circular(11.33),
                      ),
                    ),
                    child: Image.asset(
                      order.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderInfoTile(
                          icon: MediaRes.house2,
                          info: order.residenceName,
                        ),
                        OrderInfoTile(
                          icon: MediaRes.location,
                          info: order.location,
                        ),
                        OrderInfoTile(
                          icon: MediaRes.calendar,
                          info: order.date,
                        ),
                        OrderInfoTile(
                          info: order.price.formatToCurrency,
                          customTextStyle: CustomTextStyle.textRegularBold
                              .copyWith(color: AppColors.baseDark),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (order.isLate)
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomSeparator(
                        color: AppColors.gray300,
                        width: 3.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              MediaRes.money,
                              height: 14.0,
                              width: 14.0,
                              colorFilter: const ColorFilter.mode(
                                AppColors.baseDark,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Row(
                              children: [
                                Text(
                                  'Denda Rp ',
                                  style:
                                      CustomTextStyle.textSmallRegular.copyWith(
                                    color: AppColors.baseDark,
                                  ),
                                ),
                                Text(
                                  '${order.penalty?.formatToCurrency}',
                                  style: CustomTextStyle.textSmallBold.copyWith(
                                    color: AppColors.baseDark,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.baseDark,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 7.0, top: 4.0, right: 9.0, bottom: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MediaRes.danger,
                                  height: 10.0,
                                  width: 10.0,
                                ),
                                const SizedBox(width: 3.0),
                                Text(
                                  'Terlambat ${order.latePaymentDays} Hari',
                                  style: CustomTextStyle.textExtraSmallRegular
                                      .copyWith(
                                          fontSize: 10.0,
                                          color: AppColors.baseWhite),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderInfoTile extends GetView<HomeController> {
  const OrderInfoTile({
    super.key,
    this.icon,
    this.info,
    this.price,
    this.customTextStyle,
  });

  final String? info, icon, price;
  final TextStyle? customTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (icon != null)
            ? SvgPicture.asset(
                icon!,
                colorFilter: const ColorFilter.mode(
                  AppColors.baseDark,
                  BlendMode.srcIn,
                ),
                height: 14.0,
                width: 14.0,
              )
            : Text(
                'Rp',
                style: CustomTextStyle.textSmallRegular
                    .copyWith(color: AppColors.baseDark),
              ),
        const SizedBox(width: 5.0),
        Text(
          info!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: customTextStyle ??
              CustomTextStyle.textSmallRegular.copyWith(
                color: AppColors.baseDark,
              ),
        ),
      ],
    );
  }
}
