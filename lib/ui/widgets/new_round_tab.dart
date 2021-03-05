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
      String aux;
      final int roundCount = widget.numRounds + 1;

      final String _id = null;
      List<int> newResults = List();
      for (int i = 0; i < players.length; i++) {
        newResults.add(0);
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Separator(height: 12),
            Text(
              widget.data.maxRounds != 0
                  ? 'Ronda ${roundCount.toString()} / ${widget.data.maxRounds}'
                  : 'Ronda ${roundCount.toString()} / ?',
              style: TextStyle(
                fontSize: 16,
                color: textPrimaryColor,
              ),
            ),
          ],
        ),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
                width: 273,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: players.length,
                            separatorBuilder: (_, __) => Separator(height: 8),
                            itemBuilder: (_, index) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      players[index],
                                      style: TextStyle(
                                          color: borderButton, fontSize: 16),
                                    ),
                                    Separator(width: 40),
                                    Container(
                                      width: 100,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: textPrimaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Expanded(
                                          child: TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) {
                                          setState(() async {
                                            aux = text;
                                            newResults[index] = int.parse(aux);
                                          });
                                        },
                                      )),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          Separator(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                    width: 100,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: borderButton),
                                      color: backgroundThirdColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color: textPrimaryColor,
                                            fontSize: 16),
                                      ),
                                    )),
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              Separator(width: 12),
                              InkWell(
                                child: Container(
                                    width: 100,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: borderButton),
                                      color: backgroundThirdColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Aceptar',
                                        style: TextStyle(
                                            color: textPrimaryColor,
                                            fontSize: 16),
                                      ),
                                    )),
                                onTap: () async {
                                  repository
                                      .appendRound(
                                        id: _id,
                                        date: DateTime.now(),
                                        matchId: widget.data.id,
                                        index: roundCount,
                                        results: newResults,
                                      )
                                      .then((value) =>
                                          Navigator.of(context).pop());
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
