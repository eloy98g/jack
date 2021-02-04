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

  const ScoreTab(this.data); 
  @override
  Widget build(BuildContext context) {
    List<String> players = context.watch<PlayerRepository>().getPlayerNames(data.players);
    List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(data.id);

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final score in getScore(players, rounds))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        score.name,
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        score.result.toString(),
                        style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
              ],
            )
          ),
        ],
      )
    );
  }
}
