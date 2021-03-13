import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/index.dart';
import '../../models/index.dart';

class GameChart extends StatefulWidget {
  final List<Round> rounds;
  final List<String> players;

  const GameChart({Key key, this.rounds, this.players}) : super(key: key);
  @override
  State<StatefulWidget> createState() => GameChartState();
}

var minValue = 0;
var maxValue = 0;

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
              child: LineChart(chartData(widget.rounds, widget.players)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  LineChartData chartData(List<Round> roundList, List<String> playerList) {
    List<LineChartBarData> data = itemData(roundList, playerList);
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
      maxY: maxValue.toDouble() + 1,
      minY: minValue.toDouble() - 1,
      lineBarsData: data,
    );
  }

  List<LineChartBarData> itemData(
      List<Round> roundList, List<String> playerList) {
    List<LineChartBarData> dataList = List();

    for (int i = 0; i < playerList.length; i++) {
      List<FlSpot> pointList = new List();
      List<int> resultList =
          getRoundsScoreByPlayer(playerList[i], playerList, roundList);
      int max = resultList.reduce((curr, next) => curr > next ? curr : next);
      int min = resultList.reduce((curr, next) => curr < next ? curr : next);

      if (maxValue < max) {
        maxValue = max;
      }
      if (minValue > min) {
        minValue = min;
      }
      print(maxValue);
      print(minValue);

      for (int j = 0; j < resultList.length; j++) {
        FlSpot aux = new FlSpot(j.toDouble(), resultList[j].toDouble());
        pointList.insert(j, aux);
      }

      LineChartBarData lineChartData = new LineChartBarData(
          spots: pointList,
          isCurved: false,
          barWidth: 1,
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
