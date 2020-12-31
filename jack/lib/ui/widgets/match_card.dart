import 'package:flutter/material.dart';

import '../../models/index.dart';

class MatchCard extends StatelessWidget {
  final Match data;

  const MatchCard(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(data.lastRoundDate),
          Text(data.name)
        ],
      ),
    );
  }
}
