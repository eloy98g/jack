import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_input/flutter_input.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';
import '../../models/index.dart';

class RoundEditTab extends StatefulWidget {
  final Match data;

  const RoundEditTab({Key key, this.data}) : super(key: key);

  @override
  _RoundEditTab createState() => _RoundEditTab();
}

class _RoundEditTab extends State<RoundEditTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<RoundsRepository>
      (builder: (context, repository, child) {
        List<String> players = context.watch<PlayerRepository>().getPlayerNames(widget.data.players);
        List<int> newResults = List();
        String aux;
        final scoreRow = <Widget>[];
        final index = widget.data.players.length;
        for(var i = 0; i < index ; i++){
          scoreRow.add(
            new Row(
              children: [
                Text(players[i]),
                Separator(width: 8, height: 1),
                Container(
                  width: 100,
                  height: 50,
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                       setState(() {
                          aux = text;
                        });
                      },
                    )
                  ),
                )
              ],
            )
          );
        }
        return AlertDialog(
          title: Text('Ronda ${index + 1}'),
          content: Column(children: scoreRow),
          actions: [
            FlatButton(
              child: Text('Ace'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );      
        // return Container(
        //   width: 300,
        //   height: 500,
        //   child: AlertDialog(
        //     backgroundColor: backgroundSecondaryColor,
        //     content: Builder(
        //       builder: (_) {
        //         return Form(
        //             key: _formKey,
        //             child: Row(
        //               children: [
        //                 Column(
        //                   children: scoreRow,
        //                 )
        //               ],
        //             ),
        //         );
        //       },
        //     ),
        //   ),
        // );
      }
    );
  }
}


