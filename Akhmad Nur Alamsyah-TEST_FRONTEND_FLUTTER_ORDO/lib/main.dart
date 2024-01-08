import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/routes/pages.dart';
import 'package:get/get.dart';
import 'common/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
