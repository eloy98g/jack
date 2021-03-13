import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import './index.dart';
import '../repositories/index.dart';

LineChartData chartData(List<Round> roundList, List<String> playerList) {
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.white,
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: false,
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: roundList.length.toDouble(),
    maxY: 30,
    minY: 0,
    lineBarsData: itemData(roundList, playerList),
  );
}

List<LineChartBarData> itemData(
    List<Round> roundList, List<String> playerList) {
  List<LineChartBarData> dataList = List();

  for (int i = 0; i < playerList.length; i++) {
    List<FlSpot> pointList = List();
    List<int> resultList =
        getRoundsScoreByPlayer(playerList[i], playerList, roundList);
    for (int j = 0; j < resultList.length; j++) {
      FlSpot aux = FlSpot((j + 1.toDouble()), resultList[j].toDouble());
      pointList.insert(j, aux);
    }

    LineChartBarData lineChartData = LineChartBarData(
      spots: pointList,
      isCurved: false,
      barWidth: 1,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      )
    );

    dataList.insert(i, lineChartData);
  }
}
