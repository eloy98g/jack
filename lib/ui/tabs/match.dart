import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:provider/provider.dart';
import '../../utils/index.dart';
import '../../models/index.dart';
import '../widgets/match_card_score.dart';
import '../../repositories/round.dart';

class MatchDetails extends StatefulWidget {
  final Match matchData;

  const MatchDetails({Key key, this.matchData}) : super(key: key);

  @override
  _MatchDetails createState() => _MatchDetails();
}

class _MatchDetails extends State<MatchDetails> {
  @override
  Widget build(BuildContext context) {
    List<Round> rounds = context
        .watch<RoundsRepository>()
        .getRoundsByMatchId(widget.matchData.id);

    List<String> players =
        context.watch<PlayerRepository>().getPlayerNames(widget.matchData.players);

    bool hasMaxRound = widget.matchData.maxRounds != 0;
    bool hasMaxPoints = widget.matchData.maxPoints != 0;

    DateTime lastDate =  context.watch<RoundsRepository>().getLatestDate(rounds);

    return Scaffold(
        backgroundColor: backgroundSecondaryColor,
        appBar: AppBar(
          backgroundColor: backgroundPrimaryColor,
          title: Text(widget.matchData.name),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Separator(width: 1, height: 32),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: backgroundPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18.0),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'CLASIFICACIÓN',
                              style: TextStyle(
                                color: textPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Separator(width: 1, height: 12),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                hasMaxRound
                                    ? 'Ronda ${rounds.length.toString()} de ${widget.matchData.maxRounds}'
                                    : hasMaxPoints
                                        ? 'Meta: ${widget.matchData.maxPoints} puntos'
                                        : '\u221E',
                                style: TextStyle(
                                  color: textPrimaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Separator(width: 1, height: 12),
                            ScoreTab(data: widget.matchData, fontSize: 16),
                          ],
                        ),
                      ),
                    )),
                Separator(width: 1, height: 32),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: backgroundPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18.0),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'RONDAS',
                              style: TextStyle(
                                color: textPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Separator(width: 1, height: 12),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Últ. ronda: ${getFormatedDate(lastDate)}',
                                style: TextStyle(
                                  color: textPrimaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Separator(width: 1, height: 12),
                            //ScoreTab(data: widget.matchData, fontSize: 16),
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
