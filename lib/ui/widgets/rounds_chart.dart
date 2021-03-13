import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/index.dart';
import '../../models/index.dart';

class GameChart extends StatefulWidget {
  final List<Round> rounds;
  final List<String> players;
  final List<Color> colors;

  const GameChart({Key key, this.rounds, this.players, this.colors})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => GameChartState();
}

class GameChartState extends State<GameChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: backgroundThirdColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 6.0),
              child: LineChart(
                  chartData(widget.rounds, widget.players, widget.colors)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  LineChartData chartData(
      List<Round> roundList, List<String> playerList, List<Color> colors) {
    List<LineChartBarData> data = itemData(roundList, playerList, colors);
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
      maxY: getMaxValue(roundList, playerList).toDouble() + 1,
      minY: getMinValue(roundList, playerList).toDouble() - 1,
      lineBarsData: data,
    );
  }

  int getMaxValue(List<Round> roundList, List<String> playerList) {
    int maxValue = 0;
    for (int i = 0; i < playerList.length; i++) {
      List<int> resultList =
          getRoundsScoreByPlayer(playerList[i], playerList, roundList);
      int max = resultList.reduce((curr, next) => curr > next ? curr : next);
      if (maxValue < max) {
        maxValue = max;
      }
    }
    return maxValue;
  }

  int getMinValue(List<Round> roundList, List<String> playerList) {
    int minValue = 0;
    for (int i = 0; i < playerList.length; i++) {
      List<int> resultList =
          getRoundsScoreByPlayer(playerList[i], playerList, roundList);
      int min = resultList.reduce((curr, next) => curr < next ? curr : next);
      if (minValue > min) {
        minValue = min;
      }
    }

    return minValue;
  }

  List<LineChartBarData> itemData(
      List<Round> roundList, List<String> playerList, List<Color> colors) {
    List<LineChartBarData> dataList = List();

    for (int i = 0; i < playerList.length; i++) {
      List<FlSpot> pointList = new List();
      List<int> resultList =
          getRoundsScoreByPlayer(playerList[i], playerList, roundList);

      for (int j = 0; j < resultList.length; j++) {
        FlSpot aux = new FlSpot(j.toDouble(), resultList[j].toDouble());
        pointList.insert(j, aux);
      }

      LineChartBarData lineChartData = new LineChartBarData(
          spots: pointList,
          isCurved: false,
          barWidth: 1,
          colors: [
            colors[i],
          ],
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
          ));

      dataList.insert(i, lineChartData);
    }
    return dataList;
  }
}
