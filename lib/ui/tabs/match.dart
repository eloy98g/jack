import 'package:flutter/material.dart';
import '../../utils/index.dart';
import '../../models/index.dart';

class MatchDetails extends StatelessWidget {
  final Match matchData;

  const MatchDetails({Key key, this.matchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundSecondaryColor,
      appBar: AppBar(
        backgroundColor: backgroundPrimaryColor,
        title: Text(matchData.name),
      ),
    );
  }
}


