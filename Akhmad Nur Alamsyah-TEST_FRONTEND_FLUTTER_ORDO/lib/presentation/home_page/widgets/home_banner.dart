import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:get/get.dart';

class HomeBanner extends GetView<HomeController> {
  HomeBanner({super.key});

  final List<String> banners = [MediaRes.banner1, MediaRes.banner4];

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: SizedBox(
          height: 155.0,
          child: PageView.builder(
            padEnds: false,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 155.0,
                  width: 358.0,
                  decoration: BoxDecoration(
                    color: AppColors.baseGreen,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    image: DecorationImage(
                      image: AssetImage(
                        banners[index],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
