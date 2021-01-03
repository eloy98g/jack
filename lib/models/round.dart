import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Round {
  final String id, date, matchId;
  final int index;
  final List<String> players;
  final List<int> results;

  const Round({
    this.id,
    this.date,
    this.matchId,
    this.index,
    this.players,
    this.results
  });

  factory Round.fromDocument(DocumentSnapshot document) {
    return Round(
      id: document.documentID,
      date: document['date'],
      matchId: document['match_id'],
      index: document['index'],
      players: document['players']?.cast<String>(),
      results: document['results']
    );
  }
}