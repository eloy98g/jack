import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:provider/provider.dart';
import '../../utils/index.dart';
import '../../models/index.dart';
import '../widgets/match_card_score.dart';

class MatchDetails extends StatefulWidget {
  final Match matchData;

  const MatchDetails({Key key, this.matchData}) : super(key: key);

  @override
  _MatchDetails createState() => _MatchDetails();
}

class _MatchDetails extends State<MatchDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<RoundsRepository>(
      builder: (context, repository, child) {
        List<String> players = context.watch<PlayerRepository>().getPlayerNames(widget.matchData.players);
        List<Round> roundList = repository.getRoundsByMatchId(widget.matchData.id);
        List<int> results = repository.getTotalResult(roundList);
        
        String aux;
        final scoreRow = <Widget>[];
        final roundsNum = roundList.length;
        final playerIndex = widget.matchData.players.length;
        List<int> newResults = List();
        for(int i = 0; i<playerIndex; i++){
          newResults.add(0);
        }

        final id = null;

        for(var i = 0; i < playerIndex ; i++){
          scoreRow.add(
            new Row(
              children: [
                Text(players[i]),
                Separator(width: 8, height: 1),
                Container(
                  width: 80,
                  height: 30,
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                       setState(() async {
                          aux = text;
                          newResults[i] = int.parse(aux);
                          print(newResults[i]);
                        });
                      },
                    )
                  ),
                )
              ],
            )
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundSecondaryColor,
          appBar: AppBar(
            backgroundColor: backgroundPrimaryColor,
            title: Text(widget.matchData.name),
          ),
          body:  Container(
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
                      ),
                      Text('NUEVA RONDA'),
                      Text('Ronda: ${roundsNum + 1}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: scoreRow,
                          )
                        ],
                      ),
                      FlatButton(
                        child: Text('Aceptar'),
                        onPressed: () async {
                           repository
                            .appendRound(
                              id: id,
                              date: '19-1-21',
                              matchId: widget.matchData.id,
                              index: (roundsNum +1),
                              results: newResults,
                            )
                            .then((value) => Navigator.of(context).pop());
                        }
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          // floatingActionButton: new FloatingActionButton(
          //   onPressed: () => Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (_) => RoundEditTab(
          //         data: widget.matchData,
          //       ),
          //     ),
          //   ),
          //   tooltip: 'Increment',
          //   child: new Icon(Icons.add),
          // ),
        );
      }
    );
  }
}
