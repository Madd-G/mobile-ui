import 'package:flutter/material.dart';
import 'package:flutter_ordo/presentation/home_page/widgets/widgets.dart';

class WithOrder extends StatelessWidget {
  const WithOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 25.0),
          const NewestOrder(),
          const SizedBox(height: 25.0),
          const MenuSection(),
          const SizedBox(height: 15.9),
        ],
      ),
    );
  }
}
