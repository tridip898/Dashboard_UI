import 'package:flutter/material.dart';
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
final List<ChartData> chartData = [
  ChartData('Monthly target', 50,Colors.deepPurple.shade300),
  ChartData('Quarterly Target', 70,Colors.green),
  ChartData('Yearly Target', 75,Colors.orangeAccent.shade200),
];