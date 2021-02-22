import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Match {
  final String id, game, lastRoundDate, name;
  final List<String> players;
  final int color, maxRounds, maxPoints;

  const Match(
      {this.id,
      this.name,
      this.game,
      this.lastRoundDate,
      this.players,
      this.color,
      this.maxRounds,
      this.maxPoints});

  factory Match.fromDocument(DocumentSnapshot document) {
    return Match(
      id: document.documentID,
      name: document['name'],
      game: document['game'],
      lastRoundDate: document['last_round_date'],
      players: document['players']?.cast<String>(),
      color: document['color'],
      maxRounds: document['max_rounds'],
      maxPoints: document['max_points']
    );
  }
}
