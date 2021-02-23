import 'package:flutter/services.dart';

import './index.dart';
import '../repositories/index.dart';

class PlayerScore {
  String name;
  int result;
}

List<PlayerScore> getFinalScore(List<String> playerList, List<Round> roundList) {
  List<PlayerScore> scoreList = List();

  for (int i = 0; i < playerList.length; i++) {
    PlayerScore score = new PlayerScore();
    score.name = playerList[i];
    score.result = 0;
    for (int j = 0; j < roundList.length; j++) {
      score.result = score.result + roundList[j].results[i];
    }
    scoreList.insert(i, score);
  }

  sortScore(scoreList);
  return scoreList;
}

List<List<PlayerScore>> getScoreList(List<String> playerList, List<Round> roundList){
  List<List<PlayerScore>> scoreList = List();
  List<PlayerScore> scores = List();

  for (int i = 0; i < playerList.length; i++) {
    for (int j = 0; j < roundList.length; j++) {
      PlayerScore score = new PlayerScore();
      score.name = playerList[i];
      score.result = roundList[j].results[i];
      scores.insert(i, score);
    }
    sortScore(scores);
    scoreList.insert(i, scores);
  }

  return scoreList;
}

void sortScore(List<PlayerScore> scoreList) {
  scoreList.sort((a, b) => b.result.compareTo(a.result));
}
