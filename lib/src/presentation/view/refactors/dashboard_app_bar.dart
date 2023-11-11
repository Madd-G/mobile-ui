import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: AppBar(
        toolbarHeight: 77,
        backgroundColor: AppColors.mainPurple,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: CustomTextStyle.textBigMedium(),
        ),
        actions: <Widget>[
          SvgPicture.asset(
            MediaRes.notification,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          CircleAvatar(
            radius: 29,
            backgroundColor: AppColors.mainPurple,
            child: SvgPicture.asset(
              MediaRes.avatar,
              width: 30,
              height: 30,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(77);
}
