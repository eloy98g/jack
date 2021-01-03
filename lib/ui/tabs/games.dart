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
    return Consumer<PlayerRepository>(
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
                    for (final player in repository.getPlayersByMatchId('G4QLlGk4uo08f5qdwsHI'))
                      Column(
                        children: [
                          Text('---------DEBUGGING---------'),
                          Text(player.name),
                          Text(player.token),
                          Text(player.photoUrl),
                        ],
                      ),
                      Separator(width: 1,height: 10,)
                  ],
                )
              ],
          ),
      ),
    );
  }
}