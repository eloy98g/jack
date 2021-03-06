import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';
import '../../repositories/index.dart';
import '../../models/score.dart';

class ScoreTab extends StatelessWidget {
  final Match data;
  final double fontSize;

  const ScoreTab({
    Key key,
    this.data,
    this.fontSize,
  }) : super(key: key);

  Color setColor(index){
    switch(index){
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
  
  @override
  Widget build(BuildContext context) {
    List<String> players =
        context.watch<PlayerRepository>().getPlayerNames(data.players);
    List<Round> rounds =
        context.watch<RoundsRepository>().getRoundsByMatchId(data.id);

    final scores = getFinalScore(players, rounds);

    return Container(
        child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final score in scores)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${((scores.indexOf(score)) + 1).toString()}º   ${score.name}',
                    style: TextStyle(
                      color: setColor(scores.indexOf(score)),
                      fontSize: fontSize,
                    ),
                  ),
                  Text(
                    score.result.toString(),
                    style: TextStyle(
                      color: setColor(scores.indexOf(score)),
                      fontSize: fontSize,
                    ),
                  )
                ],
              ),
          ],
        )),
      ],
    ));
  }
}
