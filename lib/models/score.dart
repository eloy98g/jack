import 'package:flutter/services.dart';

import './index.dart';
import '../repositories/index.dart';

class PlayerScore {
  String name;
  int result;
}

List<PlayerScore> getScore(List<String> playerList, List<Round> roundList){
  List<PlayerScore> scoreList = List();

  for(int i = 0; i < playerList.length; i++){
    PlayerScore score = new PlayerScore();
    score.name = playerList[i];
    score.result = 0;
    for(int j = 0; j < roundList.length; j++){
      score.result = score.result + roundList[j].results[i];
    }
    score.result = score.result;
    scoreList.insert(i, score);
  }

  sortScore(scoreList);
  return scoreList;
}

void sortScore(List<PlayerScore> scoreList){
  scoreList.sort((a, b) => b.result.compareTo(a.result));
}
