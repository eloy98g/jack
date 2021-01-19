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
        //final List<PlayerScore> scores  = setPlayerScores(context, widget.matchData.id);

        return Scaffold(
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
                      Text('ola'),
                      // for(final score in scores)
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         '${score.name}',
                      //         style: TextStyle(
                      //           color: textPrimaryColor,
                      //           fontSize: 12,
                      //         ),
                      //       ),
                      //       Text(
                      //         '(${score.score.toString()})',
                      //         style: TextStyle(
                      //           color: textPrimaryColor,
                      //           fontSize: 12,
                      //         ),
                      //       )
                      //     ],
                      //   )
                    ],
                  ),
                )
                
              ],
            )
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RoundEditTab(
                  data: widget.matchData,
                ),
              ),
            ),
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        );
      }
    );
  }
}


// return Scaffold(
//       backgroundColor: backgroundSecondaryColor,
//       appBar: AppBar(
//         backgroundColor: backgroundPrimaryColor,
//         title: Text(matchData.name),
//       ),
//       body: Consumer<RoundsRepository>
//     );

