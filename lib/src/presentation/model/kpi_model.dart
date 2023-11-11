import 'dart:ui';

class KpiModel {
  final String icon;
  final Color color;
  final String title;
  final int point;
  final num growth;

  KpiModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.point,
    required this.growth,
  });
}
