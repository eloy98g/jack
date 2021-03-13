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

  for (int i = 0; i < roundList.length; i++) {
    List<PlayerScore> scores = new List();
    for (int j = 0; j < playerList.length; j++) {
      PlayerScore score = new PlayerScore();
      score.name = playerList[j];
      score.result = roundList[i].results[j];
      scores.insert(j, score);
      sortScore(scores);
    }

    scoreList.insert(i, scores);
  }

  return scoreList;
}

void sortScore(List<PlayerScore> scoreList) {
  scoreList.sort((a, b) => b.result.compareTo(a.result));
}

List<int> getRoundsScoreByPlayer(
    String player, List<String> playerList, List<Round> roundList) {
  List<int> resultList = List();

  int aux = 0;
  print('ola00');
  resultList.insert(0, aux);

  for (var i = 0; i < playerList.length; i++) {
    if (player == playerList[i]) {
      for (var j = 1; j < roundList.length; j++) {
        aux = aux + roundList[j].results[i];
        resultList.insert(j, aux);
      }
    }
  }
  return resultList;
}

// int maxScore(List<Round> roundList) {
//   int maxValue = 0;
//   for (var i = 0; i < roundList.length; i++) {
//     for (var j = 0; j < roundList[0].results.length; j++) {
//       if (maxValue < roundList[i].results[j]) {
//         maxValue = roundList[i].results[j];
//       }
//     }
//   }
//   print(maxValue);
//   return maxValue;
// }

List<List<PlayerScore>> scoreSeries(
    List<String> playerList, List<Round> roundList) {
  List<List<PlayerScore>> scoreList = List();

  for (int i = 0; i < roundList.length; i++) {
    List<PlayerScore> scores = new List();
    for (int j = 0; j < playerList.length; j++) {
      PlayerScore score = new PlayerScore();
      score.name = playerList[j];
      score.result = roundList[i].results[j];
      scores.insert(j, score);
      sortScore(scores);
    }

    scoreList.insert(i, scores);
  }

  return scoreList;
}
