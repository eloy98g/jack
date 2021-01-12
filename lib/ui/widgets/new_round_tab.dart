import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
        final List<String> players = widget.data.players;
        final rounds = repository.getRoundsByMatchId(widget.data.id);
        List<int> results;
        String aux;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: Text('Nueva Ronda'),
          content: Builder(
            builder: (_) {
              return Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          for (final player in players)
                            Row(
                              children: [
                                Text(context.watch<PlayerRepository>().getPlayerById(player).name),
                                Separator(width: 8, height: 1)
                              ],
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          for (final player in players)
                            Row(
                              children: [
                                TextBoxCell(
                                  textInputType: TextInputType.number,
                                  validator: (string) =>
                                      int.tryParse(string) != null
                                          ? null
                                          : 'Escribe un número entero',
                                  onSaved: (string) =>
                                      setState(() => aux = string),
                                )
                              ],
                            )
                        ],
                      )
                    ],
                  ),
              );
            },
          ),
        );
      }
    );
  }
}