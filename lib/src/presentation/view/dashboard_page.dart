import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/src/presentation/view/refactors/refactors.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainPurple,
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const RevenueSection(),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    KpiSection(),
                    RecentLeadSection(),
                    LeaderboardsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
