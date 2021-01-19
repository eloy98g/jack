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





