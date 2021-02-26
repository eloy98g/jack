import 'package:flutter/material.dart';
import '../../repositories/index.dart';
import '../../models/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';

class RoundList extends StatefulWidget {
  final List<Round> rounds;
  final List<String> players;

  const RoundList({Key key, this.rounds, this.players}) : super(key: key);

  @override
  _RoundListState createState() => _RoundListState();
}

Color setColor(index) {
  switch (index) {
    case 0:
      return scoreFirstElement;
    case 1:
      return scoreSecondElement;
    case 2:
      return scoreThirdElement;
    default:
      return textPrimaryColor;
  }
}

class _RoundListState extends State<RoundList> {
  @override
  Widget build(BuildContext context) {
    List<List<PlayerScore>> scoreList =
        getScoreList(widget.players, widget.rounds);
    return Container(
      child: Column(
        children: [
          for (final round in scoreList)
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Ronda ${((scoreList.indexOf(round)) + 1).toString()}',
                      style: TextStyle(
                        color: textPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      getFormatedDate(
                          widget.rounds[(scoreList.indexOf(round))].date),
                      style: TextStyle(
                        color: textPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Separator(width: 34),
                Expanded(
                  child: Column(
                    children: [
                      for (final score in round)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${score.name}',
                              style: TextStyle(
                                color: setColor(round.indexOf(score)),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              score.result.toString(),
                              style: TextStyle(
                                color: setColor(round.indexOf(score)),
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
