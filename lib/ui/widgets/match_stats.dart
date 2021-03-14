import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import '../../models/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';

class MatchStats extends StatelessWidget {
  final List<Round> rounds;
  final List<String> players;

  const MatchStats({
    Key key,
    this.rounds,
    this.players,
  }) : super(key: key);

  List<Color> getColors(int count) {
    List<Color> colors = <Color>[];
    Color _color;
    final List<ColorHue> _hueType = <ColorHue>[
      ColorHue.green,
      ColorHue.red,
      ColorHue.pink,
      ColorHue.purple,
      ColorHue.blue,
      ColorHue.yellow,
      ColorHue.orange
    ];
    for (var i = 0; i < count; i++) {
      _color = RandomColor().randomColor(
        colorHue: ColorHue.multiple(colorHues: _hueType),
      );
      print(_color.toString());
      colors.insert(i, _color);
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = getColors(players.length);

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: backgroundPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ESTADÍSTICAS',
                    style: TextStyle(
                      color: textPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 280,
                        width: 70,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              Text('ola'),
                              // Column(
                              //   children: [
                              //     ListView.builder(
                              //       shrinkWrap: true,
                              //       itemCount: players.length,
                              //       itemBuilder: (_, index) {
                              //         return Text(
                              //           //players[index],
                              //           'ola',
                              //           style: TextStyle(
                              //             //color: colors[index],
                              //             fontSize: 16,
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('button'),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 5,
                    child: GameChart(
                      rounds: rounds,
                      players: players,
                      colors: colors,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
