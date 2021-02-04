import 'package:flutter/services.dart';

import './index.dart';
import '../repositories/index.dart';

class PlayerScore {
  String name;
  int result;
}

List<PlayerScore> getScore(List<String> playerList, List<Round> roundList){
  List<PlayerScore> scoreList = List();
  PlayerScore score = new PlayerScore();

  // for(int i = 0; i < rounds.length; i++){
  //   score.result = 0;
  //   for(int j = 0; j < playerNames.length; j++){
  //     score.name = playerNames[j];
  //     score.result = score.result + rounds[i].results[j];
  //   }
  //   scoreList.add(score);
  // }
  score.name = 'void';
  score.result = 0;

  for(int i = 0; i < playerList.length; i++){
    scoreList.add(score);
  }

  for(int i = 0; i < playerList.length; i++){
    scoreList[i].name = playerList[i];
    score.result = 0;
    for(int j = 0; j < roundList.length; j++){
      score.result = score.result + roundList[j].results[i];
    }
    scoreList[i].result = score.result;
  }
  print('CONTENIDO');
  for(int i = 0; i < playerList.length; i++){
    print(scoreList[i].name);
    print(scoreList[i].result.toString());
  }
  return scoreList;
}

