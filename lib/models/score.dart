import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import './index.dart';
import '../repositories/index.dart';

class PlayerScore {
  String name;
  int result;
}

List<PlayerScore> getFinalScore(
    List<String> playerList, List<Round> roundList) {
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

List<List<PlayerScore>> getScoreList(
    List<String> playerList, List<Round> roundList) {
  List<List<PlayerScore>> scoreList = List();
  List<PlayerScore> scores = new List();

  for (int i = 0; i < roundList.length; i++) {
    scores.clear();
    print('remueve');
    for (int j = 0; j < playerList.length; j++) {
      PlayerScore score = new PlayerScore();
      score.name = playerList[j];
      score.result = roundList[i].results[j];
      scores.insert(j, score);
      print('creada: ${score.name} ${score.result}');
    }
    scoreList.insert(i, scores);
    print('inserta');
  }

  print('----------------------------');
  for (int i = 0; i < scoreList.length; i++) {
    print('RONDA $i');
    print('Longitud list list: ${scoreList.length}');
    print('Longitud list: ${scoreList[0].length}');
    for (int j = 0; j < playerList.length; j++) {
      print('${scoreList[i][j].name} --- ${scoreList[i][j].result}');
    }
    print('----------------------------');
  }
  return scoreList;
}

void sortScore(List<PlayerScore> scoreList) {
  scoreList.sort((a, b) => b.result.compareTo(a.result));
}
