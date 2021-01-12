import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';
import '../../repositories/index.dart';

List<PlayerScore> setPlayerScores(BuildContext context, String matchId){
  List <PlayerScore> scoreList = [];
  
  List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(matchId);

  for(int i = 0; i<rounds.length; i++){
    for(int j = 0; j<rounds[i].players.length; j++){
      PlayerScore aux = new PlayerScore();
      if(i == 0){
        aux.name = context.watch<PlayerRepository>().getPlayerById(rounds[i].players[j]).name; 
        aux.score = rounds[i].results[j];
        scoreList.add(aux);
      }else{
        scoreList[j].score += rounds[i].results[j];
      }
    }
  }
  Comparator<PlayerScore> scoreComparator = (a, b) => b.score.compareTo(a.score);
  scoreList.sort(scoreComparator);
  return scoreList;
}

class ScoreTab extends StatelessWidget {
  final Match data;

  const ScoreTab(this.data); 
  @override
  Widget build(BuildContext context) {
    List<PlayerScore> scores  = setPlayerScores(context, data.id);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                for(final score in scores)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${score.name}',
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '(${score.score.toString()})',
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
              ],
            ),
          )
          
        ],
      )
    );
  }
}





