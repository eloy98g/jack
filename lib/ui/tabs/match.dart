import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
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
        final List<Round> rounds = context.watch<RoundsRepository>().getRoundsByMatchId(widget.matchData.id);
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

