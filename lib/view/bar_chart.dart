import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BarChartTripleBar extends StatefulWidget {
  const BarChartTripleBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartTripleBarState();
}

class BarChartTripleBarState extends State<BarChartTripleBar> {
  final Color leftBarColor = Colors.orangeAccent;
  final Color middleBarColor = Colors.green.shade400;
  final Color rightBarColor = Colors.deepPurple.shade400;
  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  final double width = 14;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 75, 50, 25);
    final barGroup2 = makeGroupData(1, 100, 25, 50);
    final barGroup3 = makeGroupData(2, 50, 75, 25);
    final barGroup4 = makeGroupData(2, 50, 75, 75);

    final items = [barGroup1, barGroup2, barGroup3, barGroup4];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          //showingTooltipIndicators: [0],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xffffffff),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: 100,
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: showingBarGroups,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      checkToShowHorizontalLine: (value) => value % 10 == 0,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: const Color(0xffe7e8ec),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            color: leftBarColor, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Text("Realised",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            color: middleBarColor, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Text(
                        "Unrealised",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            color: rightBarColor, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Text("Paid",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
            left: BorderSide(color: Colors.grey.shade400)),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            interval: 1,
            getTitlesWidget: leftTitles,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xffc5c2c2),
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );
    String text;
    if (value == 0) {
      text = '0%';
    } else if (value == 25) {
      text = '25%';
    } else if (value == 50) {
      text = '50%';
    } else if (value == 75) {
      text = '75%';
    } else if (value == 100) {
      text = '100%';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 1,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = ["Q1", "Q2", "Q3", "Q4"];

    Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color.fromRGBO(192, 190, 190, 1.0),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(barsSpace: 1.8.w, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: middleBarColor,
        width: width,
      ),
      BarChartRodData(
        toY: y3,
        color: rightBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        width: width,
      ),
    ]);
  }

  // Widget makeTransactionsIcon() {
  //   const width = 4.5;
  //   const space = 3.5;
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         width: width,
  //         height: 10,
  //         color: Colors.white.withOpacity(0.4),
  //       ),
  //       const SizedBox(
  //         width: space,
  //       ),
  //       Container(
  //         width: width,
  //         height: 28,
  //         color: Colors.white.withOpacity(0.8),
  //       ),
  //       const SizedBox(
  //         width: space,
  //       ),
  //       Container(
  //         width: width,
  //         height: 42,
  //         color: Colors.white.withOpacity(1),
  //       ),
  //       const SizedBox(
  //         width: space,
  //       ),
  //       Container(
  //         width: width,
  //         height: 28,
  //         color: Colors.white.withOpacity(0.8),
  //       ),
  //       const SizedBox(
  //         width: space,
  //       ),
  //       Container(
  //         width: width,
  //         height: 10,
  //         color: Colors.white.withOpacity(0.4),
  //       ),
  //     ],
  //   );
  // }
}
