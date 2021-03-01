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
  final int numRounds;

  const RoundEditTab({Key key, this.data, this.numRounds}) : super(key: key);

  @override
  _RoundEditTab createState() => _RoundEditTab();
}

class _RoundEditTab extends State<RoundEditTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<RoundsRepository>(builder: (context, repository, child) {
      List<String> players =
          context.watch<PlayerRepository>().getPlayerNames(widget.data.players);
      List<int> newResults = List();
      String aux;
      final int roundCount = widget.numRounds + 1;

      final scoreRow = <Widget>[];
      final index = widget.data.players.length;
      for (var i = 0; i < index; i++) {
        scoreRow.add(new Row(
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
              )),
            )
          ],
        ));
      }

      return AlertDialog(
        backgroundColor: backgroundThirdColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nueva Ronda',
              style: TextStyle(
                color: textPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Separator(height: 12),
            Text(
              widget.data.maxRounds != 0
                  ? 'Ronda ${roundCount.toString()} / ${widget.data.maxRounds}'
                  : 'Ronda ${roundCount.toString()} / ?',
              style: TextStyle(
                color: textPrimaryColor,
              ),
            ),
          ],
        ),
        content: Container(),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                color: textPrimaryColor,
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Separator(width: 12),
              RaisedButton(
                color: textPrimaryColor,
                child: Text(
                  'Aceptar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        ],
      );

      // return AlertDialog(
      //   title: Text('Ronda ${index + 1}'),
      //   content: Column(children: scoreRow),
      //   actions: [
      //     FlatButton(
      //       child: Text('Ace'),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // );
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
    });
  }
}
