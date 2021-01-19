import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';
import '../../repositories/index.dart';

// List<PlayerScore> setPlayerScores(BuildContext context, String matchId){
//   List <PlayerScore> scoreList = [];
  
//   List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(matchId);


//   // for(int i = 0; i<rounds.length; i++){
//   //   for(int j = 0; j<rounds[i].players.length; j++){
//   //     PlayerScore aux = new PlayerScore();
//   //     if(i == 0){
//   //       aux.name = context.watch<PlayerRepository>().getPlayerById(rounds[i].players[j]).name; 
//   //       aux.score = rounds[i].results[j];
//   //       scoreList.add(aux);
//   //     }else{
//   //       scoreList[j].score += rounds[i].results[j];
//   //     }
//   //   }
//   // }
//   // Comparator<PlayerScore> scoreComparator = (a, b) => b.score.compareTo(a.score);
//   // scoreList.sort(scoreComparator);
//   // return scoreList;
// }

class ScoreTab extends StatelessWidget {
  final Match data;

  const ScoreTab(this.data); 
  @override
  Widget build(BuildContext context) {
    List<String> players = context.watch<PlayerRepository>().getPlayerNames(data.players);
    List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(data.id);
    List<int> results = context.watch<RoundsRepository>().getTotalResult(rounds);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        for (final player in players)
                          Text(
                            player,
                            style: TextStyle(
                              color: textPrimaryColor,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        for(final result in results)
                          Text(
                            result.toString(),
                            style: TextStyle(
                              color: textPrimaryColor,
                              fontSize: 12,
                            ),
                          )
                      ],
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





