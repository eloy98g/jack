/*import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class RoundsChart extends StatefulWidget {
  //final List<charts.Series> seriesList;
  // final bool animate;

  // RoundsChart(this.seriesList, {this.animate});
  @override
  _RoundsChart createState() => _RoundsChart();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _RoundsChart extends State<RoundsChart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('2016', 12, Colors.red),
      ClicksPerYear('2017', 42, Colors.yellow),
      ClicksPerYear('2018', 27, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        width: 200,
        child: chart,
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          chartWidget,
        ],
      ),
    );
  }
}
*/

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/index.dart';
import '../../repositories/index.dart';
import '../../models/index.dart';

class GameChart extends StatefulWidget {
  final List<Round> rounds;
  final List<String> players;

  const GameChart({Key key, this.rounds, this.players}) : super(key: key);
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
    minY: -5,
    lineBarsData: itemData(roundList, playerList),
  );
}

List<LineChartBarData> itemData(
    List<Round> roundList, List<String> playerList) {
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
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      )
    );

    dataList.insert(i, lineChartData);
  }

  for (var i = 0; i < dataList.length; i++) {
    print(dataList[i].dotData);
  }
  return dataList;
}

}

//   LineChartData sampleData1() {
//     return LineChartData(
//       lineTouchData: LineTouchData(
//         touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.white,
//         ),
//         touchCallback: (LineTouchResponse touchResponse) {},
//         handleBuiltInTouches: true,
//       ),
//       gridData: FlGridData(
//         show: false,
//       ),
//       titlesData: FlTitlesData(
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           margin: 10,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: const Border(
//           bottom: BorderSide(
//             color: Colors.black,
//             width: 1,
//           ),
//           left: BorderSide(
//             color: Colors.transparent,
//           ),
//           right: BorderSide(
//             color: Colors.transparent,
//           ),
//           top: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       minX: 0,
//       maxX: 14,
//       maxY: 4,
//       minY: 0,
//       lineBarsData: linesBarData1(),
//     );
//   }

//   List<LineChartBarData> linesBarData1() {
//     final LineChartBarData lineChartBarData1 = LineChartBarData(
//       // all the spots of the line chart.
//       spots: [
//         FlSpot(1, 2.8),
//         FlSpot(3, 1.9),
//         FlSpot(6, 3),
//         FlSpot(10, 1.3),
//         FlSpot(13, 2.5),
//       ],
//       // curved or straight line.
//       isCurved: false,
//       // Color of the rod.
//       colors: const [
//         Color(0xff27b6fc),
//       ],
//       barWidth: 8,
//       // Data of dot.
//       dotData: FlDotData(
//         show: false,
//       ),
//       // To highlight the data below the line curve.
//       belowBarData: BarAreaData(
//         show: false,
//       ),
//     );

//     final LineChartBarData lineChartBarData2 = LineChartBarData(
//       spots: [
//         FlSpot(1, 1),
//         FlSpot(3, 1.5),
//         FlSpot(5, 1.4),
//         FlSpot(7, 3.4),
//         FlSpot(10, 2),
//         FlSpot(12, 2.2),
//         FlSpot(13, 1.8),
//       ],
//       isCurved: true,
//       colors: [
//         const Color(0xff4af699),
//       ],
//       barWidth: 8,
//       dotData: FlDotData(
//         show: false,
//       ),
//       belowBarData: BarAreaData(
//         show: false,
//       ),
//     );

//     final LineChartBarData lineChartBarData3 = LineChartBarData(
//       spots: [
//         FlSpot(1, 1),
//         FlSpot(3, 2.8),
//         FlSpot(7, 1.2),
//         FlSpot(10, 2.8),
//         FlSpot(12, 2.6),
//         FlSpot(13, 3.9),
//       ],
//       isCurved: true,
//       colors: [
//         const Color(0xffaa4cfc),
//       ],
//       barWidth: 8,
//       dotData: FlDotData(
//         show: false,
//       ),
//       belowBarData: BarAreaData(
//         show: true,
//         colors: [
//           Color(0xffaa4cfc).withOpacity(0.3),
//         ],
//       ),
//     );

//     return [
//       lineChartBarData1,
//       lineChartBarData2,
//       lineChartBarData3,
//     ];
//   }
// }
