import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import './index.dart';
import '../repositories/index.dart';

LineChartData chartData(List<Round> roundList, List<Player> playerList) {
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
    maxY: 4,
    minY: 0,
    lineBarsData: itemData(roundList, playerList),
  );
}

List<LineChartBarData> itemData(
    List<Round> roundList, List<Player> playerList) {
  List<LineChartBarData> dataList = List();

  for (int i = 0; i < playerList.length; i++) {
    List<FlSpot> pointList = List();
    List<int> resultList =
        getRoundsScoreByPlayer(playerList[i].id, playerList, roundList);
    for (int j = 0; j < resultList.length; j++) {
      FlSpot((j + 1.toDouble()), resultList[j].toDouble());
    }

    final LineChartBarData lineChartData = LineChartBarData(spots: []);
  }
}
