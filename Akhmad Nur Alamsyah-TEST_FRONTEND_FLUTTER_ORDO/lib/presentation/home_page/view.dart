import 'package:flutter/material.dart';
import 'package:flutter_ordo/presentation/home_page/widgets/widgets.dart';
import 'package:get/get.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: <Widget>[
            const HomeAppBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            const HomeBanner(),
            (controller.state.isEmpty.value) ? const NoOrder() : const WithOrder(),
          ],
        ),
      ),
    );
  }
}
