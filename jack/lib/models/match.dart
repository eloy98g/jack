import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Match {
  final String id, gameId, lastRoundDate, name;
  final List<String> players;

  const Match({
    this.id,
    this.name,
    this.gameId,
    this.lastRoundDate,
    this.players
  });

  factory Match.fromDocument(DocumentSnapshot document) {
    return Match(
      id: document.documentID,
      name: document['name'],
      gameId: document['game_id'],
      lastRoundDate: document['last_round_date'],
      players: document['players']?.cast<String>(),
    );
  }
}