import 'package:fe_ordo/core/extensions/extensions.dart';
import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/core/utils/custom_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: AppColors.darkPurple,
              tooltipRoundedRadius: 8,
              fitInsideVertically: true,
              fitInsideHorizontally: true,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot spot) {
                  final tooltips = [
                    260000,
                    255000,
                    250000,
                    235000,
                    250000,
                    255000,
                    245000
                  ];
                  final tooltipIndex =
                      spot.spotIndex.clamp(0, tooltips.length - 1);
                  return LineTooltipItem(
                    tooltips[tooltipIndex].toCurrency(),
                    CustomTextStyle.textBigMedium()
                        .copyWith(fontSize: 14.11, color: AppColors.white),
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: AppColors.mainPurple,
                strokeWidth: 0,
              );
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: AppColors.mainPurple,
                strokeWidth: 0,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return BottomTitleWidget(value: value);
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                interval: 1,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 22,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(-0.5, 3.5),
                FlSpot(2.0, 4.0),
                FlSpot(5.0, 3.9),
                FlSpot(8.0, 3.3),
                FlSpot(11.0, 3.75),
                FlSpot(14.0, 4.15),
                FlSpot(17.0, 3.95),
                FlSpot(20.0, 3.6),
                FlSpot(23.0, 4.1),
              ],
              isCurved: true,
              color: AppColors.white,
              barWidth: 2.35,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.purple2.withOpacity(0.5),
                    AppColors.mainPurple,
                  ],
                  stops: const [0.1, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTitleWidget extends StatelessWidget {
  final double value;

  const BottomTitleWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dayText = value.getDayText();

    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      child: Text(
        dayText,
        style: CustomTextStyle.textRegular().copyWith(color: AppColors.white),
      ),
    );
  }
}
