import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePagePieChart extends StatelessWidget {
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final double fontSize = 16;
      final double radius = 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromRGBO(95, 190, 255, 1),
            value: 69,
            title: '69%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromRGBO(24, 206, 140, 1),
            value: 24,
            title: '24%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromRGBO(98, 92, 209, 1),
            value: 6,
            title: '6%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: showingSections(),
      ),
    );
  }
}
