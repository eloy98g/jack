import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';
import '../../repositories/index.dart';

class ScoreTab extends StatelessWidget {
  final Match data;

  const ScoreTab(this.data); 

  List<PlayerScore> setPlayerScores(BuildContext context, String matchId){
    List <PlayerScore> scoreList = [];
    PlayerScore aux = new PlayerScore();
    List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(matchId);

    for(int i = 0; i<rounds.length; i++){
      for(int j = 0; j<rounds[i].players.length; j++){
        aux.name = context.watch<PlayerRepository>().getPlayerById(rounds[i].players[j]).name;
        aux.score = rounds[i].results[j];
        print('--------------------------------');
        print(aux.name);
        print(aux.score.toString());
        scoreList.add(aux);
      }
    }
    print('(${scoreList.length})');
    return scoreList;
  }

  @override
  Widget build(BuildContext context) {
    List <PlayerScore> playerScore = setPlayerScores(context, data.id);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(final score in playerScore)
            Column(
              children: [
                Text(
                  '${score.name}  (${score.score.toString()})',
                  style: TextStyle(
                    color: textPrimaryColor,
                    fontSize: 9,
                  ),
                ),
              ],
            )
        ],
      )
    );
  }
}





