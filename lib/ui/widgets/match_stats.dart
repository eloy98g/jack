import 'package:flutter/material.dart';

import '../../models/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';

class MatchStats extends StatelessWidget {
  final List<Round> rounds;
  final List<String> players;

  const MatchStats({Key key, this.rounds, this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<PlayerScore>> scoreList = getScoreList(players, rounds);
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: backgroundPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ESTADÍSTICAS',
                    style: TextStyle(
                      color: textPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ola'),
                      Text('ola'),
                    ],
                  ),
                  Expanded(
                    child: GameChart(rounds: rounds, players: players),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
