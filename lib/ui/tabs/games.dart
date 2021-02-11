// import 'package:flutter/material.dart';

// class Games extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('game page WIP');
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';

class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoundsRepository>(
      builder: (context, repository, child) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: repository.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      Text('estoy eh'),
                      for (final round in repository
                          .getRoundsByMatchId('G4QLlGk4uo08f5qdwsHI'))
                        Column(
                          children: [
                            Text('---------DEBUGGING---------'),
                            Text(round.date.toString()),
                            Text(round.results.length.toString())
                          ],
                        ),
                      Separator(
                        width: 1,
                        height: 10,
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
