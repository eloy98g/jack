import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';

class PlayerScore {
  String name;
  int score;
}

class ScoreTab extends StatelessWidget {
  final Match data;

  const ScoreTab(this.data); 

  @override
  Widget build(BuildContext context) {
    PlayerScore playerScore;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1º Emma',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: 9,
            ),
          ),
          Text(
            '2º Eloy',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: 9,
            ),
          ),
        ],
      )
    );
  }
}


